part of 'persistent_projections_mixins.dart';

mixin EventStorePersistentSubscriptionsRead
    on EventStorePersistentSubscriptionsMixin {
  /// Subscribes to [ResolvedEvent]s from a persistent subscription.
  ///
  /// Parameters [streamId] and [groupName] identifies the
  /// [PersistentSubscription] to subscribe to.
  ///
  /// Callback [onEventAppeared][PersistentSubscriptionResolvedEventCallback]
  /// is invoked and awaited when a new event is received over the subscription.
  ///
  /// Callback [onSubscriptionDropped][SubscriptionDroppedCallback] is invoked
  /// and awaited when the subscription is dropped.
  ///
  /// Returns as [PersistentSubscription] on first response from the server.
  Future<PersistentSubscription> subscribe(
    String streamId,
    String groupName, {
    int bufferSize = 10,
    bool autoAck = true,
    UserCredentials? userCredentials,
    SubscriptionDroppedCallback? onSubscriptionDropped,
    EventStoreClientOperationOptions? operationOptions,
    PersistentSubscriptionResolvedEventCallback? onEventAppeared,
  }) async {
    if (streamId == SystemStreams.AllStream) {
      $verifyFeatureAllowed(
        ApiFeature.PersistentSubscriptionOnAllStream,
      );
    }
    return $runRequest<PersistentSubscription>(() async {
      if (!supportsClientStreamingRpc) {
        throw GrpcOperationUnsupportedException(
          'grpc-web does not support client streaming',
        );
      }
      final options = ReadReq_Options()
        ..bufferSize = bufferSize
        ..groupName = groupName
        ..uuidOption = (ReadReq_Options_UUIDOption()..string = Empty());
      if (streamId == SystemStreams.AllStream) {
        options.all = Empty();
      } else {
        options.streamIdentifier = toStreamIdentifier(streamId);
      }
      final client = await $getClient();
      final request = ReadReq()..options = options;
      final requests = StreamController<ReadReq>()..add(request);
      final resultStream = client.read(
        requests.stream,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return PersistentSubscription(
        requests.sink,
        await _toEnumerator(
          resultStream,
          StreamState.any(streamId),
        ),
        autoAck: autoAck,
        onEventAppeared: onEventAppeared,
        onReplay: ([int? startAt]) => replayParked(
          streamId,
          groupName,
          leader,
          settings: settings,
          userCredentials: userCredentials,
          channelCredentials: $getOrAddCredentials(leader),
        ),
        onSubscriptionDropped: onSubscriptionDropped,
      );
    });
  }

  /// Subscribe to [ResolvedEvent]s in [$all stream][SystemStreams.AllStream].
  ///
  /// Parameters [groupName] identifies which [PersistentSubscription]
  /// to subscribe to.
  ///
  /// Callback [onEventAppeared][PersistentSubscriptionResolvedEventCallback]
  /// is invoked and awaited when a new event is received over the subscription.
  ///
  /// Callback [onSubscriptionDropped][SubscriptionDroppedCallback] is invoked
  /// and awaited when the subscription is dropped.
  ///
  /// Returns as [EventStreamSubscription] on first response from the server.
  Future<PersistentSubscription> subscribeToAll(
    String groupName, {
    int bufferSize = 10,
    bool autoAck = true,
    UserCredentials? userCredentials,
    SubscriptionDroppedCallback? onSubscriptionDropped,
    EventStoreClientOperationOptions? operationOptions,
    PersistentSubscriptionResolvedEventCallback? onEventAppeared,
  }) async {
    return subscribe(
      SystemStreams.AllStream,
      groupName,
      autoAck: autoAck,
      bufferSize: bufferSize,
      onEventAppeared: onEventAppeared,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
      onSubscriptionDropped: onSubscriptionDropped,
    );
  }

  Future<ReadEnumerator<ReadResp>> _toEnumerator(
    ResponseStream<ReadResp> stream,
    StreamState expected,
  ) async {
    return ReadEnumerator.from<ReadResp>(
      stream: stream,
      expected: expected,
      toTypedException: $toTypedException,
      toReadResp: (resp) {
        switch (resp.whichContent()) {
          case ReadResp_Content.event:
            return ReadResponse.event;
          case ReadResp_Content.subscriptionConfirmation:
            return ReadResponse.confirmation;
          case ReadResp_Content.notSet:
            return ReadResponse.notSet;
        }
      },
      toResolvedEvent: (resp) => convertToResolvedEvent(resp.event),
      toSubscriptionId: (resp) => resp.subscriptionConfirmation.subscriptionId,
    );
  }

  /// Get parked [ResolveEvent]s.
  ///
  /// Parameters [streamId] and [groupName] identifies the
  /// [PersistentSubscription] to get parked events for.
  ///
  Future<ReadEventsResult> readParked(
    String streamId,
    String groupName, {
    int? maxCount,
    bool forward = true,
    bool resolveLinks = true,
    StreamPosition? position,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    final client = EventStoreStreamsClient(settings);
    return client.read(
      SystemStreams.persistentParkedStreamOn(
        streamId,
        groupName,
      ),
      forward: forward,
      position: position,
      maxCount: maxCount,
      resolveLinks: resolveLinks,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }

  /// Get parked [ResolveEvent]s from [SystemStreams.AllStream]
  ///
  /// Parameters groupName] identifies the
  /// [PersistentSubscription] group to get parked events from.
  ///
  Future<ReadEventsResult> readParkedFromAll(
    String groupName, {
    int? maxCount,
    bool forward = true,
    bool resolveLinks = true,
    StreamPosition? position,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return readParked(
      SystemStreams.AllStream,
      groupName,
      forward: forward,
      position: position,
      maxCount: maxCount,
      resolveLinks: resolveLinks,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }

  /// Subscribe to parked [ResolveEvent]s.
  ///
  /// Parameters [streamId] and [groupName] identifies the
  /// [PersistentSubscription] to get parked events for.
  ///
  Future<EventStreamSubscription> subscribeToParked(
    String streamId,
    String groupName, {
    Position? position,
    bool resolveLinks = false,
    UserCredentials? userCredentials,
    SubscriptionResolvedEventCallback? onEventAppeared,
    SubscriptionDroppedCallback? onSubscriptionDropped,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    final client = EventStoreStreamsClient(settings);
    return client.subscribe(
      SystemStreams.persistentParkedStreamOn(
        streamId,
        groupName,
      ),
      position: position,
      resolveLinks: resolveLinks,
      onEventAppeared: onEventAppeared,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
      onSubscriptionDropped: onSubscriptionDropped,
    );
  }

  /// Subscribe to parked [ResolveEvent]s from [SystemStreams.AllStream]
  ///
  /// Parameters groupName] identifies the
  /// [PersistentSubscription] group to get parked events from.
  ///
  Future<EventStreamSubscription> subscribeToParkedFromAll(
    String groupName, {
    Position? position,
    bool resolveLinks = false,
    UserCredentials? userCredentials,
    SubscriptionResolvedEventCallback? onEventAppeared,
    SubscriptionDroppedCallback? onSubscriptionDropped,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return subscribeToParked(
      SystemStreams.AllStream,
      groupName,
      position: position,
      resolveLinks: resolveLinks,
      onEventAppeared: onEventAppeared,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
      onSubscriptionDropped: onSubscriptionDropped,
    );
  }
}
