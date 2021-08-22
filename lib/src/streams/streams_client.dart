import 'dart:convert';

import 'package:async/async.dart';
import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/client_base.dart';
import 'package:eventstore_client/src/core/constants.dart';
import 'package:eventstore_client/src/core/event_data.dart';
import 'package:eventstore_client/src/core/log_position.dart';
import 'package:eventstore_client/src/core/resolved_event.dart';
import 'package:eventstore_client/src/core/stream_state.dart';
import 'package:eventstore_client/src/core/typedefs.dart';
import 'package:eventstore_client/src/core/uuid.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';
import 'package:eventstore_client/src/generated/streams.pbgrpc.dart';
import 'package:eventstore_client/src/streams/delete_results.dart';
import 'package:eventstore_client/src/streams/enums.dart';
import 'package:eventstore_client/src/streams/event_type_filter.dart';
import 'package:eventstore_client/src/streams/read_enumerator.dart';
import 'package:eventstore_client/src/streams/stream_metadata.dart';
import 'package:eventstore_client/src/streams/stream_metadata_result.dart';
import 'package:eventstore_client/src/streams/write_results.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:tuple/tuple.dart';

part 'read_results.dart';
part 'subscription.dart';

mixin EventStoreStreamsClient on EventStoreClientBase {
  /// Converts [GrpcError]s to typed [Exception]s
  static Map<String, GrpcErrorCallback> ExceptionMap =
      <String, GrpcErrorCallback>{
    Exceptions.WrongExpectedVersion: (e) =>
        WrongExpectedVersionException.fromCause(e),
    Exceptions.StreamDeleted: (ex) => StreamDeletedException.fromError(ex)
  };

  Future<StreamsClient> _createClient() async {
    return StreamsClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }

  /// Read all [ResolvedEvent]s in EventStore from optional [position]. When
  /// [position] is not given, all events from [LogPosition.start] is
  /// returned when [forward] is true and [StreamPosition.end] when
  /// [forward] is false.
  /// Use [count] to limit number of events to read (default is all events
  /// from given position).
  /// Use [forward] to read towards the end of stream. Default is true.
  /// Use [resolveLinks] to resolve links as [ResolvedEvent]  (default is true).
  /// Returns as [ReadEventsResult] on first response from the server.
  Future<ReadEventsResult> readFromAll({
    int? count,
    bool forward = true,
    LogPosition? position,
    bool resolveLinks = true,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<ReadEventsResult>(() async {
      final request = _toReadAllReq(
        position ?? (forward ? LogPosition.start : LogPosition.end),
        count: count,
        forward: forward,
        resolveLinks: resolveLinks,
      );
      final client = await _createClient();
      final resultStream = client.read(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return _toReadResult(
        StreamState.all(position),
        resultStream,
      );
    });
  }

  /// Read [ResolvedEvent]s from given stream [streamId] and optional [position].
  /// When [position] is not given, all events from [StreamPosition.start]
  /// is returned when [forward] is true and [StreamPosition.end] when
  /// [forward] is false.
  /// Use [count] to limit number of events to read (default is all events
  /// from given position).
  /// Use [forward] to read towards the end of stream. Default is true.
  /// Use [resolveLinks] to resolve links as [ResolvedEvent] (default is true).
  /// Returns as [ReadEventsResult] on first response from the server.
  Future<ReadEventsResult> readFromStream(
    String streamId, {
    int? count,
    bool forward = true,
    bool resolveLinks = true,
    StreamPosition? position,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<ReadEventsResult>(() async {
      final state = StreamState.exists(
        streamId,
        revision: StreamRevision.fromPosition(
          position ?? (forward ? StreamPosition.start : StreamPosition.end),
        ),
      );
      final request = state.toReadReq(
        count: count,
        forward: forward,
        resolveLinks: resolveLinks,
      );
      final client = await _createClient();
      final resultStream = client.read(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return _toReadResult(
        state,
        resultStream,
      );
    });
  }

  /// Subscribe to [ResolvedEvent]s from given stream [streamId].
  ///
  /// Start at first event after optional [position] (event at position is
  /// not returned). When [position] is not given, all events from
  /// [StreamPosition.start] is returned.
  ///
  /// Callback [eventAppeared][SubscriptionResolvedEventCallback] is invoked
  /// and awaited when a new event is received over the subscription.
  ///
  /// Callback [subscriptionDropped][SubscriptionDroppedCallback] is invoked
  /// and awaited when the subscription is dropped.
  ///
  /// Use [resolveLinks] to resolve links as [ResolvedEvent] (default is false).
  ///
  /// Returns as [EventStreamSubscription] on first response from the server.
  Future<EventStreamSubscription> subscribeToStream(
    String streamId, {
    StreamPosition? position,
    bool resolveLinks = false,
    UserCredentials? userCredentials,
    SubscriptionResolvedEventCallback? eventAppeared,
    SubscriptionDroppedCallback? subscriptionDropped,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return $runRequest<EventStreamSubscription>(() async {
      final state = StreamState.any(
        streamId,
        revision: (position ?? StreamPosition.start).toRevision(),
      );
      final request = _setSubscriptionReq(
        state.toReadReq(
          resolveLinks: resolveLinks,
        ),
      );
      final client = await _createClient();
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
        eventAppeared: eventAppeared,
        subscriptionDropped: subscriptionDropped,
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
  /// Callback [eventAppeared][SubscriptionResolvedEventCallback] is invoked
  /// and awaited when a new event is received over the subscription.
  ///
  /// Callback [subscriptionDropped][SubscriptionDroppedCallback] is invoked
  /// and awaited when the subscription is dropped.
  ///
  /// Returns as [EventStreamSubscription] on first response from the server.
  Future<EventStreamSubscription> subscribeToAll({
    LogPosition? position,
    bool resolveLinks = false,
    UserCredentials? userCredentials,
    SubscriptionFilterOptions? filterOptions,
    SubscriptionResolvedEventCallback? eventAppeared,
    SubscriptionDroppedCallback? subscriptionDropped,
    EventStoreClientOperationOptions? operationOptions,
  }) async {
    return $runRequest<EventStreamSubscription>(() async {
      final request = _setSubscriptionReq(
        _toReadAllReq(
          position ?? LogPosition.start,
          resolveLinks: resolveLinks,
        ),
        filterOptions,
      );
      final client = await _createClient();
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
        eventAppeared: eventAppeared,
        subscriptionDropped: subscriptionDropped,
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
      final client = await _createClient();
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
      final client = await _createClient();
      if (settings.batchAppend) {
        // From v21.6 the ability to use multiplex appends over
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
          type: SystemEventTypes.StreamMetadata,
          data: utf8.encode(json.encode(metadata.toJson())),
        )),
      ]);
      final client = await _createClient();
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

  /// Perform a hard delete of stream.
  /// When using hard delete, the stream gets closed with a tombstone event.
  /// Such an event tells the database that the stream cannot be reopened,
  /// so any attempt to append to the hard-deleted stream will fail.
  /// See [deleting streams and events](https://developers.eventstore.com/server/v20.10/docs/streams/deleting-streams-and-events.html)
  Future<DeleteResult> tombstone(
    StreamState state, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<DeleteResult>(() async {
      final request = state.toTombstoneReq();
      final client = await _createClient();
      final result = await client.tombstone(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return DeleteResult.fromTombstoneResp(state, result);
    });
  }

  /// Perform a soft delete of all events in stream.
  /// When a stream is soft-deleted, all events from the stream get
  /// scavenged during the next scavenging run. It means that you can
  /// reopen the stream by appending to it again.
  /// See [deleting streams and events](https://developers.eventstore.com/server/v20.10/docs/streams/deleting-streams-and-events.html)
  Future<DeleteResult> delete(
    StreamState state, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<DeleteResult>(() async {
      final request = state.toDeleteReq();
      final client = await _createClient();
      final result = await client.delete(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return DeleteResult.fromDeleteResp(state, result);
    });
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
      request.options = state.toBatchAppendReqOptions();
    }
    return request;
  }

  ReadReq _toReadAllReq(
    LogPosition position, {
    int? count,
    bool forward = true,
    bool resolveLinks = true,
  }) {
    if (count != null && count <= 0) {
      throw GrpcError.outOfRange('count must be greater than zero');
    }
    final options = ReadReq_Options()
      ..noFilter = Empty()
      ..resolveLinks = resolveLinks
      ..all = _toAllOptions(position)
      ..readDirection = forward
          ? ReadReq_Options_ReadDirection.Forwards
          : ReadReq_Options_ReadDirection.Backwards
      // Same as long.MaxValue in csharp; 9,223,372,036,854,775,807
      ..count = count == null ? Int64.MAX_VALUE : Int64(count)
      // returns uuids as strings
      ..uuidOption = (ReadReq_Options_UUIDOption()..string = Empty());

    return ReadReq()..options = options;
  }

  ReadReq_Options_AllOptions _toAllOptions(LogPosition position) {
    final all = ReadReq_Options_AllOptions();
    if (position == LogPosition.start) {
      all.start = Empty();
    } else if (position == LogPosition.end) {
      all.end = Empty();
    } else {
      all.position = ReadReq_Options_Position()
        ..commitPosition = position.commitPosition
        ..preparePosition = position.preparePosition;
    }
    return all;
  }

  // Create appropriate [ReadEventsResult] from given [ResponseStream]
  Future<ReadEventsResult> _toReadResult(
    StreamState expected,
    ResponseStream<ReadResp> stream,
  ) async {
    final enumerator = await ReadEnumerator.from(
      expected,
      stream,
      $toTypedException,
    );
    return ReadEventsResult._(enumerator);
  }

  // Create appropriate [EventStreamSubscription] from given [ResponseStream]
  Future<EventStreamSubscription> _toSubscriptionResult(
    StreamState expected,
    ResponseStream<ReadResp> stream, {
    SubscriptionResolvedEventCallback? eventAppeared,
    SubscriptionDroppedCallback? subscriptionDropped,
    SubscriptionCheckpointCallback? checkpointReached,
  }) async {
    final enumerator = await ReadEnumerator.from(
      expected,
      stream,
      $toTypedException,
    );
    return EventStreamSubscription(
      enumerator,
      eventAppeared: eventAppeared,
      checkpointReached: checkpointReached,
      subscriptionDropped: subscriptionDropped,
    );
  }

  ReadReq _setSubscriptionReq(
    ReadReq request, [
    SubscriptionFilterOptions? filterOptions,
  ]) {
    request.options.subscription = ReadReq_Options_SubscriptionOptions();
    if (filterOptions != null) {
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
        request.options.filter = filter;
      }
    }

    return request;
  }

  ReadReq_Options_FilterOptions_Expression _toFilterExpression(
      SubscriptionFilterOptions filterOptions) {
    final expression = ReadReq_Options_FilterOptions_Expression()
      ..regex = filterOptions.filter.regex.pattern
      ..prefix.addAll(
        filterOptions.filter.prefixes.map((e) => e.pattern),
      );
    return expression;
  }
}
