import 'dart:async';
import 'dart:convert';

import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/enums.dart';
import 'package:eventstore_client_dart/src/core/helpers.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/core/resolved_event.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import 'server/eventstore_server.dart';
import 'server/server_single_node.dart';

typedef ClientCreator = EventStoreClient Function();

class EventStoreDBClientHarness {
  EventStoreDBClientHarness._();
  factory EventStoreDBClientHarness() {
    if (!exists) {
      _singleton = EventStoreDBClientHarness._();
    }
    return _singleton!;
  }

  static const int PORT_2113 = 2113;
  static const int PORT_2114 = 2114;
  static const String EVENT_TYPE_TEST = '-';
  static const UserCredentials DefaultCredentials = UserCredentials(
    'admin',
    'changeit',
  );

  static EventStoreDBClientHarness? _singleton;
  static EventStoreDBClientHarness? get instance => _singleton;
  static bool get exists => _singleton != null;

  Logger? _logger;
  bool _debug = false;

  EventStoreDBClientHarness withLogger({
    Level level = Level.INFO,
    bool debug = false,
  }) {
    _debug = debug;
    Logger.root.level = level;
    _logger = Logger('$runtimeType');
    return this;
  }

  Stream<LogRecord>? get onRecord => Logger.root.onRecord;

  String streamName({
    String? suffix,
    String? connectionName,
  }) =>
      _clients[connectionName ?? '$EventStoreClient']!.settings.connectionName +
      '_${suffix ?? DateTime.now().millisecondsSinceEpoch}';

  StreamState newStreamState(
    StreamStateType type, {
    String? suffix,
    LogPosition? position,
    String? connectionName,
    StreamRevision? revision,
  }) {
    return StreamState(
      streamName(
        suffix: '${enumName(type)}'
            '_${suffix ?? DateTime.now().millisecondsSinceEpoch}',
        connectionName: connectionName,
      ),
      type,
      position,
      revision,
    );
  }

  EventStoreClient client({String? connectionName}) =>
      _clients[connectionName ?? '$EventStoreClient']!;

  final Map<String, ClientCreator> _creators = {};
  final Map<String, EventStoreClient> _clients = {};

  EventStoreDBClientHarness withStreamsClient({
    bool secure = false,
    String? connectionName,
    EventStoreClientSettings? settings,
    UserCredentials? defaultCredentials,
  }) {
    final name = connectionName ?? '$EventStoreClient';
    _register(
      name,
      () {
        return EventStoreClient(
          settings ??
              EventStoreClientSettings(
                useTls: secure,
                connectionName: name,
                singleNode: EndPoint.loopbackIPv4,
                defaultCredentials: defaultCredentials,
                publicKeyPath:
                    secure ? 'test/certs/ca/ca.crt' : Defaults.PublicKeyPath,
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

  void install({
    bool secure = false,
    int grpcPort = PORT_2113,
    int gossipPort = PORT_2114,
    bool withTestData = false,
    String imageTag = '20.10.4-buster-slim',
  }) {
    Timer? _timeout;
    final server = EventStoreServerSingleNode(
      secure: secure,
      imageTag: imageTag,
      grpcPort: grpcPort,
      gossipPort: gossipPort,
      withTestData: withTestData,
      hostCertificatePath: 'test/certs',
    );
    StreamSubscription<LogRecord>? _printer;
    setUpAll(() async {
      if (_debug) {
        _printer = onRecord?.listen(
          (rec) => print(rec),
        );
      }
      _logger?.info('---setUpAll---');

      await server.start();

      _creators.forEach((name, creator) {
        _open(name, creator);
      });
      _logger?.info('---setUpAll--->ok');
      return Future<void>.value();
    });

    setUp(() async {
      _timeout = Timer(
        const Duration(seconds: 5),
        () => throw Exception('Test timeout'),
      );
    });

    tearDown(() {
      _timeout?.cancel();
    });

    tearDownAll(() async {
      _timeout?.cancel();
      _logger?.info('---tearDownAll---');
      try {
        await Future.wait([
          ..._clients.values.map(
            (e) => e.shutdown(),
          )
        ]);
        await server.stop();
        return await _printer?.cancel();
      } finally {
        _clients.clear();
        _logger?.info('---tearDownAll--->ok');
      }
    });
  }

  EventStoreClient _open(
    String connectionName,
    EventStoreClient Function() create,
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
        uuid: Uuid().v4(),
        type: type ?? EVENT_TYPE_TEST,
        data: createTestData(index),
        metadata: createTestMetaData(metadataSize),
      );

  Iterable<int> createTestData(int index) => utf8.encode('{"x":$index}');
  Iterable<int> createTestMetaData([int size = 1]) => utf8.encode(
        '"${'\$' * size}"',
      );
}

void expectEvents(
  EventStoreDBClientHarness harness,
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
  EventStoreDBClientHarness harness,
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
      (index) => state.name,
    )),
    reason: 'Event stream id should match',
  );
}

Future<void> testClientAppendsEvents(
  EventStoreDBClientHarness harness,
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
  final readResult = await client.readFromStream(
    state.name,
    StreamPosition.checked(offset),
  );
  expect(readResult.isOK, isTrue);
  expect(readResult.streamName, state.name);
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
  EventStoreDBClientHarness harness,
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
  final readResult = await client.readFromStream(
    expected.name,
    StreamPosition.start,
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
  final metadataResult = await client.getStreamMetadata(expected.name);
  expect(metadataResult.isOK, isTrue);
  expect(
    metadataResult.metadata!.truncateBefore,
    StreamPosition.checked(exists.length),
  );
  return expectedRevision;
}
