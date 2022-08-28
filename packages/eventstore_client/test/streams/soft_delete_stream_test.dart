import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  const JsonDocument customMetadata = <String, dynamic>{
    'key1': true,
    'key2': 17,
    'key3': 'some value',
  };

  group('When soft-deleting non-existing stream, streams client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        EventStoreImage.V20_LTS,
      );

    // ---------------------------------------
    // Test Delete operations (soft-delete)
    // ---------------------------------------

    test('performs a soft-delete with state any does not throw', () async {
      // Arrange
      final client = harness.client();
      final expected = harness.newStreamState(
        StreamStateType.any,
      );

      // Act
      final result = await client.delete(expected);

      // Assert result
      expect(result.streamId, expected.streamId);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, isNull);
    });

    test('performs a soft-delete with state no_stream does not throw',
        () async {
      // Arrange
      final client = harness.client();
      final expected = harness.newStreamState(
        StreamStateType.no_stream,
      );

      // Act
      final result = await client.delete(expected);

      // Assert result
      expect(result.streamId, expected.streamId);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, isNull);
    });

    test('performs a soft-delete with wrong expected version throws', () async {
      // Arrange
      final client = harness.client();
      final expected = harness.newStreamState(
        StreamStateType.stream_exists,
        revision: StreamRevision.checked(0),
      );

      // Act
      final result = client.delete(StreamState.exists(expected.streamId));

      // Assert result
      await expectLater(result, throwsA(isA<GrpcError>()));
    });
  });

  group('When soft-deleting existing stream, streams client', () {
    const ExistingCount = 25;
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
      state = harness.newStreamState(
        StreamStateType.any,
      );
      exists = harness.createTestEvents(count: 25);
      final result = await client.append(state, Stream.fromIterable(exists));
      expect(result, isA<WriteSuccessResult>());
      expect(result.actualType, equals(StreamStateType.stream_exists));
    });

    // ---------------------------------------
    // Test Truncate operations (soft-delete)
    // ---------------------------------------

    test('performs a soft-delete with any', () async {
      // Act
      final result = await client.delete(
        StreamState.any(state.streamId),
      );

      // Assert result
      expect(result.streamId, state.streamId);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, state.revision);
    });

    test('performs a soft-delete with expected revision', () async {
      // Act
      final result = await client.delete(state);

      // Assert result
      expect(result.streamId, state.streamId);
      expect(result.deletedAtPosition, isNotNull);
      expect(result.deletedAtRevision, state.revision);
    });

    test('performs a soft-delete with no_stream throws', () async {
      // Act
      final result = client.delete(StreamState.noStream(state.streamId));

      // Assert result
      await expectLater(result, throwsA(isA<WrongExpectedVersionException>()));
    });

    test('performs a soft-delete with stream exists throws', () async {
      // Act
      final result = client.delete(StreamState.exists(state.streamId));

      // Assert result
      await expectLater(result, throwsA(isA<GrpcError>()));
    });

    test('performs a soft-delete on deleted stream does not throw', () async {
      // Arrange
      final deleted = await client.delete(state);

      // Act
      final result = await client.delete(state);

      // Assert result
      expect(result, isA<DeleteResult>());
      expect(result.deletedAtRevision, deleted.deletedAtRevision);
      expect(
        result.deletedAtPosition,
        isNot(equals(deleted.deletedAtPosition)),
      );
    });

    test('read from soft-deleted stream throws', () async {
      // Arrange
      await client.delete(state);

      // Act
      final result = await client.read(
        state.streamId,
        position: state.getStreamPosition(),
      );

      // Assert
      expect(result.isStreamNotFound, isTrue);
    });

    test('recreates soft-deleted stream with any', () async {
      await testRecreatesSoftDeletedStreamWithGivenState(
        harness,
        client,
        state,
        state.toAny(),
        exists,
      );
    });

    test('recreates soft-deleted stream with no_stream', () async {
      await testRecreatesSoftDeletedStreamWithGivenState(
        harness,
        client,
        state,
        state.toNoStream(),
        exists,
      );
    });

    test('recreates soft-deleted stream with expected version', () async {
      await testRecreatesSoftDeletedStreamWithGivenState(
        harness,
        client,
        state,
        state,
        exists,
      );
    });

    test(
      'preserve metadata on soft-delete except truncate before',
      () async {
        // final state = StreamState.any('foo');
        // final ExistingCount = 2;
        // final writeResult0 = await client.append(
        //   // state.toRevision(ExistingCount - 1),
        //   state,
        //   Stream.fromIterable(harness.createTestEvents(count: ExistingCount)),
        // );
        // expect(writeResult0, isA<WriteSuccessResult>());

        // Arrange
        final metadata = StreamMetadata(
          maxCount: 100,
          truncateBefore: StreamPosition.fromInt64(
            Int64.MAX_VALUE, // 1 less than End
          ),
          acl: StreamAcl(deleteRoles: ['some-role']),
          custom: customMetadata,
        );

        //
        // print(Int64.MAX_VALUE.toString());
        // print(Int64.MAX_VALUE.toStringUnsigned());
        //
        // final two = BigInt.parse('18446744073709551615');
        // print(two.toUnsigned(64));
        //
        // print(Int64.parseInt('18446744073709551615').toUnsigned(64));
        // print(Int64.parseInt('18446744073709551615').toStringUnsigned());
        // print(Int64(-1));
        // print(Int64(-1).toUnsigned(64));
        // print(Int64(-1).toStringUnsigned());

        // await client.delete(state);

        // final allResult = await client.readFromAll(LogPosition.start);
        // final all = await allResult.events;
        //
        // final metadataResult = await client.getStreamMetadata(state.name);
        // expect(metadataResult.isOK, isTrue);
        // expect(
        //   metadataResult.metadata,
        //   StreamMetadata(
        //     custom: <String, dynamic>{},
        //     truncateBefore: metadata.truncateBefore,
        //   ),
        // );

        // Act - perform soft-delete by metadata
        final writeResult1 = await client.setStreamMetadata(
          state.toNoStream(),
          metadata,
        );
        expect(
          writeResult1.nextExpectedStreamRevision,
          StreamRevision.checked(0),
        );
        final metadataResult1 = await client.getStreamMetadata(state.streamId);
        expect(metadataResult1.isOK, isTrue);
        expect(metadataResult1.metadata, metadata);

        // await client.delete(state);

        // This is a workaround until github issue
        // https://github.com/EventStore/EventStore/issues/1744
        // is fixed
        await Future<void>.delayed(Duration(milliseconds: 5000));

        // // Assert soft-delete
        // final readResult2 = await client.readFromStream(
        //   state.name,
        //   StreamPosition.start,
        // );
        // expect(readResult2.isStreamNotFound, isTrue);
        //

        // Act - recreate stream from truncated event
        const count = 3;
        final events = harness.createTestEvents(count: count);
        final expectedRevision = StreamRevision.checked(
          ExistingCount + count - 1,
        );
        final writeResult2 = await client.append(
          state.toRevision(ExistingCount - 1),
          Stream.fromIterable(events),
        );
        expect(writeResult2, isA<WriteSuccessResult>());
        expect(writeResult2.actualType, equals(StreamStateType.stream_exists));
        expect(writeResult2.nextExpectedStreamRevision, expectedRevision);

        // This is a workaround until github issue
        // https://github.com/EventStore/EventStore/issues/1744
        // is fixed
        await Future<void>.delayed(Duration(milliseconds: 500));

        // final allResult = await client.readFromAll(LogPosition.start);
        // final all = await allResult.events;
        // print(all);

        // Assert soft-delete
        final readResult = await client.read(
          state.streamId,
          position: StreamPosition.start,
        );
        final resolved = await readResult.events;
        expect(readResult.isOK, isTrue);
        expect(
          readResult.nextExpectedStreamRevision,
          StreamRevision.checked(ExistingCount + count - 1),
        );
        expect(resolved.length, 3);

        // Assert metadata
        final metadataResult2 = await client.getStreamMetadata(state.streamId);
        expect(metadataResult2.isOK, isTrue);
        expect(
          metadataResult2.metadata,
          StreamMetadata(
            acl: metadata.acl,
            maxAge: metadata.maxAge,
            custom: metadata.custom,
            maxCount: metadata.maxCount,
            cacheControl: metadata.cacheControl,
            truncateBefore: StreamPosition.checked(ExistingCount),
          ),
        );
      },
      // TODO: Fix soft delete with metadata
      skip: true,
    );

    test(
      'appends multiple writes with state any on soft-deleted stream',
      () async {
        // Arrange
        final actual = await testRecreatesSoftDeletedStreamWithGivenState(
          harness,
          client,
          state,
          state,
          exists,
        );

        // Act
        final result1 = await client.append(
          state.toAny(),
          Stream.fromIterable(harness.createTestEvents(count: 3)),
        );
        expect(result1, isA<WriteSuccessResult>());
        expect(result1.nextExpectedStreamRevision, actual + 3);
        expect(result1.actualType, equals(StreamStateType.stream_exists));

        // Assert
        final result2 = await client.append(
          state.toAny(),
          Stream.fromIterable(harness.createTestEvents(count: 3)),
        );
        expect(result2, isA<WriteSuccessResult>());
        expect(result2.nextExpectedStreamRevision, actual + 6);
        expect(result2.actualType, equals(StreamStateType.stream_exists));

        final metadataResult = await client.getStreamMetadata(state.streamId);
        expect(metadataResult.isOK, isTrue);
        expect(metadataResult.metadata!.truncateBefore!.toInt(), ExistingCount);
        expect(
            metadataResult.metadataStreamPosition, StreamPosition.checked(1));
      },
      // TODO: Fix delete with metadata
      skip: true,
    );

    test(
      'appends multiple write with state stream_exists on soft-deleted stream',
      () async {
        // Arrange
        final actual = await testRecreatesSoftDeletedStreamWithGivenState(
          harness,
          client,
          state,
          state,
          exists,
        );

        // Act
        final result1 = await client.append(
          state.toExists(),
          Stream.fromIterable(harness.createTestEvents(count: 3)),
        );
        expect(result1, isA<WriteSuccessResult>());
        expect(result1.nextExpectedStreamRevision, actual + 3);
        expect(result1.actualType, equals(StreamStateType.stream_exists));

        // Assert
        final result2 = await client.append(
          state.toExists(),
          Stream.fromIterable(harness.createTestEvents(count: 3)),
        );
        expect(result2, isA<WriteSuccessResult>());
        expect(result2.nextExpectedStreamRevision, actual + 6);
        expect(result2.actualType, equals(StreamStateType.stream_exists));

        final metadataResult = await client.getStreamMetadata(state.streamId);
        expect(metadataResult.isOK, isTrue);
        expect(metadataResult.metadata!.truncateBefore!.toInt(), ExistingCount);
        expect(
            metadataResult.metadataStreamPosition, StreamPosition.checked(1));
      },
      // TODO: Fix delete with metadata
      skip: true,
    );
  });
}
