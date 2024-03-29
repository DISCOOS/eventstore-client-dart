// ignore_for_file: invalid_use_of_visible_for_overriding_member

part of 'persistent_projections_mixins.dart';

mixin EventStorePersistentSubscriptionsCreate
    on EventStorePersistentSubscriptionsMixin {
  /// Creates a filtered persistent subscription [groupName] on given stream.
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
  Future<void> create(
    String streamId,
    String groupName, {
    int bufferSize = 10,
    UserCredentials? userCredentials,
    PersistentSubscriptionSettings? settings,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return $runRequest<void>(() async {
      final client = await $getClient();
      final request = _toCreateReq(
        streamId,
        groupName,
        settings ?? PersistentSubscriptionSettings.Default,
      );
      await client.create(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }

  /// Creates a filtered persistent subscription to [$all stream][SystemStreams.AllStream].
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
  /// Throws a [FeatureNotSupportedException] if method is not supported
  /// by expected [client api version ][EventStoreClientSettings.apiVersion].
  ///
  /// Returns as [EventStreamSubscription] on first response from the server.
  Future<void> createToAll(
    String groupName, {
    UserCredentials? userCredentials,
    PersistentSubscriptionSettings? settings,
    SubscriptionFilterOptions? filterOptions,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    $verifyFeatureAllowed(
      ApiFeature.PersistentSubscriptionOnAllStream,
    );

    return $runRequest<void>(() async {
      final client = await $getClient();
      final request = _toCreateReq(
        SystemStreams.AllStream,
        groupName,
        settings ?? PersistentSubscriptionSettings.Default,
        filterOptions,
      );
      await client.create(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }

  CreateReq _toCreateReq(
    String streamId,
    String groupName,
    PersistentSubscriptionSettings settings, [
    SubscriptionFilterOptions? filterOptions,
  ]) {
    if (streamId.isEmpty) {
      throw ArgumentError.value(streamId, 'streamId', 'can not be empty');
    }

    if (groupName.isEmpty) {
      throw ArgumentError.value(groupName, 'groupName', 'can not be empty');
    }

    if (streamId != SystemStreams.AllStream &&
        settings.startFrom != null &&
        settings.startFrom is! StreamPosition) {
      throw ArgumentError.value(
        settings.startFrom,
        'settings.startFrom',
        "must be of type '$StreamPosition' when subscribing to a stream",
      );
    }

    if (streamId == SystemStreams.AllStream &&
        settings.startFrom != null &&
        settings.startFrom is! LogPosition) {
      throw ArgumentError.value(
        settings.startFrom,
        'settings.startFrom',
        "must be of type '$LogPosition' when subscribing to a stream",
      );
    }

    if (filterOptions != null && streamId != SystemStreams.AllStream) {
      throw ArgumentError.value(
        streamId,
        'streamId',
        'Filters are only supported when subscribing to ${SystemStreams.AllStream}',
      );
    }

    final options = CreateReq_Options();
    if (streamId == SystemStreams.AllStream) {
      final all = _toCreateAllOptions(
        streamId,
        (settings.startFrom ?? LogPosition.end) as LogPosition,
      );
      if (filterOptions != null) {
        final filter = _toCreateFilterOptions(filterOptions);
        if (filter != null) {
          all.filter = filter;
        }
      }
      if (!all.hasFilter()) {
        all.noFilter = Empty();
      }
      options.all = all;
      // Backwards compatibility for < 20.10.x
      // ignore: deprecated_member_use_from_same_package
      options.streamIdentifier = toStreamIdentifier('');
    } else {
      options.stream = _toCreateStreamOptions(
        streamId,
        (settings.startFrom ?? StreamPosition.end) as StreamPosition,
      );
      // Backwards compatibility for < 20.10.x
      // ignore: deprecated_member_use_from_same_package
      options.streamIdentifier = toStreamIdentifier(streamId);
    }

    options
      ..groupName = groupName
      ..settings = _toCreateSettings(
        settings,
        // Backwards compatibility for 20.10.x
        streamId == SystemStreams.AllStream
            ? StreamPosition.start
            : (settings.startFrom ?? StreamPosition.end) as StreamPosition,
      );

    return CreateReq()..options = options;
  }

  CreateReq_StreamOptions _toCreateStreamOptions(
    String streamId,
    StreamPosition position,
  ) {
    if (position == StreamPosition.start) {
      return CreateReq_StreamOptions()
        ..start = Empty()
        ..streamIdentifier = toStreamIdentifier(
          streamId,
        );
    }
    if (position == StreamPosition.end) {
      return CreateReq_StreamOptions()
        ..end = Empty()
        ..streamIdentifier = toStreamIdentifier(
          streamId,
        );
    }
    return CreateReq_StreamOptions()
      ..revision = position.value
      ..streamIdentifier = toStreamIdentifier(
        streamId,
      );
  }

  CreateReq_AllOptions _toCreateAllOptions(
    String streamId,
    LogPosition position,
  ) {
    if (position == LogPosition.start) {
      return CreateReq_AllOptions()..start = Empty();
    }
    if (position == LogPosition.end) {
      return CreateReq_AllOptions()..end = Empty();
    }
    final start = (CreateReq_Position()
      ..commitPosition = position.commitPosition
      ..preparePosition = position.preparePosition);
    return CreateReq_AllOptions()..position = start;
  }

  String _toConsumerStrategy(SystemConsumerStrategies type) {
    switch (type) {
      case SystemConsumerStrategies.dispatchToSingle:
        return CreateReq_ConsumerStrategy.DispatchToSingle.name;
      case SystemConsumerStrategies.roundRobin:
        return CreateReq_ConsumerStrategy.RoundRobin.name;
      case SystemConsumerStrategies.pinned:
        return CreateReq_ConsumerStrategy.Pinned.name;
    }
  }

  CreateReq_ConsumerStrategy _toNamedConsumerStrategy(
      SystemConsumerStrategies type) {
    switch (type) {
      case SystemConsumerStrategies.dispatchToSingle:
        return CreateReq_ConsumerStrategy.DispatchToSingle;
      case SystemConsumerStrategies.roundRobin:
        return CreateReq_ConsumerStrategy.RoundRobin;
      case SystemConsumerStrategies.pinned:
        return CreateReq_ConsumerStrategy.Pinned;
    }
  }

  CreateReq_AllOptions_FilterOptions? _toCreateFilterOptions(
      SubscriptionFilterOptions filterOptions) {
    CreateReq_AllOptions_FilterOptions? filter;
    // Is legal StreamFilter?
    if (filterOptions.filter is StreamFilter &&
        filterOptions.filter != StreamFilter.None) {
      filter = CreateReq_AllOptions_FilterOptions()
        ..streamIdentifier = _toCreateFilterExpression(filterOptions);
    }
    // Is legal EventTypeFilter?
    if (filterOptions.filter is EventTypeFilter &&
        filterOptions.filter != EventTypeFilter.None) {
      filter = CreateReq_AllOptions_FilterOptions()
        ..eventType = _toCreateFilterExpression(filterOptions);
    }
    if (filter != null) {
      if (filterOptions.filter.maxSearchWindow != null) {
        filter.max = filterOptions.filter.maxSearchWindow!;
      } else {
        filter.count = Empty();
      }
      filter.checkpointIntervalMultiplier = filterOptions.checkpointInterval;
    }
    return filter;
  }

  CreateReq_AllOptions_FilterOptions_Expression _toCreateFilterExpression(
      SubscriptionFilterOptions filterOptions) {
    return CreateReq_AllOptions_FilterOptions_Expression()
      ..regex = filterOptions.filter.regex.pattern
      ..prefix.addAll(
        filterOptions.filter.prefixes.map((e) => e.pattern),
      );
  }

  CreateReq_Settings _toCreateSettings(
    PersistentSubscriptionSettings settings,
    StreamPosition position,
  ) {
    return CreateReq_Settings()
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
      ..consumerStrategy = _toConsumerStrategy(
        settings.consumerStrategy,
      )
      // ignore: deprecated_member_use_from_same_package
      ..namedConsumerStrategy = _toNamedConsumerStrategy(
        settings.consumerStrategy,
      );
  }
}
