part of 'streams_client.dart';

typedef SubscriptionDroppedCallback = Future<void> Function(
  SubscriptionDroppedEvent,
);

typedef SubscriptionResolvedEventCallback = Future<void> Function(
  SubscriptionResolvedEvent,
);

/// A class representing a [EventStreamSubscription].
///
/// This class maintains the [state] of the subscription,
/// the [progress] along the stream, the [stream] of [ResolvedEvent]s
/// and [information][SubscriptionDroppedEvent] about the
/// [cause][SubscriptionDroppedEvent.cause] and
/// [reason][SubscriptionDroppedEvent.reason]
/// why the subscription [was dropped][onDropped].
///
/// If you need to add multiple listeners to the [stream],
/// you should use [asBroadcastStream]. When you are finished using
/// the subscription, you need to [dispose] it to close the
/// connection to the server and release resources to prevent memory leaks.
///
class EventStreamSubscription {
  /// Constructs a new [EventStreamSubscription]
  EventStreamSubscription(
    ReadEnumerator enumerator, {
    SubscriptionResolvedEventCallback? eventAppeared,
    SubscriptionDroppedCallback? subscriptionDropped,
    SubscriptionCheckpointCallback? checkpointReached,
  }) : _enumerator = enumerator {
    _stream = eventAppeared == null
        ? _enumerator.stream
        : _enumerator.stream.asyncMap(
            (e) => _onResolved(e, eventAppeared),
          );
    _checkpoints = _enumerator.checkpoints!.asyncMap(
      (p) => _onCheckpoint(p, checkpointReached),
    );
    onDropped = _enumerator.onSubscriptionDropped!
        .asStream()
        .asyncMap((e) => _onDropped(e, subscriptionDropped))
        .first;
  }

  final ReadEnumerator _enumerator;
  late final Stream<ResolvedEvent> _stream;

  /// The [StreamState] after the operation.
  ReadState get state => _enumerator.state;

  /// Check if read result is OK
  bool get isOK => _enumerator.isOK;

  /// Check if stream was not found
  bool get isStreamNotFound => _enumerator.isStreamNotFound;

  /// Check if operation has completed. Operation is completed when
  /// all events are fetched with [events] or [stream], or after
  /// [dispose] is called.
  bool get isCompleted => _enumerator.isCompleted;

  /// Current [StreamState] progress
  StreamState get progress => _enumerator.progress;

  /// Get [StreamState.streamId]
  String get streamId => _enumerator.progress.streamId;

  /// Get current [LogPosition].
  /// Returns [LogPosition.end] until first event is received.
  LogPosition get position => _enumerator.progress.position ?? LogPosition.end;

  /// The id of the [EventStreamSubscription] set by the server.
  /// Returns null if subscription failed.
  String? get subscriptionId => _enumerator.subscriptionId;

  /// Get resolved events as single-subscriber stream
  Stream<ResolvedEvent> get stream => _stream;

  /// Get resolved events as broadcast stream
  Stream<ResolvedEvent> asBroadcastStream() => _stream.asBroadcastStream();

  /// Stream of [SubscriptionCheckPoint]s
  Stream<SubscriptionCheckPoint> get checkpoints => _checkpoints;
  late final Stream<SubscriptionCheckPoint> _checkpoints;

  /// Completes when [SubscriptionDroppedReason] is given
  late final Future<SubscriptionDroppedEvent> onDropped;

  /// Dispose subscription
  Future<void> dispose() => _enumerator.dispose();

  Future<ResolvedEvent> _onResolved(
    ResolvedEvent event,
    SubscriptionResolvedEventCallback eventAppeared,
  ) async {
    {
      await eventAppeared(SubscriptionResolvedEvent(this, event));
      return event;
    }
  }

  Future<SubscriptionCheckPoint> _onCheckpoint(LogPosition position,
      SubscriptionCheckpointCallback? checkpointReached) async {
    {
      final checkpoint = SubscriptionCheckPoint(this, position);
      if (checkpointReached != null) {
        await checkpointReached(checkpoint);
      }
      return checkpoint;
    }
  }

  Future<SubscriptionDroppedEvent> _onDropped(
      Tuple2<SubscriptionDroppedReason, Object?> event,
      SubscriptionDroppedCallback? subscriptionDropped) async {
    {
      final dropped = SubscriptionDroppedEvent(
        this,
        event.item1,
        event.item2,
      );
      if (subscriptionDropped != null) {
        await subscriptionDropped(dropped);
      }
      return dropped;
    }
  }
}

/// Base class for [SubscriptionEvent]s
abstract class SubscriptionEvent {
  SubscriptionEvent(this.subscription);
  final EventStreamSubscription subscription;
}

/// Subscription event with [ResolvedEvent]
class SubscriptionResolvedEvent {
  SubscriptionResolvedEvent(this.subscription, this.resolved);
  final ResolvedEvent resolved;
  final EventStreamSubscription subscription;
}

/// Event with information about reason for dropping [subscription]
class SubscriptionDroppedEvent extends SubscriptionEvent {
  SubscriptionDroppedEvent(
    EventStreamSubscription subscription,
    this.reason,
    this.cause,
  ) : super(subscription);

  final Object? cause;
  final SubscriptionDroppedReason reason;
}
