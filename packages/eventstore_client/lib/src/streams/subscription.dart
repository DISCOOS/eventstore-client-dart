part of 'streams_client.dart';

typedef SubscriptionDroppedCallback = Future<void> Function(
  EventStreamSubscription subscription,
  SubscriptionDroppedEvent event,
);

typedef SubscriptionResolvedEventCallback = Future<void> Function(
  EventStreamSubscription subscription,
  ResolvedEvent event,
);

/// A class representing a [ResolvedEvent] stream subscription.
///
/// {@macro EventStreamSubscription}
///
/// {@template EventStreamSubscription}
/// This class maintains the [state] of the subscription,
/// the [progress] along the stream, the [stream] of
/// [ResolvedEvent]s and [information][SubscriptionDroppedEvent]
/// about the [cause][SubscriptionDroppedEvent.cause] and
/// [reason][SubscriptionDroppedEvent.reason] why the subscription
/// [was dropped][onDropped].
///
/// If you need to add multiple listeners to the [stream],
/// you should use [asBroadcastStream]. When you are finished using
/// the subscription, you need to [dispose] it to close the
/// connection to the server and release resources to prevent memory leaks.
/// {@endtemplate}
///
class EventStreamSubscription {
  /// Constructs a new [EventStreamSubscription]
  EventStreamSubscription(
    ReadEnumerator enumerator, {
    SubscriptionResolvedEventCallback? onEventAppeared,
    SubscriptionDroppedCallback? onSubscriptionDropped,
    SubscriptionCheckpointCallback? checkpointReached,
  }) : _enumerator = enumerator {
    _stream = onEventAppeared == null
        ? _enumerator.stream
        : _enumerator.stream.asyncMap(
            (e) => _onResolved(e, onEventAppeared),
          );
    _checkpoints = _enumerator.checkpoints!.asyncMap(
      (p) => _onCheckpoint(p, checkpointReached),
    );
    onDropped = _enumerator.onSubscriptionDropped!
        .asStream()
        .asyncMap((e) => _onDropped(e, onSubscriptionDropped))
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
  /// all events are fetched with [stream], or after [dispose] is called.
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
    SubscriptionResolvedEventCallback? onEventAppeared,
  ) async {
    {
      if (onEventAppeared != null) {
        await onEventAppeared(this, event);
      }
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
      SubscriptionDroppedCallback? onSubscriptionDropped) async {
    {
      final dropped = SubscriptionDroppedEvent(
        event.item1,
        event.item2,
      );
      if (onSubscriptionDropped != null) {
        await onSubscriptionDropped(this, dropped);
      }
      return dropped;
    }
  }
}

/// Event with information about reason for dropping [subscription]
class SubscriptionDroppedEvent {
  SubscriptionDroppedEvent(
    this.reason,
    this.cause,
  );

  final Object? cause;
  final SubscriptionDroppedReason reason;

  /// Check if [cause] was [StreamDeletedException]
  bool get isDeleted => cause is StreamDeletedException;

  /// Check if [reason] was [SubscriptionDroppedReason.disposed]
  bool get isDisposed => reason == SubscriptionDroppedReason.disposed;
}
