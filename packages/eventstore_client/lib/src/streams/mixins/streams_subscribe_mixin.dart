part of '../streams_client.dart';

mixin EventStoreStreamsSubscribeMixin on EventStoreStreamsMixin {
  /// Subscribe to [ResolvedEvent]s from given stream [streamId].
  ///
  /// Start at first event after optional [position] (event at position is
  /// not returned). When [position] is not given, all events from
  /// [StreamPosition.start] is returned.
  ///
  /// Callback [onEventAppeared][SubscriptionResolvedEventCallback] is invoked
  /// and awaited when a new event is received over the subscription.
  ///
  /// Callback [onSubscriptionDropped][SubscriptionDroppedCallback] is invoked
  /// and awaited when the subscription is dropped.
  ///
  /// Use [resolveLinks] to resolve links as [ResolvedEvent] (default is false).
  ///
  /// Returns as [EventStreamSubscription] on first response from the server.
  Future<EventStreamSubscription> subscribe(
    String streamId, {
    Position? position,
    bool resolveLinks = false,
    UserCredentials? userCredentials,
    SubscriptionResolvedEventCallback? onEventAppeared,
    SubscriptionDroppedCallback? onSubscriptionDropped,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    if (streamId == SystemStreams.AllStream) {
      if (position != null && position is! LogPosition) {
        throw ArgumentError.value(
          position,
          'position',
          'Stream \$all requires type LogPosition',
        );
      }
      return subscribeToAll(
        resolveLinks: resolveLinks,
        onEventAppeared: onEventAppeared,
        userCredentials: userCredentials,
        position: position as LogPosition,
        operationOptions: operationOptions,
        onSubscriptionDropped: onSubscriptionDropped,
      );
    }
    return $runRequest<EventStreamSubscription>(() async {
      final state = StreamState.any(
        streamId,
        revision:
            ((position ?? StreamPosition.start) as StreamPosition).toRevision(),
      );
      final request = _setSubscriptionReq(
        state.toReadReq(
          resolveLinks: resolveLinks,
        ),
      );
      final client = await $getClient();
      final resultStream = client.read(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
          timeoutAfter: toSubscriptionTimeout(operationOptions),
        ),
      );
      return _toSubscriptionResult(
        state,
        resultStream,
        onEventAppeared: onEventAppeared,
        onSubscriptionDropped: onSubscriptionDropped,
      );
    });
  }

  /// Subscribe to all [ResolvedEvent]s.
  ///
  /// Starting with first event after optional [position].
  /// When [position] is not given, all events from [LogPosition.start]
  /// is returned. Use [resolveLinks] to resolve links as [ResolvedEvent]
  /// (default is false).
  ///
  /// Callback [onEventAppeared][SubscriptionResolvedEventCallback] is invoked
  /// and awaited when a new event is received over the subscription.
  ///
  /// Callback [onSubscriptionDropped][SubscriptionDroppedCallback] is invoked
  /// and awaited when the subscription is dropped.
  ///
  /// Returns as [EventStreamSubscription] on first response from the server.
  Future<EventStreamSubscription> subscribeToAll({
    LogPosition? position,
    bool resolveLinks = false,
    UserCredentials? userCredentials,
    SubscriptionFilterOptions? filterOptions,
    SubscriptionResolvedEventCallback? onEventAppeared,
    SubscriptionDroppedCallback? onSubscriptionDropped,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return $runRequest<EventStreamSubscription>(() async {
      final request = _setSubscriptionReq(
        toReadAllReq(
          position ?? LogPosition.start,
          resolveLinks: resolveLinks,
        ),
        filterOptions,
      );
      final client = await $getClient();
      final resultStream = client.read(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
          timeoutAfter: toSubscriptionTimeout(operationOptions),
        ),
      );
      return _toSubscriptionResult(
        StreamState.all(position),
        resultStream,
        onEventAppeared: onEventAppeared,
        onSubscriptionDropped: onSubscriptionDropped,
        checkpointReached: filterOptions?.checkpointReached,
      );
    });
  }

  /// Get [EventStreamSubscription] timeout [Duration]
  static Duration toSubscriptionTimeout(
          [EventStoreClientOperationOptions? operationOptions]) =>
      operationOptions?.timeoutAfter ?? Defaults.InfiniteDuration;

  /// Reads the metadata for stream given by [streamId]
  Future<StreamMetadataResult> getStreamMetadata(
    String streamId, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<StreamMetadataResult>(() async {
      final state = StreamState.any(streamId);
      final request = state.toReadMetaReq();
      final client = await $getClient();
      final resultStream = client.read(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return StreamMetadataResult.from(
        streamId,
        resultStream,
      );
    });
  }

  // Create appropriate [EventStreamSubscription] from given [ResponseStream]
  Future<EventStreamSubscription> _toSubscriptionResult(
    StreamState expected,
    ResponseStream<ReadResp> stream, {
    SubscriptionResolvedEventCallback? onEventAppeared,
    SubscriptionDroppedCallback? onSubscriptionDropped,
    SubscriptionCheckpointCallback? checkpointReached,
  }) async {
    return EventStreamSubscription(
      await $toEnumerator(
        stream,
        expected,
      ),
      onEventAppeared: onEventAppeared,
      checkpointReached: checkpointReached,
      onSubscriptionDropped: onSubscriptionDropped,
    );
  }

  ReadReq _setSubscriptionReq(
    ReadReq request, [
    SubscriptionFilterOptions? filterOptions,
  ]) {
    request.options.subscription = ReadReq_Options_SubscriptionOptions();
    if (filterOptions != null) {
      final filter = _toFilterOptions(filterOptions);
      if (filter != null) {
        request.options.filter = filter;
      }
    }

    return request;
  }

  ReadReq_Options_FilterOptions? _toFilterOptions(
      SubscriptionFilterOptions filterOptions) {
    ReadReq_Options_FilterOptions? filter;
    // Is legal StreamFilter?
    if (filterOptions.filter is StreamFilter &&
        filterOptions.filter != StreamFilter.None) {
      filter = ReadReq_Options_FilterOptions()
        ..streamIdentifier = _toFilterExpression(filterOptions);
    }
    // Is legal EventTypeFilter?
    if (filterOptions.filter is EventTypeFilter &&
        filterOptions.filter != EventTypeFilter.None) {
      filter = ReadReq_Options_FilterOptions()
        ..eventType = _toFilterExpression(filterOptions);
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

  ReadReq_Options_FilterOptions_Expression _toFilterExpression(
      SubscriptionFilterOptions filterOptions) {
    return ReadReq_Options_FilterOptions_Expression()
      ..regex = filterOptions.filter.regex.pattern
      ..prefix.addAll(
        filterOptions.filter.prefixes.map((e) => e.pattern),
      );
  }
}
