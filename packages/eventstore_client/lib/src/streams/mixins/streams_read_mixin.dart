part of '../streams_client.dart';

mixin EventStoreStreamsReadMixin on EventStoreStreamsMixin {
  /// Read all [ResolvedEvent]s in EventStore from optional [position]. When
  /// [position] is not given, all events from [LogPosition.start] is
  /// returned when [forward] is true and [StreamPosition.end] when
  /// [forward] is false.
  /// Use [maxCount] to limit number of events to read (default is all events
  /// from given position).
  /// Use [forward] to read towards the end of stream. Default is true.
  /// Use [resolveLinks] to resolve links as [ResolvedEvent]  (default is true).
  /// Returns as [ReadEventsResult] on first response from the server.
  Future<ReadEventsResult> readFromAll({
    int? maxCount,
    bool forward = true,
    LogPosition? position,
    bool resolveLinks = true,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<ReadEventsResult>(() async {
      final request = toReadAllReq(
        position ?? (forward ? LogPosition.start : LogPosition.end),
        count: maxCount,
        forward: forward,
        resolveLinks: resolveLinks,
      );
      final client = await $getClient();
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
  /// Use [maxCount] to limit number of events to read (default is all events
  /// from given position).
  /// Use [forward] to read towards the end of stream. Default is true.
  /// Use [resolveLinks] to resolve links as [ResolvedEvent] (default is true).
  /// Returns as [ReadEventsResult] on first response from the server.
  Future<ReadEventsResult> read(
    String streamId, {
    int? maxCount,
    bool forward = true,
    bool resolveLinks = true,
    Position? position,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    if (streamId == SystemStreams.AllStream) {
      if (position != null && position is! LogPosition) {
        throw ArgumentError.value(
          position,
          'position',
          'Stream \$all requires type LogPosition',
        );
      }
      return readFromAll(
        forward: forward,
        maxCount: maxCount,
        resolveLinks: resolveLinks,
        position: position as LogPosition,
        userCredentials: userCredentials,
        operationOptions: operationOptions,
      );
    }
    return $runRequest<ReadEventsResult>(() async {
      final state = StreamState.exists(
        streamId,
        revision: StreamRevision.fromPosition(
          (position ?? (forward ? StreamPosition.start : StreamPosition.end))
              as StreamPosition,
        ),
      );
      final request = state.toReadReq(
        count: maxCount,
        forward: forward,
        resolveLinks: resolveLinks,
      );
      final client = await $getClient();
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

  // Create appropriate [ReadEventsResult] from given [ResponseStream]
  Future<ReadEventsResult> _toReadResult(
    StreamState expected,
    ResponseStream<ReadResp> stream,
  ) async {
    return ReadEventsResult._(
      await $toEnumerator(stream, expected),
    );
  }
}
