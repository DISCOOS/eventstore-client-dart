import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('When hard-deleting non-existing stream, streams client', () {
    final harness = EventStoreDBClientHarness()
      ..withLogger()
      ..withClient()
      ..install();

    // ---------------------------------------
    // Test Tombstone operations (hard delete)
    // ---------------------------------------

    test('performs a hard delete with expected version any does not throw',
        () async {
      // Arrange
      final client = harness.client();
      final expected = harness.newStreamState(
        StreamStateType.any,
      );

      // Act
      final result = await client.tombstone(expected);

      // Assert result
      expect(result.streamName, expected.name);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, isNull);
    });

    test(
        'performs a hard delete with expected version no stream does not throw',
        () async {
      // Arrange
      final client = harness.client();
      final expected = harness.newStreamState(
        StreamStateType.no_stream,
      );

      // Act
      final result = await client.tombstone(expected);

      // Assert result
      expect(result.streamName, expected.name);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, isNull);
    });

    test('performs a hard delete with wrong expected version throws', () async {
      // Arrange
      final client = harness.client();
      final expected = harness.newStreamState(
        StreamStateType.stream_exists,
        revision: StreamRevision.checked(0),
      );

      // Act
      final result = client.tombstone(StreamState.exists(expected.name));

      // Assert result
      await expectLater(result, throwsA(isA<GrpcError>()));
    });
  });

  group('When hard-deleting existing stream, streams client', () {
    final harness = EventStoreDBClientHarness()
      ..withLogger()
      ..withClient()
      ..install();

    late StreamState state;
    late Iterable<EventData> exists;
    late EventStoreStreamsClient client;

    setUp(() async {
      client = harness.client();
      state = harness.newStreamState(StreamStateType.any);
      exists = harness.createTestEvents(count: 25);
      final result = await client.append(state, Stream.fromIterable(exists));
      expect(result, isA<WriteSuccessResult>());
      expect(result.actualType, equals(StreamStateType.stream_exists));
    });

    // ---------------------------------------
    // Test Tombstone operations (hard delete)
    // ---------------------------------------

    test('performs a hard delete with any', () async {
      // Act
      final result = await client.tombstone(
        StreamState.any(state.name),
      );

      // Assert result
      expect(result.streamName, state.name);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, state.revision);
    });

    test('performs a hard delete with expected revision', () async {
      // Act
      final result = await client.tombstone(state);

      // Assert result
      expect(result.streamName, state.name);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, state.revision);
    });

    test('performs a hard delete with no stream throws', () async {
      // Act
      final result = client.tombstone(StreamState.noStream(state.name));

      // Assert result
      await expectLater(result, throwsA(isA<WrongExpectedVersionException>()));
    });

    test('performs a hard delete with stream_exists throws', () async {
      // Act
      final result = client.tombstone(StreamState.exists(state.name));

      // Assert result
      await expectLater(result, throwsA(isA<GrpcError>()));
    });

    test('performs a hard delete on deleted stream throws', () async {
      // Act
      await client.tombstone(state);
      final result = client.tombstone(state);

      // Assert result
      await expectLater(result, throwsA(isA<StreamDeletedException>()));
    });

    test('read from hard deleted stream throws', () async {
      // Act
      await client.tombstone(state);
      final result = client.readFromStream(
        state.name,
        state.getStreamPosition(),
      );

      // Assert result
      await expectLater(result, throwsA(isA<StreamDeletedException>()));
    });

    test('can hard-delete soft deleted stream', () async {
      // Arrange
      await testRecreatesSoftDeletedStreamWithGivenState(
        harness,
        client,
        state,
        state,
        exists,
      );

      // Act
      final result = await client.tombstone(state);

      // Assert result
      expect(result.streamName, state.name);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, isNull);
    });
  });
}
