import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  const PageCount = 20;

  group('When reading from \$all stream, streams client', () {
    const ExistingCount = 25;
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install();

    late StreamState state;
    late Iterable<EventData> exists;
    late EventStoreStreamsClient client;

    setUpAll(() async {
      client = harness.client();
      state = harness.newStreamState(StreamStateType.any);
      exists = harness.createTestEvents(count: ExistingCount);
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
      expect(result.isOK, isTrue);
      expect(await result.stream.toList(), isEmpty);
    });

    test('returns given count if reading all from end backwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.end,
        forward: false,
        count: PageCount,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, PageCount);
    });

    test('returns all events as default if reading all from end backwards',
        () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.end,
        forward: false,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, greaterThan(ExistingCount));
    });

    test(
        'returns partial slice if not enough events '
        'and reading all from end backwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.end,
        forward: false,
        count: ExistingCount * 2,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, lessThan(ExistingCount * 2));
    });

    test('returns in reverse order if reading all backwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.end,
        forward: false,
        count: PageCount,
      );

      // Assert
      expect(result.isOK, isTrue);
      final events = await result.stream.toList();
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
      expect(result.isOK, isTrue);
      expect(await result.stream.toList(), isEmpty);
    });

    test('returns given count if reading all from start forwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.start,
        forward: true,
        count: PageCount,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, PageCount);
    });

    test('returns all events as default if reading all from start forwards',
        () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.start,
        forward: true,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, greaterThan(ExistingCount));
    });

    test(
        'returns partial slice if not enough events '
        'and reading all from start forwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.start,
        forward: true,
        count: ExistingCount * 2,
      );

      // Assert
      expect(result.isOK, isTrue);
      expect(await result.stream.length, lessThan(ExistingCount * 2));
    });

    test('returns in correct order if reading all forwards', () async {
      // Act
      final result = await client.readFromAll(
        LogPosition.start,
        forward: true,
        count: PageCount,
      );

      // Assert
      expect(result.isOK, isTrue);
      final events = await result.stream.toList();
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
