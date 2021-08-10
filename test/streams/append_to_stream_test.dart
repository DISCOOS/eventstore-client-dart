import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('When appending to non-existing stream, streams client', () {
    final harness = EventStoreDBClientHarness()
      ..withLogger()
      ..withStreamsClient()
      ..install();

    // ---------------------------------------
    // Test append operations
    // ---------------------------------------

    test('appends zero events when expected state is any', () async {
      final state = harness.newStreamState(
        StreamStateType.any,
      );
      await _testClientAppendsZeroEvents(harness, state);
    });

    test('appends zero events when expected state is no stream', () async {
      final state = harness.newStreamState(
        StreamStateType.no_stream,
      );
      await _testClientAppendsZeroEvents(harness, state);
    });

    test('appends zero events when expected state is stream_exists', () async {
      final state = harness.newStreamState(
        StreamStateType.stream_exists,
      );
      await _testClientAppendsZeroEvents(harness, state);
    });

    test('create stream with expected version on first write if does not exist',
        () async {
      final state = harness.newStreamState(
        StreamStateType.no_stream,
      );
      final events = harness.createTestEvents(count: 1);
      await testClientAppendsEvents(harness, state, events);
    });

    test('create stream on first write with repeated idempotent writes',
        () async {
      // Arrange
      final state = harness.newStreamState(
        StreamStateType.any,
      );
      final events = harness.createTestEvents(count: 4);

      // Apply writes
      await testClientAppendsEvents(harness, state, events);

      // Assert idempotent writes
      await testClientAppendsEvents(harness, state, events);
    });

    test(
        'bug case: create stream with multiple idempotent writes '
        'with same event id', () async {
      // Arrange
      final state = harness.newStreamState(
        StreamStateType.any,
      );
      final event = harness.createTestEvent(0);
      final events = [event, event, event, event, event, event];

      await testClientAppendsEvents(harness, state, events);
    });

    // ---------------------------------------
    // Test bug cases
    // ---------------------------------------

    test(
        'bug case: create stream with repeated multiple idempotent writes '
        'with same event id using expected version any '
        'then next expected version is unreliable', () async {
      // Arrange
      final client = harness.client();
      final state = harness.newStreamState(
        StreamStateType.any,
      );
      final event = harness.createTestEvent(0);
      final events = [event, event, event, event, event, event];

      // Act
      await testClientAppendsEvents(harness, state, events);

      // Assert
      final writeResult = await client.append(
        state,
        Stream.fromIterable(events),
      );
      expect(
        writeResult.nextExpectedStreamRevision,
        StreamRevision.checked(0),
        reason: 'next expected revision should be unreliable',
      );
    });

    test(
        'bug case: create stream with repeated multiple idempotent writes '
        'with same event id using expected version no stream '
        'then next expected version is correct', () async {
      // Arrange
      final state = harness.newStreamState(
        StreamStateType.no_stream,
      );
      final event = harness.createTestEvent(0);
      final events = [event, event, event, event, event, event];

      // Act
      await testClientAppendsEvents(harness, state, events);

      // Assert
      await testClientAppendsEvents(harness, state, events);
    });
  });

  group('When appending to existing stream, streams client', () {
    const ExistingCount = 25;
    final harness = EventStoreDBClientHarness()
      ..withLogger()
      ..withStreamsClient()
      ..install();

    late StreamState state;
    late Iterable<EventData> exists;
    late EventStoreStreamsClient client;

    setUp(() async {
      client = harness.client();
      state = harness.newStreamState(
        StreamStateType.any,
      );
      exists = harness.createTestEvents(count: 25);
      final result = await client.append(state, Stream.fromIterable(exists));
      expect(result, isA<WriteSuccessResult>());
      expect(result.actualType, equals(StreamStateType.stream_exists));
    });

    // ----------------------------------
    // Test append idempotency
    // ----------------------------------

    test('handles repeated idempotent writes', () async {
      // Arrange
      final expected = StreamState.exists(
        state.name,
        revision: StreamRevision.checked(ExistingCount - 1),
      );
      final events = harness.createTestEvents(count: 4);

      // Apply writes
      await testClientAppendsEvents(
        harness,
        expected,
        events,
        exists: exists,
      );

      // Assert idempotent writes
      await testClientAppendsEvents(
        harness,
        expected,
        events,
        exists: exists,
      );
    });
  });
}

Future<void> _testClientAppendsZeroEvents(
  EventStoreDBClientHarness harness,
  StreamState state,
) async {
  // Arrange
  final client = harness.client();
  expect(client, isA<EventStoreStreamsClient>());

  // Apply empty list of events
  final iterations = 2;
  for (var i = 0; i < iterations; i++) {
    final writeResult = await client.append(
      state,
      Stream.fromIterable(<EventData>[]),
    );
    expect(writeResult.actualType, equals(StreamStateType.no_stream));
    expect(writeResult.nextExpectedStreamRevision, StreamRevision.none);
    if (state.isStreamExists) {
      expect(writeResult, isA<WrongExpectedVersionResult>());
      expect(
        writeResult,
        isA<WrongExpectedVersionResult>()
            .having(
              (error) => error.expected,
              'expected state equals requested',
              equals(state),
            )
            .having(
              (error) => error.actualState,
              'actual state equals expected',
              equals(StreamState.noStream(state.name)),
            ),
      );
    } else {
      expect(writeResult, isA<WriteSuccessResult>());
    }

    // Assert empty stream
    final readResult = await client.readFromStream(
      state.name,
      state.getStreamPosition(),
    );
    expect(readResult.isStreamNotFound, isTrue);
  }
}