part of 'streams_client.dart';

/// An interface representing the result of a read operation.
class ReadEventsResult {
  ReadEventsResult._(this._enumerator);

  // Reference to internal instance
  final ReadEnumerator _enumerator;

  /// The [StreamState] after the operation.
  ReadState get state => _enumerator.state;

  /// Check if read result is OK
  bool get isOK => _enumerator.isOK;

  /// Check if stream was not found
  bool get isStreamNotFound => _enumerator.isStreamNotFound;

  /// Check if operation has completed. Operation is completed when
  /// all events are fetched with [events] or [stream], or after
  /// [dispose] is called.
  bool get isCompleted => _enumerator.isCompleted;

  /// Get [StreamState] progress
  StreamState get progress => _enumerator.progress;

  /// Get [StreamState.streamId]
  String get streamId => _enumerator.progress.streamId;

  /// Get [LogPosition] after operation [isCompleted].
  /// Returns [LogPosition.end] until stream [isCompleted].
  LogPosition get position => isCompleted
      ? _enumerator.progress.position ?? LogPosition.end
      : LogPosition.end;

  /// The expected [StreamRevision] on next write operation.
  /// Returns [StreamRevision.none] until stream [isCompleted].
  StreamRevision get nextExpectedStreamRevision => isCompleted
      ? _enumerator.progress.revision ?? StreamRevision.none
      : StreamRevision.none;

  /// Get resolved events as single-subscriber stream
  Stream<ResolvedEvent> get stream => _enumerator.stream;

  /// Get resolved events as list
  Future<Iterable<ResolvedEvent>> get events => _enumerator.events;

  /// Get resolved events as broadcast stream
  Stream<ResolvedEvent> asBroadcastStream() => _enumerator.asBroadcastStream();

  /// Cancel connection with server.
  Future<void> dispose() => _enumerator.dispose();
}
