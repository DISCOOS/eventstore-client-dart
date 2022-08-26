import 'dart:async';
import 'dart:convert';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/helpers.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

typedef ClientCreator = EventStoreStreamsClient Function();

class EventStoreClientHarness {
  static const int PORT_2113 = 2113;
  static const int PORT_2114 = 2114;
  static const String EVENT_TYPE_TEST = '-';
  static const UserCredentials DefaultCredentials = UserCredentials(
    'admin',
    'changeit',
  );

  Logger? _logger;
  bool _debug = false;

  EventStoreClientHarness withLogger({
    Level level = Level.INFO,
    bool debug = false,
  }) {
    _debug = debug;
    Logger.root.level = level;
    _logger = Logger('$runtimeType');
    return this;
  }

  Stream<LogRecord>? get onRecord => Logger.root.onRecord;

  String streamId({
    String? suffix,
    String? connectionName,
  }) =>
      '${_clients[connectionName ?? '$EventStoreStreamsClient']!.settings.connectionName}_${suffix ?? DateTime.now().millisecondsSinceEpoch}';

  StreamState newStreamState(
    StreamStateType type, {
    String? suffix,
    LogPosition? position,
    String? connectionName,
    StreamRevision? revision,
  }) {
    return StreamState(
      streamId(
        suffix: '${enumName(type)}'
            '_${suffix ?? DateTime.now().microsecondsSinceEpoch}',
        connectionName: connectionName,
      ),
      type,
      position: position,
      revision: revision,
    );
  }

  EventStoreStreamsClient client({String? connectionName}) =>
      _clients[connectionName ?? '$EventStoreStreamsClient']!;

  final Map<String, ClientCreator> _creators = {};
  final Map<String, EventStoreStreamsClient> _clients = {};

  EventStoreClientHarness withClient({
    bool secure = false,
    String? connectionName,
    bool verifyCert = false,
    List<int>? certificates,
    EventStoreClientSettings? settings,
    UserCredentials? defaultCredentials,
    List<EndPoint> gossipSeeds = const [],
    String? publicKeyPath = 'test/certs/ca/ca.crt',
    NodePreference nodePreference = NodePreference.leader,
  }) {
    final name = connectionName ?? '$EventStoreStreamsClient';
    final config = (settings ?? EventStoreClientSettings.v20_LTS);
    _register(
      name,
      () {
        return EventStoreStreamsClient(
          config.copyWith(
            useTls: secure,
            connectionName: name,
            gossipSeeds: gossipSeeds,
            nodePreference: nodePreference,
            defaultCredentials: defaultCredentials,
            tlsSetup: config.tlsSetup.copyWith(
              verifyCert: verifyCert,
              certificates: certificates,
              publicKeyPath: publicKeyPath,
            ),
            singleNode: gossipSeeds.isEmpty ? EndPoint.loopbackIPv4 : null,
          ),
        );
      },
    );
    return this;
  }

  void _register(String connectionName, ClientCreator creator) {
    _creators.update(
      connectionName,
      (creators) => creator,
      ifAbsent: () => creator,
    );
  }

  void install(
    EventStoreImage image, {
    bool secure = false,
    bool restart = false,
    int grpcPort = PORT_2113,
    int gossipPort = PORT_2114,
    bool enableGossip = true,
    bool withTestData = false,
    bool? startSystemProjections,
    String runProjections = 'none',
    Duration? timeoutAfter = const Duration(seconds: 5),
  }) {
    Timer? timeout;
    final server = EventStoreServerSingleNode(
      image,
      secure: secure,
      grpcPort: grpcPort,
      gossipPort: gossipPort,
      withTestData: withTestData,
      hostCertificatePath: 'test/certs',
    );
    StreamSubscription<LogRecord>? printer;
    setUpAll(() async {
      if (_debug) {
        printer = onRecord?.listen(
          (rec) => print(rec),
        );
      }
      _logger?.info('---setUpAll---');

      if (!restart) {
        await server.start(
          enableGossip: enableGossip,
          runProjections: runProjections,
          startSystemProjections: startSystemProjections,
        );
      }

      _creators.forEach((name, creator) {
        _open(name, creator);
      });
      _logger?.info('---setUpAll--->ok');
      return Future<void>.value();
    });

    setUp(() async {
      if (restart) {
        await server.start(
          enableGossip: enableGossip,
          runProjections: runProjections,
          startSystemProjections: startSystemProjections,
        );
      }
      if (timeoutAfter != null) {
        timeout = Timer(
          timeoutAfter,
          () => throw Exception('Test timeout'),
        );
      }
    });

    tearDown(() async {
      timeout?.cancel();
      if (restart) {
        await server.stop();
      }
    });

    tearDownAll(() async {
      timeout?.cancel();
      _logger?.info('---tearDownAll---');
      try {
        if (!restart) {
          await server.stop();
        }
        await Future.wait([
          ..._clients.values.map(
            (e) => e.shutdown(),
          )
        ]);
        return await printer?.cancel();
      } finally {
        _clients.clear();
        _logger?.info('---tearDownAll--->ok');
      }
    });
  }

