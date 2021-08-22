import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  const PageCount = 20;

  group('When reading from non-existing stream, streams client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install();

    // ---------------------------------------
    // Test read operations
    // ---------------------------------------

    test('returns stream not found', () async {
      // Arrange
      final client = harness.client();
      final expected = harness.newStreamState(
        StreamStateType.any,
        revision: StreamRevision.empty,
      );

      // Act
      final result = await client.readFromStream(
        expected.streamId,
        position: expected.revision!.toPosition(),
      );

      // Assert result
      expect(result.isStreamNotFound, isTrue);
    });
  });

  group('When reading from existing stream, streams client', () {
    const ExistingCount = 25;
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
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
    // Test backward reads
    // ----------------------------------

    test('returns first event if reading stream from start backwards',
        () async {
      // Act
      final result = await client.readFromStream(
        state.streamId,
        forward: false,
        position: StreamPosition.start,
      );

      // Assert
      expect(result.isOK, isTrue);
      final events = await result.stream.toList();
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
        state.streamId,
        forward: false,
        count: PageCount,
        position: StreamPosition.end,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, PageCount);
    });

    test('returns all events as default if reading stream from end backwards',
        () async {
      // Act
      final result = await client.readFromStream(
        state.streamId,
        forward: false,
        position: StreamPosition.end,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, ExistingCount);
    });

    test(
        'returns partial slice if not enough events '
        'and reading stream from end backwards', () async {
      // Act
      final result = await client.readFromStream(
        state.streamId,
        forward: false,
        count: ExistingCount * 2,
        position: StreamPosition.end,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, lessThan(ExistingCount * 2));
    });

    test('returns in reverse order if reading stream backwards', () async {
      // Act
      final result = await client.readFromStream(
        state.streamId,
        forward: false,
        count: PageCount,
        position: StreamPosition.end,
      );

      // Assert
      expect(result.isOK, isTrue);
      final events = await result.stream.toList();
      expect(events.length, PageCount);
      expect(
        events.map((e) => e.originalEvent.eventNumber),
        equals(List.generate(
          events.length,
          (index) => StreamPosition.checked(
            ExistingCount - index - 1,
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
        state.streamId,
        forward: true,
        position: StreamPosition.end,
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
        state.streamId,
        forward: true,
        position: StreamPosition.start,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, ExistingCount);
    });

    test('returns given count if reading stream from start forwards', () async {
      // Act
      final result = await client.readFromStream(
        state.streamId,
        forward: true,
        count: PageCount,
        position: StreamPosition.start,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, PageCount);
    });

    test(
        'returns partial slice if not enough events '
        'and reading stream from start forwards', () async {
      // Act
      final result = await client.readFromStream(
        state.streamId,
        forward: true,
        count: ExistingCount * 2,
        position: StreamPosition.start,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, lessThan(ExistingCount * 2));
    });

    test('returns in correct order if reading stream forwards', () async {
      // Act
      final result = await client.readFromStream(
        state.streamId,
        forward: true,
        count: PageCount,
        position: StreamPosition.start,
      );

      // Assert
      expect(result.isOK, isTrue);
      final events = await result.stream.toList();
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
    // Test multiple subscribers
    // ----------------------------------

    test('allows multiple subscribers on result stream', () async {
      // Act
      final result = await client.readFromStream(
        state.streamId,
        forward: false,
        position: StreamPosition.end,
      );
      final stream = result.asBroadcastStream();

      // Assert
      expect(result.isOK, isTrue);
      expect(
        await Future.wait<int>([
          stream.length,
          stream.length,
        ]),
        [
          ExistingCount,
          ExistingCount,
        ],
      );
    });
  });
}
