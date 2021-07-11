import 'package:meta/meta.dart';

import 'package:eventstore_client_dart/src/core/enums.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/generated/streams.pb.dart';
import 'package:eventstore_client_dart/eventstore_client_dart.dart';

/// An interface representing the result of a write operation.
abstract class WriteResult {
  WriteResult(this.actualState);

  /// The [StreamState] after the operation.
  final StreamState actualState;

  /// The name of the stream.
  String get streamName => actualState.name;

  /// The [StreamStateType] after the operation.
  StreamStateType get actualType => actualState.type;

  /// The [LogPosition] after the operation.
  LogPosition get actualPosition => actualState.position ?? LogPosition.start;

  /// The expected [StreamRevision] on next write operation.
  StreamRevision get nextExpectedStreamRevision =>
      actualState.revision ?? StreamRevision.none;

  /// Create appropriate [WriteResult] for given [AppendResp]
  static WriteResult from(StreamState expected, AppendResp resp) {
    switch (resp.whichResult()) {
      case AppendResp_Result.success:
        return WriteSuccessResult(
          expected.fromSuccess(resp),
        );
      case AppendResp_Result.wrongExpectedVersion:
        return WrongExpectedVersionResult(
          expected,
          expected.fromWrongExpectedVersion(resp),
        );
      case AppendResp_Result.notSet:
      default:
        throw UnsupportedError('AppendResp $resp is unsupported');
    }
  }
}

@sealed
@immutable
class WriteSuccessResult extends WriteResult {
  WriteSuccessResult(StreamState state) : super(state);
}

@sealed
@immutable
class WrongExpectedVersionResult extends WriteResult {
  WrongExpectedVersionResult(
    this.expected,
    StreamState actual,
  ) : super(actual);

  /// The [StreamState] before the operation.
  final StreamState expected;
}
