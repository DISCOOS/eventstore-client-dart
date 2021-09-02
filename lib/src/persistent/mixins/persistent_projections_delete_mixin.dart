part of 'persistent_projections_mixins.dart';

mixin EventStorePersistentSubscriptionsDelete
    on EventStorePersistentSubscriptionsMixin {
  /// Deletes a persistent subscription.
  ///
  /// Parameters [streamId] and [groupName] identifies the
  /// [PersistentSubscription] that is deleted.
  ///
  Future<void> delete(
    String streamId,
    String groupName, {
    UserCredentials? userCredentials,
  }) async {
    return $runRequest<void>(() async {
      final client = await $getClient();
      await client.delete(
        DeleteReq()
          ..options = _toDeleteReq(
            groupName,
            streamId,
          ),
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
    });
  }

  /// Deletes a persistent subscription to [$all stream][SystemStreams.AllStream].
  ///
  /// Parameters [groupName] identifies which [PersistentSubscription]
  /// that is deleted.
  ///
  Future<void> deleteToAll(
    String groupName, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return delete(
      SystemStreams.AllStream,
      groupName,
      userCredentials: userCredentials,
    );
  }

  DeleteReq_Options _toDeleteReq(String groupName, String streamId) {
    final options = DeleteReq_Options()..groupName = groupName;
    if (streamId == SystemStreams.AllStream) {
      options.all = Empty();
    } else {
      options.streamIdentifier = toStreamIdentifier(streamId);
    }
    return options;
  }
}
