import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/read_enumerator.dart';
import 'package:eventstore_client/src/generated/persistent.pb.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';

import 'enums.dart';
import 'mixins/helpers.dart';

typedef PersistentSubscriptionResolvedEventCallback = Future<void> Function(
  PersistentSubscription subscription,
  ResolvedEvent event,
  int replayCount,
);

/// Represents a persistent subscription connection.
///
/// {@macro EventStreamSubscription}
class PersistentSubscription extends EventStreamSubscription {
  PersistentSubscription(
    StreamSink<ReadReq> requests,
    ReadEnumerator enumerator, {
    required this.autoAck,
    required Future<void> Function(int? startAt) onReplay,
    PersistentSubscriptionResolvedEventCallback? onEventAppeared,
    SubscriptionDroppedCallback? onSubscriptionDropped,
  })  : _onReplay = onReplay,
        _requests = requests,
        super(
          enumerator,
          onSubscriptionDropped: onSubscriptionDropped,
          onEventAppeared: (s, e) => _onAppeared(
            s,
            e,
            autoAck,
            requests,
            onEventAppeared,
          ),
        );

  // Stream of requests forwarded to the server
  final StreamSink<ReadReq> _requests;

  /// Acknowledge resolved events automatically when processed
  final bool autoAck;

  final Future<void> Function(int? startAt) _onReplay;

  /// The id of the [PersistentSubscription] set by the server.
  /// Returns null if subscription failed.
  @override
  String get subscriptionId => super.subscriptionId!;

  /// Dispose subscription
  @override
  Future<void> dispose() async {
    await _requests.close();
    return super.dispose();
  }

  /// Replay the parked messages for this subscription.
  ///
  /// This will push the parked messages to subscribers before
  /// any new events on the subscription.
  ///
  /// Use [stopAt] to specify the number of parked messages to replay.
  ///
  Future<void> replay([int? stopAt]) async {
    return _onReplay(stopAt);
  }

  /// Acknowledge that client has completed processing given [events]
  /// (this will tell the server it has been processed). There is no need
  /// to ack a message if you have [autoAck] is enabled.
  void ack(Iterable<ResolvedEvent> events) {
    _requests.add(_toAckReq(
      events,
    ));
  }

  static ReadReq _toAckReq(Iterable<ResolvedEvent> events) {
    final ack = ReadReq_Ack()
      ..ids.addAll(events.map(
        (e) => (UUID()..string = e.originalEventId.uuid),
      ));
    return ReadReq()..ack = ack;
  }

  /// Acknowledge that the client has failed processing given [events]
  /// (this will tell the server it has not been processed).
  /// Use [action][PersistentSubscriptionNackEventAction] to specify which
  /// action the server should take. Use [reason][String] to log a reason.
  void nack(
    Iterable<ResolvedEvent> events,
    String reason,
    PersistentSubscriptionNackEventAction action,
  ) {
    final nack = ReadReq_Nack()
      ..reason = reason
      ..action = _toAction(action)
      ..ids.addAll(events.map(
        (e) => (UUID()..string = e.originalEventId.uuid),
      ));
    _requests.add(ReadReq()..nack = nack);
  }

  ReadReq_Nack_Action _toAction(PersistentSubscriptionNackEventAction nack) {
    switch (nack) {
      case PersistentSubscriptionNackEventAction.park:
        return ReadReq_Nack_Action.Park;
      case PersistentSubscriptionNackEventAction.retry:
        return ReadReq_Nack_Action.Retry;
      case PersistentSubscriptionNackEventAction.skip:
        return ReadReq_Nack_Action.Skip;
      case PersistentSubscriptionNackEventAction.unknown:
        return ReadReq_Nack_Action.Unknown;
    }
  }

  static Future<void> _onAppeared(
    EventStreamSubscription subscription,
    ResolvedEvent event,
    bool autoAck,
    StreamSink<ReadReq> requests,
    PersistentSubscriptionResolvedEventCallback? onEventAppeared,
  ) async {
    assert(subscription is PersistentSubscription);
    assert(event is PersistentSubscriptionResolvedEvent);
    if (onEventAppeared != null) {
      await onEventAppeared(
        subscription as PersistentSubscription,
        event,
        (event as PersistentSubscriptionResolvedEvent).replayCount,
      );
    }
    if (autoAck) {
      requests.add(_toAckReq(
        [event],
      ));
    }
  }
}
