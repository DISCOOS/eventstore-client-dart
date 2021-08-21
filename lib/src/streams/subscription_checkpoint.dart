import 'package:eventstore_client_dart/eventstore_client_dart.dart';

/// A class representing a checkpoint [LogPosition] reached by a [EventStreamSubscription]
class SubscriptionCheckPoint {
  /// Constructs a new [SubscriptionCheckPoint]
  SubscriptionCheckPoint(this.subscription, this.position);

  /// Checkpoint position in the log
  final LogPosition position;

  /// [EventStreamSubscription] which checkpoint was reached
  final EventStreamSubscription subscription;
}
