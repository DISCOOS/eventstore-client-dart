part of '../streams_client.dart';

mixin EventStoreStreamsAppendMixin on EventStoreStreamsMixin {
  /// Append [events] to stream given by [state].
  /// Returns as [WriteResult] when the operation has completed.
  /// If a concurrent write has occurred, a [WrongExpectedVersionResult]
  /// is returned. Otherwise, [WriteSuccessResult] is returned.
  Future<WriteResult> append(
    StreamState state,
    Stream<EventData> events, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<WriteResult>(() async {
      final client = await $getClient();
      if (settings.batchAppend) {
        // From v21_LTS the ability to use multiplex appends over
        // a single gRPC channel was added with BatchAppend. This improves
        // speed by eliminating the channel setup overhead. This results
        // in a performance improvement in the order of 20x.
        return _batchAppend(
          state,
          client,
          events,
          userCredentials,
          operationOptions,
        );
      }
      return _append(
        state,
        client,
        events,
        userCredentials,
        operationOptions,
      );
    });
  }

  /// Sets the metadata for stream given by [state].
  /// Returns as [WriteResult] when the operation has completed.
  /// If a concurrent write has occurred, a [WrongExpectedVersionResult]
  /// is returned. Otherwise, [WriteSuccessResult] is returned.
  Future<WriteResult> setStreamMetadata(
    StreamState state,
    StreamMetadata metadata, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<WriteResult>(() async {
      final requests = Stream<AppendReq>.fromIterable([
        state.toAppendMetaReq(),
        _toAppendReq(EventData(
          uuid: UuidV4.newUuid().value.uuid,
          type: SystemEvents.StreamMetadata,
          data: utf8.encode(json.encode(metadata.toJson())),
        )),
      ]);
      final client = await $getClient();
      final result = await client.append(
        requests,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return WriteResult.from(state, result);
    });
  }

  /// Check if [EventStoreClientSetting.BatchAppend]
  /// is supported by [ApiVersion][EventStoreClientSettings.apiVersion]
  /// in current [settings].
  bool isBatchAppendSupported() => isFeatureSupported(ApiFeature.BatchAppend);

  Future<WriteResult> _append(
    StreamState state,
    StreamsClient client,
    Stream<EventData> events,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  ) async {
    final requests = StreamGroup.mergeBroadcast([
      Stream.value(state.toAppendReq()),
      events.map(_toAppendReq),
    ]);
    final result = await client.append(
      requests,
      options: $getOptions(
        userCredentials: userCredentials,
        operationOptions: operationOptions,
      ),
    );
    return WriteResult.from(state, result);
  }

  Future<WriteResult> _batchAppend(
    StreamState state,
    StreamsClient client,
    Stream<EventData> events,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  ) async {
    final requests = _toBatchAppendReqStream(
      state,
      events,
    );
    final stream = client.batchAppend(
      requests,
      options: $getOptions(
        userCredentials: userCredentials,
        operationOptions: operationOptions,
      ),
    );
    return WriteResult.fromBatch(state, stream);
  }

  AppendReq _toAppendReq(EventData event) {
    return AppendReq()
      ..proposedMessage = (AppendReq_ProposedMessage()
        ..id = (UUID()..string = event.uuid.uuid)
        ..data = event.data
        ..customMetadata = event.metadata
        ..metadata.addAll({
          Metadata.Type: event.type,
          Metadata.ContentType: event.contentType,
        }));
  }

  Stream<BatchAppendReq> _toBatchAppendReqStream(
    StreamState state,
    Stream<EventData> events,
  ) async* {
    var first = true;
    var batchSize = 0;
    final correlationId = UuidV4.newUuid().value.uuid;
    final messages = <BatchAppendReq_ProposedMessage>[];
    await for (var event in events) {
      final msg = BatchAppendReq_ProposedMessage()
        ..id = (UUID()..string = event.uuid.uuid)
        ..data = event.data
        ..customMetadata = event.metadata
        ..metadata.addAll({
          Metadata.Type: event.type,
          Metadata.ContentType: event.contentType,
        });
      messages.add(msg);
      if ((batchSize += msg.writeToBuffer().length) >=
          settings.batchAppendSize) {
        yield _toBatchAppendRequest(
          state: state,
          isFirst: first,
          isFinal: false,
          messages: messages,
          correlationId: correlationId,
        );
        first = false;
        batchSize = 0;
        messages.clear();
      }
    }
    yield _toBatchAppendRequest(
      state: state,
      isFirst: first,
      isFinal: true,
      messages: messages,
      correlationId: correlationId,
    );
  }

  BatchAppendReq _toBatchAppendRequest({
    required bool isFirst,
    required bool isFinal,
    required StreamState state,
    required String correlationId,
    required List<BatchAppendReq_ProposedMessage> messages,
  }) {
    final request = BatchAppendReq()
      ..proposedMessages.addAll(messages)
      ..correlationId = (UUID()..string = correlationId)
      ..isFinal = isFinal;
    if (isFirst) {
      request.options = state.toBatchAppendReqOptions(this);
    }
    return request;
  }
}
