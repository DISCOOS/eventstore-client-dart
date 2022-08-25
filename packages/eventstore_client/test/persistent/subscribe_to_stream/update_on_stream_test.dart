import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

import '../../harness.dart';

void main() {
  const EventCount = 10;
  const GroupName = 'existing';
  const ExistingStream = 'existing';
  group('When using EventStoreDB v20_LTS, persistent subscription client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(timeoutAfter: null);

    late Iterable<EventData> exists;
    late final EventStoreStreamsClient streamsClient;
    late final EventStorePersistentSubscriptionsClient subscriptionsClient;

    setUpAll(() async {
      streamsClient = harness.client();
      exists = harness.createTestEvents(count: EventCount);
      final write = await streamsClient.append(
        StreamState.any(ExistingStream),
        Stream.fromIterable(exists),
      );
      expect(write, isA<WriteSuccessResult>());
      expect(write.actualType, equals(StreamStateType.stream_exists));
      subscriptionsClient = EventStorePersistentSubscriptionsClient(
        streamsClient.settings,
      );
      await subscriptionsClient.create(ExistingStream, GroupName,
          settings: PersistentSubscriptionSettings(
            startFrom: StreamPosition.end,
          ));
    });

    // ---------------------------------------
    // Test update operations on given stream
    // ---------------------------------------

    test('update throws with unknown group on given stream', () async {
      // Act
      final request = subscriptionsClient.update(
        ExistingStream,
        'unknown-group',
      );
      // Assert
      await expectLater(
        request,
        throwsA(
          isA<PersistentSubscriptionNotFoundException>()
              .having(
                (e) => e.streamId,
                'Is stream id',
                ExistingStream,
              )
              .having(
                (e) => e.groupName,
                'Is group name',
                'unknown-group',
              ),
        ),
      );
    });

    test('update throws with wrong startFrom type on given stream', () async {
      // Act
      final request = subscriptionsClient.update(
        ExistingStream,
        GroupName,
        settings: PersistentSubscriptionSettings(
          startFrom: LogPosition.end,
        ),
      );
      // Assert
      await expectLater(request, throwsA(isA<ArgumentError>()));
    });

    test('update a group on given stream', () async {
      // Act
      await subscriptionsClient.update(ExistingStream, GroupName,
          settings: PersistentSubscriptionSettings(
            startFrom: StreamPosition.start,
          ));
      // Assert
      final subscription = await subscriptionsClient.subscribe(
        ExistingStream,
        GroupName,
      );
      expect(subscription.isOK, isTrue);
      final first = await subscription.stream.first;
      expect(first, isA<ResolvedEvent>());
      await subscription.dispose();
    });

    test('update a group with subscribers on given stream', () async {
      // Arrange
      final before = await subscriptionsClient.subscribe(
        ExistingStream,
        GroupName,
      );
      expect(before.isOK, isTrue);

      // Act
      await subscriptionsClient.update(ExistingStream, GroupName);

      // Assert
      expect(
        await before.onDropped,
        isA<SubscriptionDroppedEvent>().having(
          (e) => e.reason,
          'expects disposed',
          SubscriptionDroppedReason.disposed,
        ),
      );
      final after = await subscriptionsClient.subscribe(
        ExistingStream,
        GroupName,
      );
      expect(after.isOK, isTrue);

      // Cleanup
      await before.dispose();
      await after.dispose();
    });

    test('update a group with startFrom equal to last commit on given stream',
        () async {
      // Arrange
      final result = await streamsClient.read(
        ExistingStream,
        maxCount: 1,
        forward: false,
        position: StreamPosition.end,
      );
      final lastEvent = await result.stream.first;
      final lastPosition = lastEvent.originalEventNumber;

      // Assert
      await subscriptionsClient.update(
        ExistingStream,
        GroupName,
        settings: PersistentSubscriptionSettings(
          startFrom: lastPosition,
        ),
      );
    });
  });
}
