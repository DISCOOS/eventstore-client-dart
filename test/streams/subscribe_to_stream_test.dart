import 'dart:async';
import 'dart:convert';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/resolved_event.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('When subscribing to a stream, streams client', () {
    const ExistingCount = 10;
    const StreamThatDoesNotExist = 'that-does-not-exist';
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install();

    late StreamState state;
    late EventStoreStreamsClient client;

    setUpAll(() async {
      client = harness.client();
    });

    setUp(() {
      state = harness.newStreamState(StreamStateType.any);
    });

    // ----------------------------------
    // Test subscription mgmnt
    // ----------------------------------

    test('calls subscription dropped when disposed', () async {
      // Arrange
      final result = await client.subscribe(
        state.streamId,
      );

      // Act
      await result.dispose();

      // Assert
      expect(result.isOK, isTrue);
      final dropped = await result.onDropped;
      expect(dropped.reason, SubscriptionDroppedReason.disposed);
    });

    // -----------------------------------
    // Test catchup and live subscriptions
    // -----------------------------------

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
      final result = await client.subscribe(
        state.streamId,
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
        existing.map((e) => toResolvedEventString(e)),
        equals(expected.map((e) => toEventDataString(e))),
        reason: 'should contain 10 events',
      );
      expect(
        appeared.map((e) => toResolvedEventString(e)),
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

    test('subscribe to non-existing stream', () async {
      // Arrange
      final result = await client.subscribe(
        StreamThatDoesNotExist,
      );
      expect(result.isOK, isTrue);

      // Act
      final stream = result.asBroadcastStream();
      final existing = await waitFor(stream);
      await result.dispose();

      // Assert
      expect(existing, isEmpty, reason: 'should not contain events');
      final dropped = await result.onDropped;
      expect(dropped.reason, SubscriptionDroppedReason.disposed);
    });

    test('subscribe to non-existing stream then get events', () async {
      // Arrange
      final result = await client.subscribe(
        StreamThatDoesNotExist,
      );
      expect(result.isOK, isTrue);

      // Act
      final stream = result.asBroadcastStream();
      final existing = await waitFor(stream);
      final pending = waitFor(
        stream,
        expectedCount: 10,
        timeoutAfter: null,
      );
      final added = await seed(
        harness,
        client,
        StreamState.any(StreamThatDoesNotExist),
        10,
      );
      final appeared = await pending;

      // Assert
      expect(existing, isEmpty, reason: 'should not contain events');
      expect(
        appeared.map((e) => utf8.decode(e.originalEvent.data)),
        equals(added.map((e) => utf8.decode(e.data))),
        reason: 'should contain 10 events',
      );

      // Cleanup
      await result.dispose();
      final dropped = await result.onDropped;
      expect(dropped.reason, SubscriptionDroppedReason.disposed);
    });

    test('subscribe to all existing events and keep listing', () async {
      // Arrange
      final expected = await seed(harness, client, state, ExistingCount);

      // Act
      final result = await client.subscribe(
        state.streamId,
      );
      expect(result.isOK, isTrue);
      final stream = result.asBroadcastStream();
      final existing = await waitFor(
        stream,
        timeoutAfter: null,
        expectedCount: ExistingCount,
      );
      final pending = waitFor(
        stream,
        timeoutAfter: null,
        expectedCount: 10,
      );
      final added = await seed(
        harness,
        client,
        state,
        10,
      );
      final appeared = await pending;

      // Assert
      expect(
        existing.map((e) => e.originalEventId),
        equals(expected.map((e) => e.uuid)),
        reason: 'should contain $ExistingCount events',
      );
      expect(
        appeared.map((e) => utf8.decode(e.originalEvent.data)),
        equals(added.map((e) => utf8.decode(e.data))),
        reason: 'should contain 10 events',
      );

      // Cleanup
      await result.dispose();
      final dropped = await result.onDropped;
      expect(dropped.reason, SubscriptionDroppedReason.disposed);
    });

    test('allow multiple subscriptions to same stream', () async {
      // Arrange
      final expected = await seed(harness, client, state, 10);

      final results = await Future.wait([
        client.subscribe(state.streamId),
        client.subscribe(state.streamId),
      ]);
      expect(results.every((r) => r.isOK), isTrue);

      // Act
      final existing = await Future.wait(
        results.map((r) => waitFor(
              r.asBroadcastStream(),
              timeoutAfter: null,
              expectedCount: 10,
            )),
      );

      // Assert
      expect(
        existing[0].map((e) => utf8.decode(e.originalEvent.data)),
        equals(expected.map((e) => utf8.decode(e.data))),
        reason: 'stream 1 should contain 10 events',
      );
      expect(
        existing[1].map((e) => utf8.decode(e.originalEvent.data)),
        equals(expected.map((e) => utf8.decode(e.data))),
        reason: 'stream 2 should contain 10 events',
      );

      // Cleanup
      await Future.wait(results.map((r) => r.dispose()));
      final dropped = await Future.wait(results.map((r) => r.onDropped));
      expect(dropped[0].reason, SubscriptionDroppedReason.disposed);
      expect(dropped[1].reason, SubscriptionDroppedReason.disposed);
    });

    test('subscribes from position (catchup) and drops on dispose', () async {
      // Arrange
      await seed(
        harness,
        client,
        state,
        ExistingCount * 100,
      );
      final start = StreamPosition.checked(15);

      // Start position is exclusive of events subscribed to
      final expected = start + 1;

      // Act
      final result = await client.subscribe(
        state.streamId,
        position: start,
      );
      expect(result.isOK, isTrue);
      final first = await result.stream.take(1).first;
      await result.dispose();
      final dropped = await result.onDropped;

      // Assert
      expect(first.originalEventNumber.value, expected.value);
      expect(dropped.cause, isNull);
      expect(dropped.reason, SubscriptionDroppedReason.disposed);
    });

    test('subscribes to start (catchup) and catches deletions', () async {
      // Arrange
      await seed(
        harness,
        client,
        state,
        // Increase number of events to ensure that subscription
        // is not live (at the end of the stream waiting for new events)
        // when the stream is tombstoned. Adding many events and
        // subscribing to the beginning of the stream will reduce
        // the probability that the subscription reaches the end before
        // the stream is tombstoned.
        ExistingCount * 100,
      );
      final result = await client.subscribe(
        state.streamId,
      );
      expect(result.isOK, isTrue);
      final first = await result.stream.take(1).first;

      // Act
      await client.tombstone(state);

      // Assert
      final dropped = await result.onDropped;
      expect(first.originalEventNumber.value, Int64.ZERO);
      expect(dropped.cause, isA<StreamDeletedException>());
      expect(
        (dropped.cause as StreamDeletedException).cause,
        isA<GrpcError>(),
        reason: 'Server should throw an GrpcError during catchup',
      );
      expect(dropped.reason, SubscriptionDroppedReason.serverError);
    });

    test('subscribes, catches to end (live) and catches deletions', () async {
      // Arrange
      await seed(
        harness,
        client,
        state,
        ExistingCount,
      );
      final expected = StreamPosition.checked(
        ExistingCount - 1,
      );
      final result = await client.subscribe(
        state.streamId,
        position: StreamPosition.start,
      );
      expect(result.isOK, isTrue);
      final last = await result.stream.take(ExistingCount).last;

      // Act
      await client.tombstone(state);

      // Assert
      final dropped = await result.onDropped;
      expect(last.originalEventNumber.value, expected.value);
      expect(dropped.cause, isA<StreamDeletedException>());
      expect(
        (dropped.cause as StreamDeletedException).cause,
        isA<ResolvedEvent>(),
        reason: 'Server should send an StreamDeleted event when live',
      );
      expect(dropped.reason, SubscriptionDroppedReason.serverError);
    });

    test('subscribes to end (live) and catches deletions', () async {
      // Arrange
      await seed(
        harness,
        client,
        state,
        ExistingCount,
      );
      final expected = StreamPosition.checked(Max);
      final result = await client.subscribe(
        state.streamId,
        position: StreamPosition.end,
      );
      expect(result.isOK, isTrue);

      // Act
      await client.tombstone(state);

      // Assert
      final dropped = await result.onDropped;
      expect(dropped.cause, isA<StreamDeletedException>());
      final deleted = (dropped.cause as StreamDeletedException).cause;
      expect(
        deleted,
        isA<StreamDeletedEvent>(),
        reason: 'Server should send an StreamDeletedEvent when live',
      );
      expect(
        (deleted as ResolvedEvent).originalEventNumber,
        expected,
      );
      expect(dropped.reason, SubscriptionDroppedReason.serverError);
    });
  });
}

Future<void> testSubscribeToStreamExistingEventsAndKeepListening(
  EventStoreClientHarness harness,
  EventStoreStreamsClient client,
  StreamState state,
  int existingCount, {
  StreamPosition? position,
  String eventType = EventStoreClientHarness.EVENT_TYPE_TEST,
  Iterable<ResolvedEvent> Function(Iterable<ResolvedEvent>)? withExisting,
}) async {
  // Arrange
  final expected = await seed(
    harness,
    client,
    state,
    existingCount,
    eventType: eventType,
  );

  final result = await client.subscribe(
    state.streamId,
    position: position,
  );
  expect(result.isOK, isTrue);

  // Act
  final stream = result.asBroadcastStream();
  final existing = await waitFor(stream);
  final pending = waitFor(stream);
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
    (withExisting ?? withoutSystemEvents)(existing)
        .map((e) => toResolvedEventString(e)),
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
