import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

import '../../harness.dart';

void main() {
  var index = 0;
  const EventCount = 10;
  const MaxOne = 'max-one';
  const FromEnd = 'from-end';
  const ExistingStream = 'existing';
  String nextGroup() => 'some-${++index}';
  group('When using EventStoreDB v20_LTS, persistent subscription client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        timeoutAfter: null,
      );

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
      await subscriptionsClient.create(
        ExistingStream,
        FromEnd,
        settings: PersistentSubscriptionSettings(
          startFrom: StreamPosition.end,
        ),
      );
    });

    // ---------------------------------------
    // Test read operations on given stream
    // ---------------------------------------

    test('subscribe throws with unknown group on given stream', () async {
      // Act
      final request = subscriptionsClient.subscribe(
        ExistingStream,
        'unknown-group',
      );
      // Assert
      await expectLater(
        request,
        throwsA(isA<PersistentSubscriptionNotFoundException>()),
      );
    });

    test('gets first event on subscribe to given stream', () async {
      // Arrange
      final group = nextGroup();
      await subscriptionsClient.create(
        ExistingStream,
        group,
        settings: PersistentSubscriptionSettings(
          startFrom: StreamPosition.start,
        ),
      );
      // Act
      final result = await subscriptionsClient.subscribe(
        ExistingStream,
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

    test('gets middle event on subscribe to given stream', () async {
      // Arrange
      final read = await streamsClient.readFromAll(maxCount: 10);
      expect(read.isOK, isTrue);
      final events = (await read.events).toList();
      expect(events.length > 1, isTrue);
      await read.dispose();
      final expectedEvent = events[events.length ~/ 2];
      final group = nextGroup();
      await subscriptionsClient.create(
        ExistingStream,
        group,
        settings: PersistentSubscriptionSettings(
          startFrom: expectedEvent.originalEventNumber,
        ),
      );

      // Act
      final result = await subscriptionsClient.subscribe(
        ExistingStream,
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

    test('fails on second subscription on given stream with max one', () async {
      // Arrange
      await subscriptionsClient.create(
        ExistingStream,
        MaxOne,
        settings: PersistentSubscriptionSettings(
          maxSubscriberCount: 1,
        ),
      );

      // Act
      final result1 = await subscriptionsClient.subscribe(
        ExistingStream,
        MaxOne,
      );
      expect(result1.isOK, isTrue);
      final result2 = subscriptionsClient.subscribe(
        ExistingStream,
        MaxOne,
      );

      // Assert
      await expectLater(
        result2,
        throwsA(isA<MaximumSubscribersReachedException>()),
      );
      await result1.dispose();
    });

    test('fails with timeout on subscription to end of given stream', () async {
      // Act
      final result = await subscriptionsClient.subscribe(
        ExistingStream,
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

    test('gets first event written after subscribed to end of given stream',
        () async {
      // Arrange
      const StreamName = '$ExistingStream-$FromEnd';
      await subscriptionsClient.create(
        StreamName,
        FromEnd,
        settings: PersistentSubscriptionSettings(
          startFrom: StreamPosition.end,
        ),
      );
      final result = await subscriptionsClient.subscribe(
        StreamName,
        FromEnd,
      );
      expect(result.isOK, isTrue);
      final first = result.stream.first;
      final expected = harness.createTestEvents().first;

      // Act
      final write = await streamsClient.append(
          StreamState.any(StreamName),
          Stream.fromIterable(
            ([expected]),
          ));
      expect(write, isA<WriteSuccessResult>());

      // Assert
      final actual = await first;
      expect(actual.originalEventId, expected.uuid);
      await result.dispose();
    });

    test('write checkpoints when subscribing to given stream', () async {
      // Arrange
      final group = nextGroup();
      await subscriptionsClient.create(
        ExistingStream,
        group,
        settings: PersistentSubscriptionSettings(
          minCheckPointCount: 1,
          maxCheckPointCount: 1,
          startFrom: StreamPosition.start,
          checkPointAfter: Duration(milliseconds: 10),
        ),
      );

      // Act
      final result1 = await subscriptionsClient.subscribe(
        ExistingStream,
        group,
        autoAck: true,
      );
      final appeared = await result1.stream.take(10).toList();
      expect(appeared.isNotEmpty, isTrue);

      // Assert
      final checkpoints = await streamsClient.read(
        SystemStreams.persistentCheckpointStreamOn(
          ExistingStream,
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
