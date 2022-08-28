import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../../fixtures/filters.dart';
import '../../harness.dart';

void main() {
  var index = 0;
  String GroupName() => 'existing-$index';
  group('When using EventStoreDB v20_LTS, client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        EventStoreImage.V20_LTS,
        timeoutAfter: null,
        runProjections: 'all',
      );

    late final EventStoreStreamsClient streamsClient;
    late final EventStorePersistentSubscriptionsClient subscriptionsClient;

    setUpAll(() {
      streamsClient = harness.client();
      subscriptionsClient = EventStorePersistentSubscriptionsClient(
        streamsClient.settings,
      );
    });

    setUp(() => index++);

    // ---------------------------------------
    // Test create operations
    // ---------------------------------------

    test('create throws exception on create to all-stream', () async {
      // Arrange
      final request = subscriptionsClient.createToAll(
        GroupName(),
        settings: PersistentSubscriptionSettings(startFrom: StreamPosition.end),
      );

      await expectLater(request, throwsA(isA<FeatureNotSupportedException>()));
    });
  });

  group('When using EventStoreDB v21_LTS, persistent subscription client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(
        settings: EventStoreClientSettings.V21,
      )
      ..install(
        EventStoreImage.V21_LTS,
        timeoutAfter: null,
      );

    late final EventStoreStreamsClient streamsClient;
    late final EventStorePersistentSubscriptionsClient subscriptionsClient;

    setUpAll(() async {
      streamsClient = harness.client();
      subscriptionsClient = EventStorePersistentSubscriptionsClient(
        streamsClient.settings,
      );
    });

    setUp(() => index++);

    // ---------------------------------------
    // Test create operations on all-stream
    // ---------------------------------------

    test('create throws with wrong startFrom type on all-stream', () async {
      // Act
      final request = subscriptionsClient.createToAll(
        GroupName(),
        settings: PersistentSubscriptionSettings(
          startFrom: StreamPosition.end,
        ),
      );
      // Assert
      await expectLater(request, throwsA(isA<ArgumentError>()));
    });

    test('creates a group on all-stream', () async {
      // Act
      await subscriptionsClient.createToAll(GroupName());
      // Assert
      final subscription = await subscriptionsClient.subscribeToAll(
        GroupName(),
      );
      expect(subscription.isOK, isTrue);
      final first = await subscription.stream.first;
      expect(first, isA<ResolvedEvent>());
    });

    test('creates a group on all-stream after deleting it', () async {
      // Arrange
      await subscriptionsClient.createToAll(GroupName());
      await subscriptionsClient.deleteToAll(GroupName());
      // Assert
      await subscriptionsClient.createToAll(GroupName());
      final subscription = await subscriptionsClient.subscribeToAll(
        GroupName(),
      );
      expect(subscription.isOK, isTrue);
      final first = await subscription.stream.first;
      expect(first, isA<ResolvedEvent>());
    });

    test('create throws on duplicate group on all-stream', () async {
      // Arrange
      await subscriptionsClient.createToAll(GroupName());

      // Act
      final request = subscriptionsClient.createToAll(GroupName());

      // Assert
      await expectLater(
        request,
        throwsA(
          isA<PersistentSubscriptionExistsException>()
              .having(
                (e) => e.streamId,
                'Is stream id',
                SystemStreams.AllStream,
              )
              .having(
                (e) => e.groupName,
                'Is group name',
                GroupName(),
              ),
        ),
      );
    });

    test('creates an filtered subscription group on all-stream', () async {
      // Assert
      for (var filter in Filters.all('some')) {
        await subscriptionsClient.createToAll(
          'existing-${filter.runtimeType}-${filter.isPrefix ? 'prefix' : 'regex'}',
          filterOptions: SubscriptionFilterOptions(filter),
        );
      }
    });

    test('creates with startFrom equal to last commit on all-stream', () async {
      // Arrange
      final result = await streamsClient.readFromAll(
        maxCount: 1,
        forward: false,
        position: LogPosition.end,
      );
      final lastEvent = await result.stream.first;
      final lastCommitPosition = lastEvent.originalPosition!.commitPosition;

      // Assert
      await subscriptionsClient.createToAll(
        GroupName(),
        settings: PersistentSubscriptionSettings(
          startFrom: LogPosition.checked(
            lastCommitPosition,
            lastCommitPosition,
          ),
        ),
      );
    });

    test('create throws with startFrom larger than last commit on all-stream',
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
      final request = subscriptionsClient.createToAll(
        GroupName(),
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
