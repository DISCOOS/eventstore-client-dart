import 'package:eventstore_client/src/core/constants.dart';
import 'package:eventstore_client/src/core/position.dart';

import 'enums.dart';

/// A class representing the settings of a persistent subscription.
class PersistentSubscriptionSettings {
  /// Construct a new [PersistentSubscriptionSettings] instance
  PersistentSubscriptionSettings({
    this.startFrom,
    this.readBatchSize = 20,
    this.maxRetryCount = 10,
    this.liveBufferSize = 500,
    this.resolveLinkTos = false,
    this.extraStatistics = false,
    this.maxSubscriberCount = 0,
    this.historyBufferSize = 500,
    this.minCheckPointCount = 10,
    this.maxCheckPointCount = 1000,
    this.checkPointAfter = const Duration(seconds: 2),
    this.messageTimeout = const Duration(seconds: 30),
    this.consumerStrategy = SystemConsumerStrategies.roundRobin,
  }) {
    if (messageTimeout < Duration.zero ||
        messageTimeout.inMilliseconds > Max.toInt()) {
      throw ArgumentError.value(
        messageTimeout,
        'messageTimeout',
        'must be greater than 0 and less than or equal to $Max',
      );
    }

    if (checkPointAfter < Duration.zero ||
        checkPointAfter.inMilliseconds > Max.toInt()) {
      throw ArgumentError.value(
        checkPointAfter,
        'checkPointAfter',
        'must be greater than 0 and less than or equal to $Max',
      );
    }
  }

  /// Get default settings
  static final PersistentSubscriptionSettings Default =
      PersistentSubscriptionSettings();

  /// Whether the [PersistentSubscription] should resolve linkTo events to their linked events.
  final bool resolveLinkTos;

  /// Which event position in the stream or transaction file the subscription should start from.
  final Position? startFrom;

  /// Whether to track latency statistics on this subscription.
  final bool extraStatistics;

  /// The amount of time after which to consider a message as timed out and retried.
  final Duration messageTimeout;

  /// The maximum number of retries (due to timeout) before a message is considered to be parked.
  final int maxRetryCount;

  /// The size of the buffer (in-memory) listening to live messages as they happen before paging occurs.
  final int liveBufferSize;

  /// The number of events read at a time when paging through history.
  final int readBatchSize;

  /// The number of events to cache when paging through history.
  final int historyBufferSize;

  /// The amount of time to try to checkpoint after.
  final Duration checkPointAfter;

  /// The minimum number of messages to write to a checkpoint.
  final int minCheckPointCount;

  /// The maximum number of messages not checkpointed before forcing a checkpoint.
  final int maxCheckPointCount;

  /// The maximum number of subscribers allowed.
  final int maxSubscriberCount;

  /// The strategy to use for distributing events
  /// to client consumers. See [strategy][SystemConsumerStrategies] for
  /// system supported strategies.
  final SystemConsumerStrategies consumerStrategy;
}
