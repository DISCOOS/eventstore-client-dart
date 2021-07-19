import 'dart:async';
import 'dart:convert';

import 'package:docker_process/docker_process.dart';
import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/enums.dart';
import 'package:eventstore_client_dart/src/core/helpers.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/core/resolved_event.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

typedef ClientCreator = EventStoreClientBase Function(ClientChannel);

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

  static EventStoreDBClientHarness? _singleton;
  static EventStoreDBClientHarness? get instance => _singleton;
  static bool get exists => _singleton != null;

  Logger? _logger;

  EventStoreDBClientHarness withLogger({
    Level level = Level.INFO,
  }) {
    Logger.root.level = level;
    _logger = Logger('$runtimeType');
    return this;
  }

  Stream<LogRecord>? get onRecord => _logger?.onRecord;

  String streamName<T extends EventStoreClientBase>({
    String? suffix,
    int port = PORT_2113,
  }) =>
      (_clients[port]?[T] as T).connectionName +
      '_${suffix ?? DateTime.now().millisecondsSinceEpoch}';

  StreamState streamState<T extends EventStoreClientBase>(
    StreamStateType type, {
    int port = PORT_2113,
    String? suffix,
    LogPosition? position,
    StreamRevision? revision,
  }) {
    return StreamState(
      streamName<T>(
        suffix: '${enumName(type)}'
            '_${suffix ?? DateTime.now().millisecondsSinceEpoch}',
      ),
      type,
      position,
      revision,
    );
  }

  T client<T extends EventStoreClientBase>({int port = PORT_2113}) =>
      _clients[port]?[T] as T;

  final Map<int, ClientChannel> _channels = {};
  final Map<int, Map<Type, ClientCreator>> _creators = {};
  final Map<int, Map<Type, EventStoreClientBase>> _clients = {};

  EventStoreDBClientHarness withStreamsClient({
    int port = PORT_2113,
    String? connectionName,
  }) {
    _register(
      port,
      (ClientChannel channel) {
        return EventStoreStreamsClient(
          connectionName ?? '$EventStoreStreamsClient',
          channel,
        );
      },
    );
    return this;
  }

  void _register(int port, ClientCreator creator) {
    _creators.update(
      port,
      (creators) => creators
        ..putIfAbsent(
          EventStoreStreamsClient,
          () => creator,
        ),
      ifAbsent: () => {
        EventStoreStreamsClient: creator,
      },
    );
  }

  void install({
    bool withTestData = false,
    String imageTag = '20.6.1-buster-slim',
  }) {
    DockerProcess? server;
    StreamSubscription<LogRecord>? _printer;
    setUpAll(() async {
      // _initHiveDir(hiveDir);
      _printer = onRecord?.listen(
        (rec) => print(rec),
      );
      _logger?.info('---setUpAll---');
      var failure = '';
      server = await DockerProcess.start(
        name: 'esdb-client-dart-test',
        image: withTestData
            ? 'docker.pkg.github.com/eventstore/'
                'eventstore-client-grpc-testdata/'
                'eventstore-client-grpc-testdata:$imageTag'
            : 'docker.pkg.github.com/eventstore/eventstore/eventstore:$imageTag',
        ports: [
          '1113:1113/tcp',
          '1114:1114/tcp',
          '$PORT_2113:$PORT_2113/tcp',
          '$PORT_2114:$PORT_2114/tcp',
        ],
        environment: {
          'EVENTSTORE_INSECURE': 'True',
          'EVENTSTORE_LOG_LEVEL': 'Verbose',
          if (withTestData) 'EVENTSTORE_DB': '/data/integration-tests',
        },
        cleanup: true,
        readySignal: (line) {
          print(line);
          if (line.contains('Error response from daemon')) {
            failure = line;
          }
          return failure.isNotEmpty ||
              line.contains(
                'No incomplete scavenges found on node "0.0.0.0:2113"',
              );
        },
      );
      _creators.forEach((port, creators) {
        creators.values.forEach(
          (creator) => _open(port, creator),
        );
      });
      _logger?.info('---setUpAll--->ok');
      return Future<void>.value();
    });

    tearDownAll(() async {
      _logger?.info('---tearDownAll---');
      try {
        await Future.wait([
          ..._channels.values.map(
            (e) => e.shutdown(),
          )
        ]);
        await server?.stop();
        return await _printer?.cancel();
      } finally {
        _clients.clear();
        _channels.clear();
        _logger?.info('---tearDownAll--->ok');
      }
    });
  }

  T _open<T extends EventStoreClientBase>(
    int port,
    T Function(ClientChannel) create,
  ) {
    final channel = _channels.putIfAbsent(
      port,
      () => ClientChannel(
        '127.0.0.1',
        port: port,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
    final client = create(channel);
    _clients.update(
      port,
      (clients) => clients
        ..putIfAbsent(
          client.runtimeType,
          () => client,
        ),
      ifAbsent: () => {
        client.runtimeType: client,
      },
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
