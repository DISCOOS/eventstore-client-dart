import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

import '../../harness.dart';

void main() {
  var index = 0;
  const EventCount = 10;
  String nextGroup() => 'some-${++index}';
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

    late Iterable<EventData> exists;
    late final EventStoreStreamsClient streamsClient;
    late final EventStorePersistentSubscriptionsClient subscriptionsClient;

    setUpAll(() async {
      streamsClient = harness.client();
      exists = harness.createTestEvents(count: EventCount);
      // Append to random streams to make sure we
      // have at least 10 events in transaction file
      for (var event in exists) {
        final write = await streamsClient.append(
          StreamState.any(UuidV4.newUuid().value.uuid),
          Stream.fromIterable([event]),
        );
        expect(write, isA<BatchWriteSuccessResult>());
        expect(write.actualType, equals(StreamStateType.stream_exists));
      }
      subscriptionsClient = EventStorePersistentSubscriptionsClient(
        streamsClient.settings,
      );
    });

    // ---------------------------------------
    // Test delete operations on all-stream
    // ---------------------------------------

    test('deletes existing without subscribers on all-stream ', () async {
      // Arrange
      final group = nextGroup();
      await subscriptionsClient.createToAll(
        group,
        settings: PersistentSubscriptionSettings(
          startFrom: LogPosition.start,
          // Ensure messages are not parked on timeout (no retries)
          messageTimeout: Duration.zero,
        ),
        filterOptions: SubscriptionFilterOptions(EventTypeFilter.fromPrefix(
          EventStoreClientHarness.EVENT_TYPE_TEST,
        )),
      );

      // Act
      await subscriptionsClient.deleteToAll(group);
      final request = subscriptionsClient.subscribeToAll(group);

      // Assert
      await expectLater(
        request,
        throwsA(isA<PersistentSubscriptionNotFoundException>()),
      );
    });

    test('deletes existing with subscribers on all-stream ', () async {
      // Arrange
      final group = nextGroup();
      await subscriptionsClient.createToAll(
        group,
        settings: PersistentSubscriptionSettings(
          startFrom: LogPosition.start,
          // Ensure messages are not parked on timeout (no retries)
          messageTimeout: Duration.zero,
        ),
        filterOptions: SubscriptionFilterOptions(EventTypeFilter.fromPrefix(
          EventStoreClientHarness.EVENT_TYPE_TEST,
        )),
      );
      final result1 = await subscriptionsClient.subscribeToAll(group);
      await result1.stream.first;

      // Act
      await subscriptionsClient.deleteToAll(group);
      final request2 = subscriptionsClient.subscribeToAll(group);

      // Assert
      await expectLater(
        request2,
        throwsA(isA<PersistentSubscriptionNotFoundException>()),
      );

      // Cleanup
      await result1.dispose();
    });

    test('delete throws if non-existing on all-stream ', () async {
      // Arrange
      final group = nextGroup();

      // Act
      final request = subscriptionsClient.deleteToAll(group);

      // Assert
      await expectLater(
        request,
        throwsA(isA<PersistentSubscriptionNotFoundException>()),
      );
    });
  });
}
