import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('When hard-deleting non-existing stream, streams client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        EventStoreImage.V20_LTS,
      );

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
      expect(result.streamId, expected.streamId);
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
      expect(result.streamId, expected.streamId);
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
      final result = client.tombstone(StreamState.exists(expected.streamId));

      // Assert result
      await expectLater(result, throwsA(isA<GrpcError>()));
    });
  });

  group('When hard-deleting existing stream, streams client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        EventStoreImage.V20_LTS,
      );

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
        StreamState.any(state.streamId),
      );

      // Assert result
      expect(result.streamId, state.streamId);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, state.revision);
    });

    test('performs a hard delete with expected revision', () async {
      // Act
      final result = await client.tombstone(state);

      // Assert result
      expect(result.streamId, state.streamId);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, state.revision);
    });

    test('performs a hard delete with no stream throws', () async {
      // Act
      final result = client.tombstone(StreamState.noStream(state.streamId));

      // Assert result
      await expectLater(result, throwsA(isA<WrongExpectedVersionException>()));
    });

    test('performs a hard delete with stream_exists throws', () async {
      // Act
      final result = client.tombstone(StreamState.exists(state.streamId));

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
      final result = client.read(
        state.streamId,
        position: state.getStreamPosition(),
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
      expect(result.streamId, state.streamId);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, isNull);
    });
  });
}