  EventStoreStreamsClient _open(
    String connectionName,
    EventStoreStreamsClient Function() create,
  ) {
    final client = create();
    _clients.update(
      connectionName,
      (_) => client,
      ifAbsent: () => client,
    );
    return client;
  }

  Iterable<EventData> createTestEvents({
    int count = 1,
    int metadataSize = 1,
    String? type = EVENT_TYPE_TEST,
  }) =>
      List.generate(
        count,
        (index) => createTestEvent(
          index,
          type: type,
          metadataSize: metadataSize,
        ),
      );

  EventData createTestEvent(
    int index, {
    int metadataSize = 1,
    String? type = EVENT_TYPE_TEST,
  }) =>
      EventData(
        data: createTestData(index),
        type: type ?? EVENT_TYPE_TEST,
        uuid: UuidV4.newUuid().value.uuid,
        metadata: createTestMetaData(metadataSize),
      );

  Iterable<int> createTestData(int index) => utf8.encode('{"x":$index}');
  Iterable<int> createTestMetaData([int size = 1]) => utf8.encode(
        '"${'\$' * size}"',
      );
}

void expectEvents(
  EventStoreClientHarness harness,
  Iterable<ResolvedEvent> actual,
  Iterable<EventData> all, {
  int? count,
  int offset = 0,
  bool forward = true,
}) {
  final events = forward
      ? List<EventData>.from(all)
      : List<EventData>.from(all).reversed.toList();

  count ??= all.length;

  expect(
    actual.map((e) => e.originalEvent.eventNumber),
    equals(List.generate(
      count,
      (index) => StreamPosition.checked(
        offset + (forward ? index : all.length - index - 1),
      ),
    )),
    reason: 'Event numbers should match',
  );

  expect(
    actual.map((e) => utf8.decode(e.originalEvent.data)),
    equals(List.generate(
      count,
      (index) => utf8.decode(
        events[offset + index].data,
      ),
    )),
    reason: 'Event data should match',
  );

  expect(
    actual.map((e) => utf8.decode(e.originalEvent.metadata)),
    equals(List.generate(
      count,
      (index) => utf8.decode(
        events[offset + index].metadata,
      ),
    )),
    reason: 'Event metadata should match',
  );

  expect(
    actual.map((e) => e.originalEvent.eventId),
    equals(events.skip(offset).take(count).map((e) => e.uuid)),
    reason: 'Event uuids should match',
  );
}

void expectStreamEvents(
  EventStoreClientHarness harness,
  StreamState state,
  Iterable<ResolvedEvent> actual,
  Iterable<EventData> events, {
  int? count,
  int? offset,
}) {
  count ??= events.length;
  offset ??=
      state.isStreamExists ? (state.revision?.value.toInt() ?? 0) + 1 : 0;

  expectEvents(
    harness,
    actual,
    events,
    forward: true,
    count: count,
    offset: offset,
  );

  expect(
    actual.map((e) => e.originalEvent.eventStreamId),
    equals(List.generate(
      events.skip(offset).take(count).length,
      (index) => state.streamId,
    )),
    reason: 'Event stream id should match',
  );
}

