import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('When subscribing to \$all stream, streams client', () {
    const ExistingCount = 10;
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        EventStoreImage.v20_LTS,
      );

    late StreamState state;
    late EventStoreStreamsClient client;

    setUpAll(() async {
      client = harness.client();
    });

    setUp(() {
      state = harness.newStreamState(StreamStateType.any);
    });

    // ----------------------------------
    // Test empty database
    // ----------------------------------

    test('subscribe to empty database', () async {
      // Arrange
      final result = await client.subscribeToAll(
        position: LogPosition.start,
      );
      expect(result.isOK, isTrue);

      // Act
      final list = await waitFor(result.asBroadcastStream());
      await result.dispose();

      // Assert
      expect(list, isEmpty, reason: 'should not contain events');
      expect(
        list.where((e) => !SystemStreams.isSystemStream(e.originalStreamId)),
        isEmpty,
        reason: 'should not contain events',
      );
      final dropped = await result.onDropped;
      expect(dropped.reason, SubscriptionDroppedReason.disposed);
    });

    // ----------------------------------
    // Test checkpoints
    // ----------------------------------

    test('sends checkpoints on filter with no matches', () async {
      // Arrange
      await seed(harness, client, state, ExistingCount * 10);
      final checkpoints = <SubscriptionCheckPoint>[];

      // Act
      final result = await client.subscribeToAll(
        filterOptions: SubscriptionFilterOptions(
          EventTypeFilter.fromPrefix('foo'),
          checkpointReached: (c) async {
            checkpoints.add(c);
          },
          checkpointInterval: 1,
        ),
      );
      expect(result.isOK, isTrue);
      final first = await result.checkpoints.first;

      // Assert
      expect(first, isA<SubscriptionCheckPoint>());
      expect(first.subscription, equals(result));
      expect(checkpoints.last, isA<SubscriptionCheckPoint>());
      expect(checkpoints.last.subscription, equals(result));
      expect(checkpoints.last, equals(first));
    });

    test('sends checkpoints on filter with all matches', () async {
      // Arrange
      await seed(harness, client, state, ExistingCount * 10);
      final checkpoints = <SubscriptionCheckPoint>[];

      // Act
      final result = await client.subscribeToAll(
        filterOptions: SubscriptionFilterOptions(
          EventTypeFilter.fromPrefix(EventStoreClientHarness.EVENT_TYPE_TEST),
          checkpointReached: (c) async {
            checkpoints.add(c);
          },
          checkpointInterval: 1,
        ),
      );
      expect(result.isOK, isTrue);
      final first = await result.checkpoints.first;

      // Assert
      expect(first, isA<SubscriptionCheckPoint>());
      expect(first.subscription, equals(result));
      expect(checkpoints.last, isA<SubscriptionCheckPoint>());
      expect(checkpoints.last.subscription, equals(result));
      expect(checkpoints.last, equals(first));
    });

    // ----------------------------------
    // Test subscription mgmnt
    // ----------------------------------

    test('calls subscription dropped when disposed', () async {
      // Arrange
      final result = await client.subscribeToAll(
        position: LogPosition.start,
      );

      // Act
      await result.dispose();

      // Assert
      expect(result.isOK, isTrue);
      final dropped = await result.onDropped;
      expect(
        dropped.reason,
        SubscriptionDroppedReason.disposed,
      );
    });

    // -----------------------------------
    // Test catchup and live subscriptions
    // -----------------------------------

    test('subscribe to all existing events and keep listing', () async {
      await testSubscribeToAllExistingEventsAndKeepListening(
        harness,
        client,
        state,
        ExistingCount,
        isExisting: (e) => e.originalStreamId == state.streamId,
      );
    });

    test('subscribe with callbacks', () async {
      // Arrange
      final appeared = <ResolvedEvent>[];
      final onDroppedCallback = Completer<SubscriptionDroppedEvent>();
      final expected = await seed(
        harness,
        client,
        state,
        ExistingCount,
      );
      final result = await client.subscribeToAll(
        onEventAppeared: (s, e) async {
          appeared.add(e);
        },
        onSubscriptionDropped: (s, d) async {
          onDroppedCallback.complete(d);
        },
      );
      expect(result.isOK, isTrue);

      // Act
      final stream = result.asBroadcastStream();
      final existing = await stream
          .where((e) => e.originalStreamId == state.streamId)
          .take(ExistingCount)
          .toList();

      // Assert
      expect(
        withoutSystemEvents(existing).map((e) => toResolvedEventString(e)),
        equals(expected.map((e) => toEventDataString(e))),
        reason: 'should contain 10 events',
      );
      expect(
        withoutSystemEvents(appeared)
            .where((e) => e.originalStreamId == state.streamId)
            .map((e) => toResolvedEventString(e)),
        equals(expected.map((e) => toEventDataString(e))),
        reason: 'should contain 10 events',
      );

      // Add new ones
      await result.dispose();

      final dropped1 = await result.onDropped;
      expect(dropped1.reason, SubscriptionDroppedReason.disposed);

      final dropped2 = await onDroppedCallback.future;
      expect(dropped1, dropped2);
    });

    // -----------------------------------
    // Test server-side filtering
    // -----------------------------------

    test('subscribe to all by stream name prefix and keep listing', () async {
      // Test
      await testSubscribeToAllExistingEventsAndKeepListening(
        harness,
        client,
        state,
        ExistingCount,
        options: SubscriptionFilterOptions(
          StreamFilter.fromPrefix(state.streamId),
        ),
        isExisting: (e) => e.originalStreamId == state.streamId,
      );
    });

    test('subscribe to all by stream name regex and keep listing', () async {
      // Test
      await testSubscribeToAllExistingEventsAndKeepListening(
        harness,
        client,
        state,
        ExistingCount,
        options: SubscriptionFilterOptions(
          StreamFilter.fromRegex(
            '${state.streamId}.*',
          ),
        ),
        isExisting: (e) => e.originalStreamId == state.streamId,
      );
    });

    test('subscribe to all by event type prefix and keep listing', () async {
      // Test
      await testSubscribeToAllExistingEventsAndKeepListening(
        harness,
        client,
        state,
        ExistingCount,
        eventType: 't1',
        options: SubscriptionFilterOptions(
          EventTypeFilter.fromPrefix('t1'),
        ),
        isExisting: (e) => e.originalStreamId == state.streamId,
      );
    });

    test('subscribe to all by event type regex and keep listing', () async {
      // Test
      await testSubscribeToAllExistingEventsAndKeepListening(
        harness,
        client,
        state,
        ExistingCount,
        eventType: 't2',
        options: SubscriptionFilterOptions(
          EventTypeFilter.fromRegex(
            't2.*',
          ),
        ),
        isExisting: (e) => e.originalStreamId == state.streamId,
      );
    });
  });
}

