import 'dart:async';

import 'package:eventstore_client/src/generated/status.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:meta/meta.dart';

import 'package:eventstore_client/src/core/log_position.dart';
import 'package:eventstore_client/src/generated/streams.pb.dart';
import 'package:eventstore_client/eventstore_client.dart';

/// An interface representing the result of a write operation.
abstract class WriteResult {
  WriteResult(this.actualState);

  /// The [StreamState] after the operation.
  final StreamState actualState;

  /// The name of the stream.
  String get streamId => actualState.streamId;

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
        return WriteSuccessResult._(
          expected.fromAppendSuccess(resp),
        );
      case AppendResp_Result.wrongExpectedVersion:
        return WrongExpectedVersionResult._(
          expected,
          expected.fromAppendWrongExpectedVersion(resp),
        );
      case AppendResp_Result.notSet:
      default:
        throw UnsupportedError('AppendResp $resp is unsupported');
    }
  }

  static Future<WriteResult> fromBatch(
    StreamState expected,
    ResponseStream<BatchAppendResp> stream,
  ) {
    final completer = Completer<WriteResult>();
    BatchWriteResult? result;

    // Forward responses to result
    stream.listen(
      (resp) {
        switch (resp.whichResult()) {
          case BatchAppendResp_Result.error:
            result ??= BatchWriteErrorResult._(
              expected,
              resp.error,
              stream,
            );
            if (!completer.isCompleted) {
              completer.complete(
                result,
              );
            }
            break;
          case BatchAppendResp_Result.success:
            result ??= BatchWriteSuccessResult._(
              expected.toExists(),
              stream,
            );
            if (!completer.isCompleted) {
              completer.complete(
                result,
              );
            }
            result!._add(resp.success);
            break;
          case BatchAppendResp_Result.notSet:
            // TODO: Handle this case.
            break;
        }
      },
      onDone: () {
        result ??= BatchWriteSuccessResult._(
          expected,
          stream,
        );
        if (!completer.isCompleted) {
          completer.complete(
            result,
          );
        }
        result?.cancel();
      },
      onError: (
        Object error,
        StackTrace stackTrace,
      ) {
        if (!completer.isCompleted) {
          completer.completeError(error, stackTrace);
        } else {
          result?._addError(error, stackTrace);
        }
      },
    );
    return completer.future;
  }
}

@sealed
@immutable
class WriteSuccessResult extends WriteResult {
  WriteSuccessResult._(StreamState state) : super(state);
}

@sealed
abstract class BatchWriteResult extends WriteResult {
  BatchWriteResult(
    StreamState state,
    this._responseStream,
  )   : _streamState = state,
        super(state);

  // Internal stream controller for events from streams client
  final StreamController<StreamState> _controller =
      StreamController<StreamState>();

  bool get isOK => this is BatchWriteSuccessResult;
  bool get isError => this is BatchWriteErrorResult;

  @override
  StreamState get actualState {
    return _streamState ?? super.actualState;
  }

  StreamState? _streamState;

  void _add(BatchAppendResp_Success success) {
    _streamState = StreamState.exists(
      super.actualState.streamId,
      position: LogPosition.checked(
        success.position.commitPosition,
        success.position.preparePosition,
      ),
      revision: StreamRevision.fromInt64(
        success.currentRevision,
      ),
    );
    _controller.add(_streamState!);
  }

  void _addError(Object error, StackTrace stackTrace) {
    _controller.addError(error, stackTrace);
  }

  /// Cancel call to server
  Future<void> cancel() async {
    await _controller.close();
    return _responseStream.cancel();
  }

  /// Check if operation has completed. Operation is completed when
  /// all events are appended, and after [cancel] is called.
  bool get isCompleted => _controller.isClosed;

  /// Internal [ResponseStream] for cancelling
  final ResponseStream<BatchAppendResp> _responseStream;
}

@sealed
class BatchWriteSuccessResult extends BatchWriteResult {
  BatchWriteSuccessResult._(
    StreamState state,
    ResponseStream<BatchAppendResp> responseStream,
  ) : super(state, responseStream);
}

@sealed
class BatchWriteErrorResult extends BatchWriteResult {
  BatchWriteErrorResult._(
    this.expected,
    this._status,
    ResponseStream<BatchAppendResp> responseStream,
  ) : super(expected, responseStream);

  /// The [StreamState] before the operation.
  final StreamState expected;

  /// Error information
  final Status _status;

  /// Get error message
  String get message => _status.message;

  @override
  StreamState get actualState {
    return super.actualState;
  }
}

@sealed
@immutable
class WrongExpectedVersionResult extends WriteResult {
  WrongExpectedVersionResult._(
    this.expected,
    StreamState actual,
  ) : super(actual);

  /// The [StreamState] before the operation.
  final StreamState expected;
}
