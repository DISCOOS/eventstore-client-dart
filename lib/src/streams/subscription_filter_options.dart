import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/resolved_event.dart';

typedef SubscriptionCheckpointCallback = Future<void> Function(
  SubscriptionCheckPoint,
);

/// A class representing the options to use with server-side filtering.
/// Server-side filtering is currently only supported on the
/// [SystemStreams.AllStream]. Use [checkpointInterval] to control how
/// often the server should send a checkpoint of current [LogPosition]
/// of the [SystemStreams.AllStream] (default is every
/// [Defaults.CheckpointInterval] events). This is useful in situations
/// where the filter matches very few events of potential millions. If the client
/// need to restart the subscription, the last checkpoint could be used
/// to prevent replaying the filter on millions events again. You can
/// pass a [callback][SubscriptionCheckpointCallback] that is invoked
/// and awaited when a checkpoint is reached. You can also listen the the
/// [checkpoints stream][EventStreamSubscription.checkpoints]
/// in [EventStreamSubscription].
class SubscriptionFilterOptions {
  /// Constructs a new [SubscriptionFilterOptions]
  SubscriptionFilterOptions(
    this.filter, {
    this.checkpointReached,
    this.checkpointInterval = Defaults.CheckpointInterval,
  }) {
    if (checkpointInterval <= 0) {
      ArgumentError.value(
        checkpointInterval,
        'checkpointInterval',
        ' must be greater than 0',
      );
    }
  }

  /// The [ReadFilter] to apply.
  final ReadFilter filter;

  /// Sets how often the checkpointReached callback is called.
  final int checkpointInterval;

  /// A [callback][SubscriptionCheckpointCallback] invoked and awaited
  /// when a checkpoint is reached. Set the [checkpointInterval] to
  /// define how often this method is called by the server.
  final SubscriptionCheckpointCallback? checkpointReached;

  /// Filter events using this filter
  Iterable<ResolvedEvent> matches(Iterable<ResolvedEvent> events) {
    return filter.matches(events);
  }

  /// Constructs a new [SubscriptionFilterOptions] with
  /// [EventTypeFilter.excludeSystemEvents] and optional
  /// [checkpointInterval] (default is [Defaults.CheckpointInterval])
  /// and [maxSearchWindow] (default is [Defaults.MaxSearchWindow]).
  /// Use [checkpointReached] to get the checkpoint each
  factory SubscriptionFilterOptions.excludeSystemEvents({
    int maxSearchWindow = Defaults.MaxSearchWindow,
    SubscriptionCheckpointCallback? checkpointReached,
    int checkpointInterval = Defaults.CheckpointInterval,
  }) =>
      SubscriptionFilterOptions(
        EventTypeFilter.excludeSystemEvents(maxSearchWindow),
        checkpointReached: checkpointReached,
        checkpointInterval: checkpointInterval,
      );
}