Future<void> testClientAppendsEvents(
  EventStoreClientHarness harness,
  StreamState state,
  Iterable<EventData> append, {
  Iterable<EventData> exists = const [],
}) async {
  // Arrange
  final client = harness.client();
  expect(client, isA<EventStoreStreamsClient>());
  final count = append.length;
  final offset = state.isStreamExists
      ? (state.revision?.value.toInt() ?? 0) + 1
      : exists.length;

  // Apply events
  final writeResult = await client.append(
    state,
    Stream.fromIterable(append),
  );
  expect(writeResult, isA<WriteSuccessResult>());
  expect(writeResult.actualType, equals(StreamStateType.stream_exists));
  expect(
    writeResult.nextExpectedStreamRevision,
    StreamRevision.checked(offset + count - 1),
  );

  // Assert stream contains events
  final readResult = await client.read(
    state.streamId,
    position: StreamPosition.checked(offset),
  );
  expect(readResult.isOK, isTrue);
  expect(readResult.streamId, state.streamId);
  final actual = await readResult.stream.toList();
  expectStreamEvents(
    harness,
    state,
    actual,
    [...exists, ...append],
    count: append.length,
    offset: exists.length,
  );
  expect(
    readResult.nextExpectedStreamRevision,
    StreamRevision.checked(offset + count - 1),
  );
}

Future<StreamRevision> testRecreatesSoftDeletedStreamWithGivenState(
  EventStoreClientHarness harness,
  EventStoreStreamsClient client,
  StreamState actual,
  StreamState expected,
  Iterable<EventData> exists,
) async {
  // Arrange
  await client.delete(actual);

  // This is a workaround until github issue
  // https://github.com/EventStore/EventStore/issues/1744
  // is fixed
  await Future<void>.delayed(Duration(milliseconds: 50));

  // Act
  const count = 3;
  final events = harness.createTestEvents(count: count);
  final expectedRevision = StreamRevision.checked(
    exists.length + count - 1,
  );
  final writeResult = await client.append(
    expected,
    Stream.fromIterable(events),
  );
  expect(writeResult, isA<WriteSuccessResult>());
  expect(writeResult.actualType, equals(StreamStateType.stream_exists));
  expect(writeResult.nextExpectedStreamRevision, expectedRevision);

  // Assert Read Operation
  final readResult = await client.read(
    expected.streamId,
    position: StreamPosition.start,
  );
  final resolved = await readResult.events;
  expect(readResult.isOK, isTrue);
  expect(readResult.nextExpectedStreamRevision, expectedRevision);
  expect(resolved.length, count);
  expect(
    resolved.map((e) => e.originalEvent.eventId),
    events.map((e) => e.uuid),
  );
  expect(
    resolved.map((e) => e.originalEventNumber),
    List.generate(
      count,
      (index) => StreamPosition.checked(exists.length + index),
    ),
  );

  // This is a workaround until github issue
  // https://github.com/EventStore/EventStore/issues/1744
  // is fixed
  await Future<void>.delayed(Duration(milliseconds: 500));

  // Assert Metadata Operation
  final metadataResult = await client.getStreamMetadata(expected.streamId);
  expect(metadataResult.isOK, isTrue);
  expect(
    metadataResult.metadata!.truncateBefore,
    StreamPosition.checked(exists.length),
  );
  return expectedRevision;
}

Future<Iterable<ResolvedEvent>> waitFor(
  Stream<ResolvedEvent> broadcast, {
  int? expectedCount,
  Duration? timeoutAfter = const Duration(milliseconds: 100),
}) async {
  final list = expectedCount == null
      ? broadcast.toList()
      : broadcast.take(expectedCount).toList();
  return timeoutAfter == null
      ? list
      : list.timeout(
          timeoutAfter,
          onTimeout: () => const [],
        );
}

Iterable<ResolvedEvent> withoutSystemEvents(Iterable<ResolvedEvent> appeared) {
  return appeared.where(
    (e) => !SystemStreams.isSystemStream(
      e.originalStreamId,
    ),
  );
}

Future<Iterable<EventData>> seed(
  EventStoreClientHarness harness,
  EventStoreStreamsClient client,
  StreamState state,
  int count, {
  String eventType = EventStoreClientHarness.EVENT_TYPE_TEST,
}) async {
  final exists = harness.createTestEvents(
    count: count,
    type: eventType,
  );
  final result = await client.append(
    state,
    Stream.fromIterable(exists),
  );
  expect(result, isA<WriteSuccessResult>());
  expect(result.actualType, equals(StreamStateType.stream_exists));
  return exists;
}

String toResolvedEventString(ResolvedEvent e) => {
      'type': e.event.eventType,
      'data': utf8.decode(
        e.event.data,
      )
    }.toString();

String toEventDataString(EventData e) => {
      'type': e.type,
      'data': utf8.decode(
        e.data,
      )
    }.toString();