Future<void> testSubscribeToAllExistingEventsAndKeepListening(
  EventStoreClientHarness harness,
  EventStoreStreamsClient client,
  StreamState state,
  int existingCount, {
  LogPosition? position,
  SubscriptionFilterOptions? options,
  required bool Function(ResolvedEvent) isExisting,
  String eventType = EventStoreClientHarness.EVENT_TYPE_TEST,
}) async {
  // Arrange
  final expected = await seed(
    harness,
    client,
    state,
    existingCount,
    eventType: eventType,
  );
  final result = await client.subscribeToAll(
    position: position,
    filterOptions: options,
  );
  expect(result.isOK, isTrue);

  // Act
  final stream = result.asBroadcastStream();
  final existing = await stream.where(isExisting).take(existingCount).toList();
  final pending = waitFor(
    stream,
    expectedCount: 10,
    timeoutAfter: null,
  );
  final added = await seed(
    harness,
    client,
    state,
    10,
    eventType: eventType,
  );
  final appeared = await pending;

  // Assert
  expect(
    existing.map((e) => toResolvedEventString(e)),
    equals(expected.map((e) => toEventDataString(e))),
    reason: 'should contain $existingCount events',
  );
  expect(
    appeared.map((e) => toResolvedEventString(e)),
    equals(added.map((e) => toEventDataString(e))),
    reason: 'should contain 10 events',
  );

  // Add new ones
  await result.dispose();

  final dropped = await result.onDropped;
  expect(dropped.reason, SubscriptionDroppedReason.disposed);
}
