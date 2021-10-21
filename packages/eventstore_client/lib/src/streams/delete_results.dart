part of 'streams_client.dart';

class DeleteResult {
  DeleteResult._(
    this.streamId,
    this.deletedAtRevision,
    this.deletedAtPosition,
  );

  /// Name of deleted stream
  final String streamId;

  /// [LogPosition] of tombstone event
  final LogPosition? deletedAtPosition;

  /// [LogPosition] of tombstone event
  final StreamRevision? deletedAtRevision;

  /// Create a [DeleteResult] from [TombstoneResp]
  static DeleteResult fromTombstoneResp(
      StreamState state, TombstoneResp result) {
    return DeleteResult._(
      state.streamId,
      state.revision,
      result.hasNoPosition()
          ? null
          : LogPosition.checked(
              result.position.commitPosition,
              result.position.preparePosition,
            ),
    );
  }

  /// Create a [DeleteResult] from [DeleteResp]
  static DeleteResult fromDeleteResp(StreamState state, DeleteResp result) {
    return DeleteResult._(
      state.streamId,
      state.revision,
      result.hasNoPosition()
          ? null
          : LogPosition.checked(
              result.position.commitPosition,
              result.position.preparePosition,
            ),
    );
  }
}
