import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

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

    test('reads parked events on all-stream', () async {
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
      final result1 = await subscriptionsClient.subscribeToAll(
        group,
        autoAck: false,
        onEventAppeared: (s, event, retryCount) async {
          s.nack(
            [event],
            'manual',
            PersistentSubscriptionNackEventAction.park,
          );
        },
      );
      final consumed1 = await result1.stream.take(EventCount).toList();
      expect(consumed1.toSet().length, EventCount);

      // Act
      final result2 = await subscriptionsClient.readParkedFromAll(group);

      // Assert
      expect(result2.isOK, isTrue);
      final parked = await result2.events;
      expect(parked.length, EventCount);

      // Cleanup
      await result1.dispose();
      await result2.dispose();
    });

    test('subscribes to parked events on all-stream', () async {
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
      final result1 = await subscriptionsClient.subscribeToAll(
        group,
        autoAck: false,
        onEventAppeared: (s, event, retryCount) async {
          s.nack(
            [event],
            'manual',
            PersistentSubscriptionNackEventAction.park,
          );
        },
      );
      final consumed1 = await result1.stream.take(EventCount).toList();
      expect(consumed1.toSet().length, EventCount);

      // Act
      final result2 = await subscriptionsClient.subscribeToParkedFromAll(
        group,
        resolveLinks: true,
      );

      // Assert
      expect(result2.isOK, isTrue);
      final parked = await result2.stream.take(EventCount).toList();
      expect(parked.length, EventCount);
      expect(
        consumed1.map((e) => e.event.eventId),
        unorderedEquals(parked.map<UuidValue>((e) => e.event.eventId)),
      );

      // Cleanup
      await result1.dispose();
      await result2.dispose();
    });

    test('replays events on all-stream', () async {
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
      final result1 = await subscriptionsClient.subscribeToAll(
        group,
        autoAck: false,
        onEventAppeared: (s, event, retryCount) async {
          s.nack(
            [event],
            'manual',
            PersistentSubscriptionNackEventAction.park,
          );
        },
      );
      final parked = await result1.stream.take(EventCount).toList();
      expect(parked.toSet().length, EventCount);

      // Act
      await result1.replay(parked.length ~/ 2);
      await subscriptionsClient.replayFromAll(group);

      var retries = 0;
      final appeared = <ResolvedEvent>[];
      final result2 = await subscriptionsClient.subscribeToAll(
        group,
        autoAck: false,
        onEventAppeared: (s, event, retryCount) async {
          s.ack([event]);
          retries += retryCount > 0 ? 1 : 0;
          appeared.add(event);
        },
      );
      final consumed2 = await result2.stream.take(EventCount).toList();

      // Make sure that all events are consumed
      final result3 = await subscriptionsClient.subscribeToAll(group);
      final consumed3 = await result3.stream
          .take(10)
          .toList()
          .timeout(Duration(milliseconds: 100), onTimeout: () => []);

      // Assert
      expect(consumed2.toSet().length, EventCount);
      expect(
        consumed2.map((e) => e.event.eventId),
        appeared.map((e) => e.event.eventId),
      );
      expect(
        consumed2.map((e) => e.event.eventId),
        unorderedEquals(parked.map<UuidValue>((e) => e.event.eventId)),
      );
      expect(retries, EventCount);
      expect(consumed3, isEmpty, reason: 'all events should be consumed');

      // Cleanup
      await result1.dispose();
      await result2.dispose();
      await result3.dispose();
    });
  });
}
