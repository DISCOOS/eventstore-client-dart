import 'dart:async';
import 'dart:convert';

import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

import 'package:eventstore_client_dart/src/core/event_record.dart';
import 'package:eventstore_client_dart/src/core/resolved_event.dart';
import 'package:eventstore_client_dart/src/core/stream_position.dart';
import 'package:eventstore_client_dart/src/generated/streams.pbgrpc.dart';
import 'package:eventstore_client_dart/src/core/enums.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/core/stream_revision.dart';
import 'package:eventstore_client_dart/src/core/stream_state.dart';

enum ReadState {
  ok,
  stream_not_found,
}

/// An interface representing the result of a read operation.
class ReadEventsResult {
  ReadEventsResult._(
    this.state,
    this._streamState,
    this._responseStream,
  );

  /// The [StreamState] after the operation.
  final ReadState state;

  /// Check if read result is OK
  bool get isOK => state == ReadState.ok;

  /// Check if stream was not found
  bool get isStreamNotFound => state == ReadState.stream_not_found;

  /// Check if operation has completed. Operation is completed when
  /// all events are fetched with [events] or [stream], and after
  /// [cancel] is called.
  bool get isCompleted => _controller.isClosed;

  /// Internal [ResponseStream] for cancelling
  final ResponseStream<ReadResp> _responseStream;

  /// Internal [StreamState] tracking progress
  StreamState _streamState;

  /// The name of the stream.
  String get streamName => _streamState.name;

  /// The [StreamStateType] after the operation.
  StreamStateType get type => _streamState.type;

  /// The [LogPosition] after the operation.
  LogPosition get position {
    return isCompleted
        ? _streamState.position ?? LogPosition.start
        : LogPosition.start;
  }

  /// The expected [StreamRevision] on next write operation.
  StreamRevision get nextExpectedStreamRevision {
    return isCompleted
        ? (_streamState.revision ?? StreamRevision.none)
        : StreamRevision.none;
  }

  /// Get resolved events as stream
  Stream<ResolvedEvent> get stream {
    return _controller.stream;
  }

  // Internal stream controller for events from streams client
  final StreamController<ResolvedEvent> _controller =
      StreamController<ResolvedEvent>();

  void _add(ResolvedEvent event) {
    _streamState = StreamState.exists(
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
    return _responseStream.cancel();
  }

  /// Get resolved events as list
  Future<Iterable<ResolvedEvent>> get events => stream.toList();

  /// Create appropriate [ReadEventsResult] from given [ResponseStream]
  static Future<ReadEventsResult> from(
    StreamState expected,
    ResponseStream<ReadResp> stream,
  ) {
    final completer = Completer<ReadEventsResult>();
    ReadEventsResult? success;

    // Forward responses to result
    stream.listen(
      (resp) {
        switch (resp.whichContent()) {
          case ReadResp_Content.streamNotFound:
            success ??= ReadEventsResult._(
              ReadState.stream_not_found,
              expected,
              stream,
            );
            if (!completer.isCompleted) {
              completer.complete(
                success,
              );
            }
            break;
          case ReadResp_Content.event:
            success ??= ReadEventsResult._(
              ReadState.ok,
              expected,
              stream,
            );
            if (!completer.isCompleted) {
              completer.complete(
                success,
              );
            }
            success!._add(
              convertToResolvedEvent(resp.event),
            );
            break;
          case ReadResp_Content.confirmation:
            // TODO: Handle this case.
            break;
          case ReadResp_Content.checkpoint:
            // TODO: Handle this case.
            break;
          case ReadResp_Content.notSet:
            // TODO: Handle this case.
            break;
        }
      },
      onDone: () {
        success ??= ReadEventsResult._(
          ReadState.ok,
          expected,
          stream,
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
