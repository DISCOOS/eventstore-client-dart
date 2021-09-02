import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

import '../../harness.dart';

void main() {
  var index = 0;
  const EventCount = 10;
  const FromEnd = 'from-end';
  const ExistingStream = 'existing';
  String GroupName() => 'some-$index';
  group('When using EventStoreDB LTS, persistent subscription client', () {
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
      await subscriptionsClient.create(
        ExistingStream,
        FromEnd,
        settings: PersistentSubscriptionSettings(
          startFrom: StreamPosition.end,
        ),
      );
    });

    setUp(() => ++index);

    // ---------------------------------------
    // Test create operations on given stream
    // ---------------------------------------

    test('create throws with wrong startFrom type on given stream', () async {
      // Act
      final request = subscriptionsClient.create(
        ExistingStream,
        GroupName(),
        settings: PersistentSubscriptionSettings(startFrom: LogPosition.end),
      );
      // Assert
      await expectLater(request, throwsA(isA<ArgumentError>()));
    });

    test('creates a group on given stream from start', () async {
      // Arrange
      await subscriptionsClient.create(ExistingStream, GroupName(),
          settings: PersistentSubscriptionSettings(
            startFrom: StreamPosition.start,
          ));
      // Act
      final subscription = await subscriptionsClient.subscribe(
        ExistingStream,
        GroupName(),
      );
      expect(subscription.isOK, isTrue);
      final first = await subscription.stream.first;
      expect(first, isA<ResolvedEvent>());

      // Cleanup
      await subscription.dispose();
    });

    test('creates a group on given stream from end', () async {
      // Arrange
      await subscriptionsClient.create(ExistingStream, GroupName(),
          settings: PersistentSubscriptionSettings(
            startFrom: StreamPosition.end,
          ));

      // Act
      final subscription = await subscriptionsClient.subscribe(
        ExistingStream,
        GroupName(),
      );
      expect(subscription.isOK, isTrue);
      final stream = subscription.asBroadcastStream();
      final controller = StreamController<ResolvedEvent>();
      stream.listen((event) => controller.add(event));
      final empty = await stream.take(1).toList().timeout(
            Duration(milliseconds: 100),
            onTimeout: () async => [],
          );
      // Append 10 events to check if subscription is live
      final appended = harness.createTestEvents(count: EventCount);
      final write = await streamsClient.append(
        StreamState.any(ExistingStream),
        Stream.fromIterable(appended),
      );
      expect(write, isA<WriteSuccessResult>());
      expect(write.actualType, equals(StreamStateType.stream_exists));
      final consumed = await controller.stream.take(EventCount).toList();

      // Assert
      expect(empty, isEmpty);
      expect(consumed, isNotEmpty);

      // Cleanup
      await controller.close();
      await subscription.dispose();
    });

    test('creates a group on given stream after deleting it', () async {
      // Arrange
      await subscriptionsClient.create(ExistingStream, GroupName());
      await subscriptionsClient.delete(ExistingStream, GroupName());
      // Assert
      await subscriptionsClient.create(ExistingStream, GroupName(),
          settings: PersistentSubscriptionSettings(
            startFrom: StreamPosition.start,
          ));
      final subscription = await subscriptionsClient.subscribe(
        ExistingStream,
        GroupName(),
      );
      expect(subscription.isOK, isTrue);
      final first = await subscription.stream.first;
      expect(first, isA<ResolvedEvent>());
      await subscription.dispose();
    });

    test('create throws on duplicate group on given stream', () async {
      // Arrange
      await subscriptionsClient.create(ExistingStream, GroupName());

      // Act
      final request = subscriptionsClient.create(ExistingStream, GroupName());

      // Assert
      await expectLater(
        request,
        throwsA(
          isA<PersistentSubscriptionExistsException>()
              .having(
                (e) => e.streamId,
                'Is stream id',
                ExistingStream,
              )
              .having(
                (e) => e.groupName,
                'Is group name',
                GroupName(),
              ),
        ),
      );
    });
  });
}
