import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

import '../../fixtures/filters.dart';
import '../../harness.dart';

void main() {
  const GroupName = 'existing';
  group('When using EventStoreDB v21_LTS, persistent subscription client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(
        settings: EventStoreClientSettings.v21,
      )
      ..install(
        timeoutAfter: null,
        imageTag: ImageTags.v21_LTS,
        isReady: (line) {
          return line.contains('Became Leader so now handling subscriptions');
        },
      );

    late final EventStoreStreamsClient streamsClient;
    late final EventStorePersistentSubscriptionsClient subscriptionsClient;

    setUpAll(() async {
      streamsClient = harness.client();
      subscriptionsClient = EventStorePersistentSubscriptionsClient(
        streamsClient.settings,
      );
      await subscriptionsClient.createToAll(GroupName);
      for (var filter in Filters.all('some')) {
        await subscriptionsClient.createToAll(
          'existing-${filter.runtimeType}-${filter.isPrefix ? 'prefix' : 'regex'}',
          filterOptions: SubscriptionFilterOptions(filter),
        );
      }
    });

    // ---------------------------------------
    // Test update operations on all-stream
    // ---------------------------------------

    test('update throws with unknown group on all-stream', () async {
      // Act
      final request = subscriptionsClient.updateToAll(
        'unknown-group',
        settings: PersistentSubscriptionSettings(),
      );
      // Assert
      await expectLater(
        request,
        throwsA(isA<PersistentSubscriptionNotFoundException>()),
      );
    });

    test('update throws with wrong startFrom type on all-stream', () async {
      // Act
      final request = subscriptionsClient.updateToAll(
        GroupName,
        settings: PersistentSubscriptionSettings(startFrom: StreamPosition.end),
      );
      // Assert
      await expectLater(request, throwsA(isA<ArgumentError>()));
    });

    test('update a group on all-stream', () async {
      // Act
      await subscriptionsClient.updateToAll(GroupName);
      // Assert
      final subscription = await subscriptionsClient.subscribeToAll(GroupName);
      expect(subscription.isOK, isTrue);
      final first = await subscription.stream.first;
      expect(first, isA<ResolvedEvent>());
      await subscription.dispose();
    });

    test('update a group with subscribers on all-stream', () async {
      // Arrange
      final before = await subscriptionsClient.subscribeToAll(GroupName);
      expect(before.isOK, isTrue);

      // Act
      await subscriptionsClient.updateToAll(GroupName);

      // Assert
      expect(
        await before.onDropped,
        isA<SubscriptionDroppedEvent>().having(
          (e) => e.reason,
          'expects disposed',
          SubscriptionDroppedReason.disposed,
        ),
      );
      final after = await subscriptionsClient.subscribeToAll(GroupName);
      expect(after.isOK, isTrue);

      // Cleanup
      await before.dispose();
      await after.dispose();
    });

    test('update a group to filtered on all-stream', () async {
      // Assert
      for (var filter in Filters.all('some')) {
        await subscriptionsClient.updateToAll(
          'existing-${filter.runtimeType}-${filter.isPrefix ? 'prefix' : 'regex'}',
        );
      }
    });

    test('update a group with startFrom equal to last commit on all-stream',
        () async {
      // Arrange
      final result = await streamsClient.readFromAll(
        maxCount: 1,
        forward: false,
        position: LogPosition.end,
      );
      final lastEvent = await result.stream.first;
      final lastCommitPosition = lastEvent.originalPosition!.commitPosition;

      // Assert
      await subscriptionsClient.updateToAll(
        GroupName,
        settings: PersistentSubscriptionSettings(
          startFrom: LogPosition.checked(
            lastCommitPosition,
            lastCommitPosition,
          ),
        ),
      );
    });

    test('update throws with startFrom larger than last commit on all-stream',
        () async {
      // Arrange
      final result = await streamsClient.readFromAll(
        maxCount: 1,
        forward: false,
        position: LogPosition.end,
      );
      final lastEvent = await result.stream.first;
      final lastCommitPosition = lastEvent.originalPosition!.commitPosition;

      // Act
      final request = subscriptionsClient.updateToAll(
        GroupName,
        settings: PersistentSubscriptionSettings(
          startFrom: LogPosition.checked(
            lastCommitPosition + 100,
            lastCommitPosition,
          ),
        ),
      );
      // Assert
      await expectLater(
        request,
        throwsA(isA<PersistentSubscriptionFailedException>()),
      );
    });
  });
}
