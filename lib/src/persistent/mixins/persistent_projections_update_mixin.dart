part of 'persistent_projections_mixins.dart';

mixin EventStorePersistentSubscriptionsUpdate
    on EventStorePersistentSubscriptionsMixin {
  /// Updates a filtered persistent subscription [groupName] on given stream.
  ///
  /// Parameters [streamId] and [groupName] identifies the
  /// [PersistentSubscription] to subscribe to.
  ///
  /// Callback [onEventAppeared][SubscriptionResolvedEventCallback] is invoked
  /// and awaited when a new event is received over the subscription.
  ///
  /// Callback [onSubscriptionDropped][SubscriptionDroppedCallback] is invoked
  /// and awaited when the subscription is dropped.
  ///
  /// Returns as [EventStreamSubscription] on first response from the server.
  Future<void> update(
    String streamId,
    String groupName, {
    int bufferSize = 10,
    UserCredentials? userCredentials,
    PersistentSubscriptionSettings? settings,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return $runRequest<void>(() async {
      final client = await $getClient();
      final request = _setUpdateReq(
        UpdateReq(),
        streamId,
        groupName,
        settings ?? PersistentSubscriptionSettings.Default,
      );
      await client.update(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }

  /// Updates a filtered persistent subscription to [$all stream][SystemStreams.AllStream].
  ///
  /// Parameters [groupName] identifies which [PersistentSubscription]
  /// to subscribe to.
  ///
  /// Callback [onEventAppeared][SubscriptionResolvedEventCallback] is invoked
  /// and awaited when a new event is received over the subscription.
  ///
  /// Callback [onSubscriptionDropped][SubscriptionDroppedCallback] is invoked
  /// and awaited when the subscription is dropped.
  ///
  /// Returns as [EventStreamSubscription] on first response from the server.
  Future<void> updateToAll(
    String groupName, {
    int bufferSize = 10,
    UserCredentials? userCredentials,
    PersistentSubscriptionSettings? settings,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return $runRequest<void>(() async {
      final client = await $getClient();
      final request = _setUpdateReq(
        UpdateReq(),
        SystemStreams.AllStream,
        groupName,
        settings ?? PersistentSubscriptionSettings.Default,
      );
      await client.update(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }

  UpdateReq _setUpdateReq(
    UpdateReq request,
    String streamId,
    String groupName,
    PersistentSubscriptionSettings settings,
  ) {
    if (streamId.isEmpty) {
      throw ArgumentError.value(streamId, 'streamId', 'can not be empty');
    }

    if (groupName.isEmpty) {
      throw ArgumentError.value(groupName, 'groupName', 'can not be empty');
    }

    if (streamId != SystemStreams.AllStream &&
        settings.startFrom != null &&
        !(settings.startFrom is StreamPosition)) {
      throw ArgumentError.value(
        settings.startFrom,
        'settings.startFrom',
        "must be of type '$StreamPosition' when subscribing to a stream",
      );
    }

    if (streamId == SystemStreams.AllStream &&
        settings.startFrom != null &&
        !(settings.startFrom is LogPosition)) {
      throw ArgumentError.value(
        settings.startFrom,
        'settings.startFrom',
        "must be of type '$LogPosition' when subscribing to a stream",
      );
    }

    final options = UpdateReq_Options();
    if (streamId == SystemStreams.AllStream) {
      final all = _toUpdateAllOptions(
        streamId,
        (settings.startFrom ?? LogPosition.end) as LogPosition,
      );
      options.all = all;
    } else {
      options.stream = _toUpdateStreamOptions(
        streamId,
        (settings.startFrom ?? StreamPosition.end) as StreamPosition,
      );
      // Backwards compatibility for < 20.10.x
      // ignore: deprecated_member_use_from_same_package
      options.streamIdentifier = toStreamIdentifier(streamId);
    }

    options
      ..groupName = groupName
      ..settings = _toUpdateSettings(
        settings,
        // Backwards compatibility for 20.10.x
        streamId == SystemStreams.AllStream
            ? StreamPosition.start
            : (settings.startFrom ?? StreamPosition.end) as StreamPosition,
      );

    return UpdateReq()..options = options;
  }

  UpdateReq_StreamOptions _toUpdateStreamOptions(
    String streamId,
    StreamPosition position,
  ) {
    if (position == StreamPosition.start) {
      return UpdateReq_StreamOptions()
        ..start = Empty()
        ..streamIdentifier = toStreamIdentifier(
          streamId,
        );
    }
    if (position == StreamPosition.end) {
      return UpdateReq_StreamOptions()
        ..end = Empty()
        ..streamIdentifier = toStreamIdentifier(
          streamId,
        );
    }
    return UpdateReq_StreamOptions()
      ..revision = position.value
      ..streamIdentifier = toStreamIdentifier(
        streamId,
      );
  }

  UpdateReq_AllOptions _toUpdateAllOptions(
    String streamId,
    LogPosition position,
  ) {
    final options = UpdateReq_AllOptions();
    if (position == LogPosition.start) {
      return options..start = Empty();
    }
    if (position == StreamPosition.end) {
      return options..end = Empty();
    }
    return options
      ..position = (UpdateReq_Position()
        ..commitPosition = position.commitPosition
        ..preparePosition = position.preparePosition);
  }

  UpdateReq_ConsumerStrategy _toUpdateStrategy(SystemConsumerStrategies type) {
    switch (type) {
      case SystemConsumerStrategies.dispatchToSingle:
        return UpdateReq_ConsumerStrategy.DispatchToSingle;
      case SystemConsumerStrategies.roundRobin:
        return UpdateReq_ConsumerStrategy.RoundRobin;
      case SystemConsumerStrategies.pinned:
        return UpdateReq_ConsumerStrategy.Pinned;
    }
  }

  UpdateReq_Settings _toUpdateSettings(
    PersistentSubscriptionSettings settings,
    StreamPosition position,
  ) {
    return UpdateReq_Settings()
      // Backwards compatibility for < 20.10.x
      // ignore: deprecated_member_use_from_same_package
      ..revision = position.value
      ..resolveLinks = settings.resolveLinkTos
      ..maxRetryCount = settings.maxRetryCount
      ..readBatchSize = settings.readBatchSize
      ..liveBufferSize = settings.liveBufferSize
      ..extraStatistics = settings.extraStatistics
      ..historyBufferSize = settings.historyBufferSize
      ..maxCheckpointCount = settings.maxCheckPointCount
      ..maxSubscriberCount = settings.maxSubscriberCount
      ..minCheckpointCount = settings.minCheckPointCount
      ..messageTimeoutMs = settings.messageTimeout.inMilliseconds
      ..checkpointAfterMs = settings.checkPointAfter.inMilliseconds
      ..namedConsumerStrategy = _toUpdateStrategy(settings.consumerStrategy);
  }
}
