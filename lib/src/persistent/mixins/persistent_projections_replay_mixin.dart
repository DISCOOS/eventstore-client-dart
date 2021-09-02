part of 'persistent_projections_mixins.dart';

mixin EventStorePersistentSubscriptionsReplay
    on EventStorePersistentSubscriptionsMixin {
  /// Replay the parked messages for given subscription.
  ///
  /// This will push the parked messages to subscribers before
  /// any new events on the subscription.
  ///
  /// Parameters [streamId] and [groupName] identifies the
  /// [PersistentSubscription] to replay events on.
  ///
  /// Use [stopAt] to specify the number of parked messages to replay.
  ///
  Future<void> replay(
    String streamId,
    String groupName, {
    int? stopAt,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return $runRequest<void>(() async {
      await discover();
      await replayParked(
        streamId,
        groupName,
        leader,
        settings: settings,
        userCredentials: userCredentials,
        channelCredentials: $getOrAddCredentials(leader),
      );
    });
  }

  /// Replay the parked messages for given subscription
  /// on [SystemStreams.AllStream]
  ///
  /// This will push the parked messages to subscribers before
  /// any new events on the subscription.
  ///
  /// Parameters [groupName] identifies the
  /// [PersistentSubscription] to replay events on from.
  ///
  /// Use [stopAt] to specify the number of parked messages to replay.
  ///
  Future<void> replayFromAll(
    String groupName, {
    int? stopAt,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return replay(
      SystemStreams.AllStream,
      groupName,
      stopAt: stopAt,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }
}
