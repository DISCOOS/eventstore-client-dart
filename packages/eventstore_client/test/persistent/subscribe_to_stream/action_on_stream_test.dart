import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../../harness.dart';

void main() {
  var index = 0;
  const EventCount = 10;
  const FromEnd = 'from-end';
  const ExistingStream = 'existing';
  String nextGroup() => 'some-${++index}';
  group('When using EventStoreDB v20_LTS, persistent subscription client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(EventStoreImage.V20_LTS, timeoutAfter: null);

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
    // Test action operations on given stream
    // ---------------------------------------

    test('auto-acknowledges events on given stream', () async {
      // Arrange
      final group = nextGroup();
      await subscriptionsClient.create(
        ExistingStream,
        group,
        settings: PersistentSubscriptionSettings(
          startFrom: StreamPosition.start,
          // Ensure messages are not parked on timeout (no retries)
          messageTimeout: Duration.zero,
        ),
      );

      // Act
      final result1 = await subscriptionsClient.subscribe(
        ExistingStream,
        group,
        autoAck: true,
      );
      final consumed1 = await result1.stream.take(10).toList();
      expect(consumed1.isNotEmpty, isTrue);

      // Assert
      final result2 = await subscriptionsClient.subscribe(
        ExistingStream,
        group,
        autoAck: true,
      );
      final consumed2 = await result2.stream
          .take(10)
          .toList()
          .timeout(Duration(milliseconds: 100), onTimeout: () => []);

      // All events should be consumed by subscription 1
      expect(consumed2.isEmpty, isTrue);

      await result1.dispose();
      await result2.dispose();

      // Assert
    });

    test('retry events manually on given stream', () async {
      // Arrange
      final group = nextGroup();
      await subscriptionsClient.create(
        ExistingStream,
        group,
        settings: PersistentSubscriptionSettings(
          startFrom: StreamPosition.start,
          // Ensure messages are not parked on timeout (no retries)
          messageTimeout: Duration.zero,
        ),
      );

      // Act
      final result1 = await subscriptionsClient.subscribe(
        ExistingStream,
        group,
        autoAck: false,
        onEventAppeared: (s, event, retryCount) async {
          s.nack(
            [event],
            'manual',
            PersistentSubscriptionNackEventAction.retry,
          );
        },
      );
      final consumed1 = await result1.stream.take(EventCount).toList();
      expect(consumed1.toSet().length, EventCount);

      // Assert
      var retries = 0;
      final appeared = <ResolvedEvent>[];
      final result2 = await subscriptionsClient.subscribe(
        ExistingStream,
        group,
        autoAck: false,
        onEventAppeared: (s, event, retryCount) async {
          s.ack([event]);
          retries += retryCount > 0 ? 1 : 0;
          appeared.add(event);
        },
      );
      final consumed2 = await result2.stream.take(EventCount).toList();
      expect(consumed2.toSet().length, EventCount);

      expect(
        consumed2.map((e) => e.originalEventId),
        appeared.map((e) => e.originalEventId),
      );
      expect(
        consumed2.map((e) => e.originalEventId),
        unorderedEquals(consumed1.map<UuidValue>((e) => e.originalEventId)),
      );
      expect(retries, EventCount);

      // Make sure that all events are consumed
      final result3 = await subscriptionsClient.subscribe(
        ExistingStream,
        group,
      );
      final consumed3 = await result3.stream
          .take(10)
          .toList()
          .timeout(Duration(milliseconds: 100), onTimeout: () => []);
      expect(consumed3, isEmpty);

      // Cleanup
      await result1.dispose();
      await result2.dispose();
      await result3.dispose();
    });

    test('skips events manually on given stream', () async {
      // Arrange
      final group = nextGroup();
      await subscriptionsClient.create(
        ExistingStream,
        group,
        settings: PersistentSubscriptionSettings(
          startFrom: StreamPosition.start,
          // Ensure messages are not parked on timeout (no retries)
          messageTimeout: Duration.zero,
        ),
      );

      // Act
      final result1 = await subscriptionsClient.subscribe(
        ExistingStream,
        group,
        autoAck: false,
        onEventAppeared: (s, event, retryCount) async {
          s.nack(
            [event],
            'skip',
            PersistentSubscriptionNackEventAction.skip,
          );
        },
      );
      final consumed1 = await result1.stream.take(EventCount).toList();
      expect(consumed1.toSet().length, EventCount);

      final appended = harness.createTestEvents(count: EventCount);
      for (var event in appended) {
        final write = await streamsClient.append(
          StreamState.any(ExistingStream),
          Stream.fromIterable([event]),
        );
        expect(write, isA<WriteSuccessResult>());
        expect(write.actualType, equals(StreamStateType.stream_exists));
      }
      final result2 = await subscriptionsClient.subscribe(
        ExistingStream,
        group,
      );

      // Assert
      expect(result2.isOK, isTrue);
      final consumed2 = await result2.stream.take(EventCount).toList();
      expect(
        consumed2.map((e) => e.event.eventId.uuid),
        unorderedEquals(appended.map<String>((e) => e.uuid.uuid)),
      );

      // Cleanup
      await result1.dispose();
      await result2.dispose();
    });
  });
}
