import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

import '../../harness.dart';

void main() {
  var index = 0;
  const EventCount = 10;
  const MaxOne = 'max-one';
  const FromEnd = 'from-end';
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
      await subscriptionsClient.createToAll(
        FromEnd,
        settings: PersistentSubscriptionSettings(
          startFrom: LogPosition.end,
        ),
        filterOptions: SubscriptionFilterOptions.excludeSystemEvents(),
      );
    });

    // ---------------------------------------
    // Test read operations on all-stream
    // ---------------------------------------

    test('subscribe throws with unknown group on all-stream', () async {
      // Act
      final request = subscriptionsClient.subscribeToAll(
        'unknown-group',
      );
      // Assert
      await expectLater(
        request,
        throwsA(isA<PersistentSubscriptionNotFoundException>()),
      );
    });

    test('gets first event on subscribe to all-stream', () async {
      // Arrange
      final group = nextGroup();
      await subscriptionsClient.createToAll(
        group,
        settings: PersistentSubscriptionSettings(
          startFrom: LogPosition.start,
        ),
        filterOptions: SubscriptionFilterOptions.excludeSystemEvents(),
      );
      // Act
      final result = await subscriptionsClient.subscribeToAll(
        group,
      );
      expect(result.isOK, isTrue);
      final event = await result.stream.first;
      // Assert
      expect(
        event.originalEventId,
        exists.first.uuid,
        reason: 'should get first event',
      );
      await result.dispose();
    });

    test('gets middle event on subscribe to all-stream', () async {
      // Arrange
      final read = await streamsClient.readFromAll(maxCount: 10);
      expect(read.isOK, isTrue);
      final events = (await read.events).toList();
      expect(events.length > 1, isTrue);
      await read.dispose();
      final expectedEvent = events[events.length ~/ 2];
      final group = nextGroup();
      await subscriptionsClient.createToAll(
        group,
        settings: PersistentSubscriptionSettings(
          startFrom: expectedEvent.originalPosition,
        ),
        filterOptions: SubscriptionFilterOptions.excludeSystemEvents(),
      );

      // Act
      final result = await subscriptionsClient.subscribeToAll(
        group,
      );
      expect(result.isOK, isTrue);
      final event = await result.stream.first;

      // Assert
      expect(
        event.originalEventId,
        expectedEvent.originalEventId,
        reason: 'should get first event',
      );
      await result.dispose();
    });

    test('fails on second subscription on all-stream with max one', () async {
      // Arrange
      await subscriptionsClient.createToAll(
        MaxOne,
        settings: PersistentSubscriptionSettings(
          maxSubscriberCount: 1,
        ),
        filterOptions: SubscriptionFilterOptions.excludeSystemEvents(),
      );

      // Act
      final result1 = await subscriptionsClient.subscribeToAll(
        MaxOne,
      );
      expect(result1.isOK, isTrue);
      final result2 = subscriptionsClient.subscribeToAll(
        MaxOne,
      );

      // Assert
      await expectLater(
        result2,
        throwsA(isA<MaximumSubscribersReachedException>()),
      );
      await result1.dispose();
    });

    test('fails with timeout on subscription to end of all-stream', () async {
      // Act
      final result = await subscriptionsClient.subscribeToAll(
        FromEnd,
      );
      expect(result.isOK, isTrue);

      // Assert
      await expectLater(
        result.stream.first.timeout(Duration(seconds: 1)),
        throwsA(isA<TimeoutException>()),
      );
      await result.dispose();
    });

    test('gets first event written after subscribed to end of all-stream',
        () async {
      // Arrange
      final result = await subscriptionsClient.subscribeToAll(
        FromEnd,
      );
      expect(result.isOK, isTrue);
      final first = result.stream.first;
      final expected = harness.createTestEvents(type: 'after').first;

      // Act
      final write = await streamsClient.append(
          StreamState.any(UuidV4.newUuid().value.uuid),
          Stream.fromIterable(
            ([expected]),
          ));
      expect(write, isA<BatchWriteSuccessResult>());

      // Assert
      final actual = await first;
      expect(actual.originalEventId, expected.uuid);
      await result.dispose();
    });

    test('write checkpoints when subscribing to all-stream', () async {
      // Arrange
      final group = nextGroup();
      await subscriptionsClient.createToAll(
        group,
        settings: PersistentSubscriptionSettings(
          minCheckPointCount: 1,
          maxCheckPointCount: 5,
          startFrom: LogPosition.start,
          checkPointAfter: Duration(seconds: 1),
        ),
        filterOptions: SubscriptionFilterOptions(EventTypeFilter.fromPrefix(
          EventStoreClientHarness.EVENT_TYPE_TEST,
        )),
      );

      // Act
      final result1 = await subscriptionsClient.subscribeToAll(
        group,
        autoAck: true,
      );
      final appeared = await result1.stream.take(10).toList();
      expect(appeared.isNotEmpty, isTrue);

      // Assert
      final checkpoints = await streamsClient.read(
        SystemStreams.persistentCheckpointStreamOn(
          SystemStreams.AllStream,
          group,
        ),
      );
      expect(
        checkpoints.isOK,
        isTrue,
        reason: "checkpoint read state was ${checkpoints.state.name}",
      );
      expect(await checkpoints.events, isNotEmpty);

      // Cleanup
      await result1.dispose();
      await checkpoints.dispose();
    });
  });
}
