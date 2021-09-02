import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/helpers.dart';
import 'package:eventstore_client/src/streams/stream_revision.dart';
import 'package:grpc/grpc.dart';

/// <summary>
/// Exception thrown if the expected version specified on an operation
/// does not match the version of the stream when the operation was attempted.
/// </summary>
class WrongExpectedVersionException implements Exception {
  WrongExpectedVersionException._({
    required this.streamId,
    required this.actualStreamRevision,
    required this.expectedStreamRevision,
    this.expectedStreamStateType,
    this.cause,
  });

  /// [Exception] message
  String get message {
    final buffer = StringBuffer()
      ..writeAll(<String>[
        'Append failed due to WrongExpectedVersion. ',
        'Stream: $streamId, ',
        if (expectedVersion != null) 'Expected version: $expectedVersion, ',
        if (expectedStreamStateType != null)
          'Expected stream state: ${enumName(expectedStreamStateType!)}, ',
        'Expected revision: ${expectedStreamRevision.toInt()}, ',
        if (actualVersion != null) 'Actual version: $actualVersion, ',
        'Actual revision: ${actualStreamRevision.toInt()},',
        if (cause != null) 'Cause: $cause',
      ]);
    return buffer.toString();
  }

  /// If available, the [Exception] that caused this exception.
  final Exception? cause;

  /// The stream identifier.
  final String streamId;

  /// If available, the expected version specified for the operation that failed.
  int? get expectedVersion => actualStreamRevision == StreamRevision.none
      ? null
      : actualStreamRevision.value.toInt();

  /// If available, the current version of the stream that the operation was attempted on.
  int? get actualVersion => actualStreamRevision == StreamRevision.none
      ? null
      : actualStreamRevision.value.toInt();

  /// The current [StreamRevision] of the stream that the operation was attempted on.
  final StreamRevision actualStreamRevision;

  /// If available, the expected version specified for the operation that failed.
  final StreamRevision expectedStreamRevision;

  /// If available, the expected [StreamStateType] specified for the operation that failed.
  final StreamStateType? expectedStreamStateType;

  /// Constructs a new instance of [WrongExpectedVersionException]
  /// with the expected and actual versions if available.
  factory WrongExpectedVersionException.fromError(
    GrpcError error,
  ) {
    final streamId = error.trailers![Exceptions.StreamName];
    final actualVersion = error.trailers![Exceptions.ActualVersion];
    final expectedVersion = error.trailers![Exceptions.ExpectedVersion];
    return WrongExpectedVersionException.fromRevisions(
      streamId!,
      actualStreamRevision: actualVersion == null
          ? StreamRevision.none
          : StreamRevision.checked(int.parse(
              actualVersion,
            )),
      expectedStreamRevision: expectedVersion == null
          ? StreamRevision.none
          : StreamRevision.checked(int.parse(
              expectedVersion,
            )),
      cause: error,
    );
  }

  /// Constructs a new instance of [WrongExpectedVersionException]
  /// with the expected and actual versions if available.
  factory WrongExpectedVersionException.fromStateAndRevision(
    StreamState expectedStreamState,
    StreamRevision actualStreamRevision,
  ) {
    return WrongExpectedVersionException._(
      streamId: expectedStreamState.streamId,
      actualStreamRevision: actualStreamRevision,
      expectedStreamStateType: expectedStreamState.type,
      expectedStreamRevision:
          expectedStreamState.revision ?? StreamRevision.none,
    );
  }

  /// Constructs a new instance of [WrongExpectedVersionException]
  /// with the expected and actual versions if available.
  factory WrongExpectedVersionException.fromRevisions(
    String streamId, {
    required StreamRevision actualStreamRevision,
    required StreamRevision expectedStreamRevision,
    Exception? cause,
  }) {
    return WrongExpectedVersionException._(
      streamId: streamId,
      actualStreamRevision: actualStreamRevision,
      expectedStreamRevision: expectedStreamRevision,
      cause: cause,
    );
  }

  @override
  String toString() {
    return '$runtimeType{message: $message}';
  }
}
