import 'dart:async';
import 'dart:convert';

import 'package:grpc/grpc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import 'package:eventstore_client_dart/src/core/event_record.dart';
import 'package:eventstore_client_dart/src/core/resolved_event.dart';
import 'package:eventstore_client_dart/src/core/stream_position.dart';
import 'package:eventstore_client_dart/src/generated/streams.pbgrpc.dart';
import 'package:eventstore_client_dart/src/core/enums.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/core/stream_revision.dart';
import 'package:eventstore_client_dart/src/core/stream_state.dart';

/// An interface representing the result of a read operation.
abstract class ReadEventsResult {
  ReadEventsResult();

  /// The [StreamState] after the operation.
  StreamState get actualState;

  /// The name of the stream.
  String get streamName => actualState.name;

  /// The [StreamStateType] after the operation.
  StreamStateType get actualType => actualState.type;

  /// The [LogPosition] after the operation.
  LogPosition get actualPosition => actualState.position ?? LogPosition.start;

  /// The expected [StreamRevision] on next write operation.
  StreamRevision get nextExpectedStreamRevision =>
      actualState.revision ?? StreamRevision.none;

  /// Create appropriate [ReadEventsResult] from given [ResponseStream]
  static Future<ReadEventsResult> from(
    StreamState expected,
    ResponseStream<ReadResp> stream,
  ) {
    final completer = Completer<ReadEventsResult>();
    ReadEventsSuccessResult? success;

    // Forward responses to result
    stream.listen(
      (resp) {
        if (resp.hasStreamNotFound()) {
          if (!completer.isCompleted) {
            completer.complete(
              ReadEventsStreamNotFoundResult._(expected),
            );
          }
        } else if (resp.hasEvent()) {
          success ??= ReadEventsSuccessResult._(
            stream,
            expected,
          );
          if (!completer.isCompleted) {
            completer.complete(
              success,
            );
          }
          success!._add(
            convertToResolvedEvent(resp.event),
          );
        }
      },
      onDone: () {
        success ??= ReadEventsSuccessResult._(
          stream,
          expected,
        );
        if (!completer.isCompleted) {
          completer.complete(
            success,
          );
        }
        success?.cancel();
      },
      onError: (
        Object error,
        StackTrace stackTrace,
      ) {
        if (!completer.isCompleted) {
          completer.completeError(error, stackTrace);
        } else {
          success?._addError(error, stackTrace);
        }
      },
    );
    return completer.future;
  }

  // static Object convertToItem(ReadResp resp) {
  //   switch (resp.whichContent()) {
  //     case ReadResp_Content.event:
  //       return convertToResolvedEvent(resp.event);
  //     case ReadResp_Content.confirmation:
  //       // TODO: Handle this case.
  //       break;
  //     case ReadResp_Content.checkpoint:
  //       // TODO: Handle this case.
  //       break;
  //     case ReadResp_Content.streamNotFound:
  //       return resp.streamNotFound;
  //     case ReadResp_Content.notSet:
  //   }
  //   throw UnsupportedError('ReadResp $resp is unsupported');
  // }

  static ResolvedEvent convertToResolvedEvent(ReadResp_ReadEvent readEvent) {
    return ResolvedEvent(
        convertToEventRecord(readEvent.event),
        readEvent.hasLink() ? convertToEventRecord(readEvent.link) : null,
        readEvent.hasCommitPosition() ? readEvent.commitPosition : null);
  }

  static EventRecord convertToEventRecord(
      ReadResp_ReadEvent_RecordedEvent event) {
    return EventRecord(
      utf8.decode(event.streamIdentifier.streamName),
      UuidValue(event.id.string),
      StreamPosition.fromInt64(event.streamRevision),
      LogPosition.checked(event.commitPosition, event.preparePosition),
      event.data,
      event.customMetadata,
      event.metadata,
    );
  }

/*
      response.ContentCase switch {
  ReadResp.ContentOneofCase.Confirmation => (
  new SubscriptionConfirmation(response.Confirmation.SubscriptionId), null, default),
  ReadResp.ContentOneofCase.Event => (SubscriptionConfirmation.None,
  null,
  ConvertToResolvedEvent(response.Event)),
  ReadResp.ContentOneofCase.Checkpoint => (SubscriptionConfirmation.None,
  new Position(response.Checkpoint.CommitPosition, response.Checkpoint.PreparePosition),
  default),
  _ => null
  };

  */

}

@sealed
class ReadEventsSuccessResult extends ReadEventsResult {
  ReadEventsSuccessResult._(
    this._resp,
    this._actualState,
  );

  /// Get resolved events as stream
  Stream<ResolvedEvent> get stream {
    return _controller.stream;
  }

  /// Get resolved events as list
  Future<Iterable<ResolvedEvent>> get events => stream.toList();

  // Internal stream controller for events from streams client
  final StreamController<ResolvedEvent> _controller =
      StreamController<ResolvedEvent>();

  @override
  StreamState get actualState => _actualState;
  StreamState _actualState;

  void _add(ResolvedEvent event) {
    _actualState = StreamState.exists(
      event.originalStreamId,
      position: event.originalPosition,
      revision: event.originalEventNumber.toRevision(),
    );
    _controller.add(event);
  }

  void _addError(Object error, StackTrace stackTrace) {
    _controller.addError(error, stackTrace);
  }

  /// Cancel call to server
  Future<void> cancel() async {
    await _controller.close();
    return _resp.cancel();
  }

  final ResponseStream<ReadResp> _resp;
}

@sealed
@immutable
class ReadEventsStreamNotFoundResult extends ReadEventsResult {
  ReadEventsStreamNotFoundResult._(
    this._actualState,
  );

  @override
  StreamState get actualState => _actualState;
  final StreamState _actualState;
}
