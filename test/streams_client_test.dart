import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/enums.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/streams/read_results.dart';
import 'package:eventstore_client_dart/src/streams/write_results.dart';
import 'package:grpc/grpc.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  const PageCount = 20;

  group('When working on non-existing stream with streams client', () {
    final harness = EventStoreDBClientHarness()
      ..withLogger()
      ..withStreamsClient()
      ..install();

    test('appends zero events when expected state is any', () async {
      final state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.any,
      );
      await _testClientAppendsZeroEvents(harness, state);
    });

    test('appends zero events when expected state is no stream', () async {
      final state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.no_stream,
      );
      await _testClientAppendsZeroEvents(harness, state);
    });

    test('appends zero events when expected state is stream exists', () async {
      final state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.stream_exists,
      );
      await _testClientAppendsZeroEvents(harness, state);
    });

    test('create stream with expected version on first write if does not exist',
        () async {
      final state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.no_stream,
      );
      final events = harness.createTestEvents(count: 1);
      await _testClientAppendsEvents(harness, state, events);
    });

    test('create stream on first write with repeated idempotent writes',
        () async {
      // Arrange
      final state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.any,
      );
      final events = harness.createTestEvents(count: 4);

      // Apply writes
      await _testClientAppendsEvents(harness, state, events);

      // Assert idempotent writes
      await _testClientAppendsEvents(harness, state, events);
    });

    test(
        'bug case: create stream with multiple idempotent writes '
        'with same event id', () async {
      // Arrange
      final state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.any,
      );
      final event = harness.createTestEvent(0);
      final events = [event, event, event, event, event, event];

      await _testClientAppendsEvents(harness, state, events);
    });

    test(
        'bug case: create stream with repeated multiple idempotent writes '
        'with same event id using expected version any '
        'then next expected version is unreliable', () async {
      // Arrange
      final client = harness.client<EventStoreDBStreamsClient>();
      final state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.any,
      );
      final event = harness.createTestEvent(0);
      final events = [event, event, event, event, event, event];

      // Act
      await _testClientAppendsEvents(harness, state, events);

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
      final state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.no_stream,
      );
      final event = harness.createTestEvent(0);
      final events = [event, event, event, event, event, event];

      // Act
      await _testClientAppendsEvents(harness, state, events);

      // Assert
      await _testClientAppendsEvents(harness, state, events);
    });
  });

  group('When working on existing stream with streams client', () {
    final harness = EventStoreDBClientHarness()
      ..withLogger()
      ..withStreamsClient()
      ..install();

    late StreamState state;
    late Iterable<EventData> exists;
    late EventStoreDBStreamsClient client;

    setUp(() async {
      client = harness.client<EventStoreDBStreamsClient>();
      state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.any,
      );
      exists = harness.createTestEvents(count: 25);
      final result = await client.append(state, Stream.fromIterable(exists));
      expect(result, isA<WriteSuccessResult>());
      expect(result.actualType, equals(StreamStateType.stream_exists));
    });

    // ----------------------------------
    // Test backward reads
    // ----------------------------------

    test('returns first event if reading stream from start backwards',
        () async {
      // Act
      final result = await client.readFromStream(
        state.name,
        StreamPosition.start,
        forward: false,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      final events = await success.events.toList();
      expect(events.length, 1);
      expect(
        events.last.originalEvent.eventId,
        exists.first.uuid,
        reason: 'should return first event',
      );
    });

    test('returns given count if reading stream from end backwards', () async {
      // Act
      final result = await client.readFromStream(
        state.name,
        StreamPosition.end,
        forward: false,
        count: PageCount,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, PageCount);
    });

    test('returns all events as default if reading stream from end backwards',
        () async {
      // Act
      final result = await client.readFromStream(
        state.name,
        StreamPosition.end,
        forward: false,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, exists.length);
    });

    test(
        'returns partial slice if not enough events '
        'and reading stream from end backwards', () async {
      // Act
      final result = await client.readFromStream(
        state.name,
        StreamPosition.end,
        forward: false,
        count: exists.length * 2,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, lessThan(exists.length * 2));
    });

    test('returns in reverse order if reading stream backwards', () async {
      // Act
      final result = await client.readFromStream(
        state.name,
        StreamPosition.end,
        forward: false,
        count: PageCount,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      final events = await success.events.toList();
      expect(events.length, PageCount);
      expect(
        events.map((e) => e.originalEvent.eventNumber),
        equals(List.generate(
          events.length,
          (index) => StreamPosition.checked(
            exists.length - index - 1,
          ),
        )),
        reason: 'Event numbers be in reverse order',
      );
    });

    // ----------------------------------
    // Test forward reads
    // ----------------------------------

    test('throws if reading stream from end forwards', () async {
      // Act
      final result = client.readFromStream(
        state.name,
        StreamPosition.end,
        forward: true,
      );

      // Assert
      await expectLater(
        result,
        throwsA(isA<GrpcError>().having(
          (e) => e.message,
          'expected message',
          'Unexpected ReadStreamResult: Error',
        )),
        reason: 'this should probably not throw...',
      );
    });

    test('returns all events by default if reading stream from start forwards',
        () async {
      // Act
      final result = await client.readFromStream(
        state.name,
        StreamPosition.start,
        forward: true,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, exists.length);
    });

    test('returns given count if reading stream from start forwards', () async {
      // Act
      final result = await client.readFromStream(
        state.name,
        StreamPosition.start,
        forward: true,
        count: PageCount,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, PageCount);
    });

    test(
        'returns partial slice if not enough events '
        'and reading stream from start forwards', () async {
      // Act
      final result = await client.readFromStream(
        state.name,
        StreamPosition.start,
        forward: true,
        count: exists.length * 2,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, lessThan(exists.length * 2));
    });

    test('returns in correct order if reading stream forwards', () async {
      // Act
      final result = await client.readFromStream(
        state.name,
        StreamPosition.start,
        forward: true,
        count: PageCount,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      final events = await success.events.toList();
      expect(events.length, PageCount);
      expect(
        events.map((e) => e.originalEvent.eventNumber),
        equals(List.generate(
          events.length,
          (index) => StreamPosition.checked(index),
        )),
        reason: 'Event numbers be in correct order',
      );
    });

    // ----------------------------------
    // Test idempotency
    // ----------------------------------

    test('handles repeated idempotent writes', () async {
      // Arrange
      final expected = StreamState.exists(
        state.name,
        revision: StreamRevision.checked(exists.length - 1),
      );
      final events = harness.createTestEvents(count: 4);

      // Apply writes
      await _testClientAppendsEvents(
        harness,
        expected,
        events,
        exists: exists,
      );

      // Assert idempotent writes
      await _testClientAppendsEvents(
        harness,
        expected,
        events,
        exists: exists,
      );
    });

    // ----------------------------------
    // Test bug cases
    // ----------------------------------

    test('bug case: multiple idempotent writes with same event id', () async {
      // Arrange
      final expected = StreamState.any(state.name);
      final event = harness.createTestEvent(1);
      final append = [event, event, event, event, event, event];

      // Act
      await _testClientAppendsEvents(
        harness,
        expected,
        append,
        exists: exists,
      );
    });

    test(
        'bug case: repeated multiple idempotent writes '
        'with same event id using expected version any '
        'then next expected version is unreliable', () async {
      // Arrange
      final expected = StreamState.any(state.name);
      final event = harness.createTestEvent(1);
      final append = [event, event, event, event, event, event];

      // Act
      await _testClientAppendsEvents(
        harness,
        expected,
        append,
        exists: exists,
      );

      // Assert
      final writeResult = await client.append(
        expected,
        Stream.fromIterable(append),
      );
      expect(
        writeResult.nextExpectedStreamRevision,
        StreamRevision.checked(25),
        reason: 'next expected revision should be unreliable',
      );
    });

    test(
        'bug case: repeated multiple idempotent writes '
        'with same event id using expected revision '
        'then next expected version is correct', () async {
      // Arrange
      final expected = StreamState.exists(
        state.name,
        revision: StreamRevision.checked(exists.length - 1),
      );
      final event = harness.createTestEvent(1);
      final append = [event, event, event, event, event, event];

      // Act
      await _testClientAppendsEvents(
        harness,
        expected,
        append,
        exists: exists,
      );

      // Assert
      final writeResult = await client.append(
        expected,
        Stream.fromIterable(append),
      );
      expect(
        writeResult.nextExpectedStreamRevision,
        StreamRevision.checked(exists.length + append.length - 1),
        reason: 'next expected revision should be correct',
      );
    });
  });

  group('When working on \$all stream with streams client', () {
    final harness = EventStoreDBClientHarness()
      ..withLogger()
      ..withStreamsClient()
      ..install();

    late StreamState state;
    late Iterable<EventData> exists;
    late EventStoreDBStreamsClient client;

    setUpAll(() async {
      client = harness.client<EventStoreDBStreamsClient>();
      state = harness.streamState<EventStoreDBStreamsClient>(
        StreamStateType.any,
      );
      exists = harness.createTestEvents(count: 25);
      final result = await client.append(state, Stream.fromIterable(exists));
      expect(result, isA<WriteSuccessResult>());
      expect(result.actualType, equals(StreamStateType.stream_exists));
    });

    // ----------------------------------
    // Test backward reads
    // ----------------------------------

    test('returns empty if reading all from start backwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.start,
        forward: false,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.toList(), isEmpty);
    });

    test('returns given count if reading all from end backwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.end,
        forward: false,
        count: PageCount,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, PageCount);
    });

    test('returns all events as default if reading all from end backwards',
        () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.end,
        forward: false,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, greaterThan(exists.length));
    });

    test(
        'returns partial slice if not enough events '
        'and reading all from end backwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.end,
        forward: false,
        count: exists.length * 2,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, lessThan(exists.length * 2));
    });

    test('returns in reverse order if reading all backwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.end,
        forward: false,
        count: PageCount,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      final events = await success.events.toList();
      expect(events.length, PageCount);
      final resolved = events.where((e) => e.isResolved);
      expect(
        resolved.map((e) => e.originalEvent.eventNumber),
        equals(List.generate(
          resolved.length,
          (index) => StreamPosition.checked(
            resolved.length - index,
          ),
        )),
        reason: 'Event numbers be in reverse order',
      );
    });

    // ----------------------------------
    // Test forward reads
    // ----------------------------------

    test('returns empty if reading all from end forwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.end,
        forward: true,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.toList(), isEmpty);
    });

    test('returns given count if reading all from start forwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.start,
        forward: true,
        count: PageCount,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, PageCount);
    });

    test('returns all events as default if reading all from start forwards',
        () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.start,
        forward: true,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, greaterThan(exists.length));
    });

    test(
        'returns partial slice if not enough events '
        'and reading all from start forwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.start,
        forward: true,
        count: exists.length * 2,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      expect(await success.events.length, lessThan(exists.length * 2));
    });

    test('returns in correct order if reading all forwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.start,
        forward: true,
        count: PageCount,
      );

      // Assert
      expect(result, isA<ReadEventsSuccessResult>());
      final success = result as ReadEventsSuccessResult;
      final events = await success.events.toList();
      expect(events.length, PageCount);
      final resolved = events.where((e) => e.isResolved);
      expect(
        resolved.map((e) => e.originalEvent.eventNumber),
        equals(List.generate(
          resolved.length,
          (index) => StreamPosition.checked(index),
        )),
        reason: 'Event numbers be in correct order',
      );
    });
  });
}

Future<void> _testClientAppendsZeroEvents(
  EventStoreDBClientHarness harness,
  StreamState state,
) async {
  // Arrange
  final client = harness.client<EventStoreDBStreamsClient>();
  expect(client, isA<EventStoreDBStreamsClient>());

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
    expect(readResult, isA<ReadEventsStreamNotFoundResult>());
  }
}

Future<void> _testClientAppendsEvents(
  EventStoreDBClientHarness harness,
  StreamState state,
  Iterable<EventData> append, {
  Iterable<EventData> exists = const [],
}) async {
  // Arrange
  final client = harness.client<EventStoreDBStreamsClient>();
  expect(client, isA<EventStoreDBStreamsClient>());
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
  expect(readResult, isA<ReadEventsSuccessResult>());
  expect(readResult.streamName, state.name);
  final actual = await (readResult as ReadEventsSuccessResult).events.toList();
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