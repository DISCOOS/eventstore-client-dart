part of '../streams_client.dart';

mixin EventStoreStreamsDeleteMixin on EventStoreStreamsMixin {
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
      final client = await $getClient();
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
      final client = await $getClient();
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
}
