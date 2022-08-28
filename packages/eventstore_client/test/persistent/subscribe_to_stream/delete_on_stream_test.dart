import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../../harness.dart';

void main() {
  var index = 0;
  const EventCount = 10;
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
    });

    // ---------------------------------------
    // Test delete operations on given stream
    // ---------------------------------------

    test('deletes existing without subscribers on given stream ', () async {
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
      await subscriptionsClient.delete(ExistingStream, group);
      final request = subscriptionsClient.subscribe(ExistingStream, group);

      // Assert
      await expectLater(
        request,
        throwsA(isA<PersistentSubscriptionNotFoundException>()),
      );
    });

    test('deletes existing with subscribers on given stream', () async {
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
      final result1 = await subscriptionsClient.subscribe(
        ExistingStream,
        group,
      );
      await result1.stream.first;

      // Act
      await subscriptionsClient.delete(ExistingStream, group);
      final request2 = subscriptionsClient.subscribe(ExistingStream, group);

      // Assert
      await expectLater(
        request2,
        throwsA(isA<PersistentSubscriptionNotFoundException>()),
      );

      // Cleanup
      await result1.dispose();
    });

    test('delete throws if non-existing on given stream ', () async {
      // Arrange
      final group = nextGroup();

      // Act
      final request = subscriptionsClient.delete(ExistingStream, group);

      // Assert
      await expectLater(
        request,
        throwsA(isA<PersistentSubscriptionNotFoundException>()),
      );
    });
  });
}
