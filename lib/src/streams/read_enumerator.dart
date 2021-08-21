import 'dart:async';
import 'dart:convert';

import 'package:eventstore_client_dart/src/generated/code.pb.dart';
import 'package:eventstore_client_dart/src/streams/enums.dart';
import 'package:grpc/grpc.dart';
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';

import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/resolved_event.dart';
import 'package:eventstore_client_dart/src/core/stream_position.dart';
import 'package:eventstore_client_dart/src/generated/streams.pbgrpc.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/core/stream_state.dart';

/// Internal class for reading [ReadResp] from server
class ReadEnumerator {
  ReadEnumerator._(
    this.state,
    this._progress,
    this._responseStream,
    this._toTypedException,
  );

  /// The [StreamState] after the operation.
  final ReadState state;

  /// Internal [ResponseStream] for cancelling
  final ResponseStream<ReadResp> _responseStream;

  /// Internal stream controller for events from streams client
  final StreamController<ResolvedEvent> _eventController = StreamController();

  /// Internal method for mapping to typed exceptions
  final Exception Function(Exception) _toTypedException;

  /// Internal [StreamState] tracking progress
  StreamState get progress => _progress;
  StreamState _progress;

  /// Check if read result is OK
  bool get isOK => state == ReadState.ok;

  /// The id of the [EventStreamSubscription] set by the server.
  String? get subscriptionId => _subscriptionId;
  String? _subscriptionId;

  /// Check if result is a subscription
  bool get isSubscription => isOK && _subscriptionId != null;

  /// Check if stream was not found
  bool get isStreamNotFound => state == ReadState.stream_not_found;

  /// Check if operation has completed. Operation is completed when
  /// all events are fetched with [events] or [stream], or after
  /// [dispose] is called.
  bool get isCompleted => _isDisposed;
  bool _isDisposed = false;

  /// Get resolved events as single-subscriber stream
  Stream<ResolvedEvent> get stream => _eventController.stream;

  /// Get resolved events as list. Returns when all events are
  /// fetched, after if [dispose] is called or an error has occurred.
  Future<Iterable<ResolvedEvent>> get events => stream.toList();

  /// Get resolved events as broadcast stream
  Stream<ResolvedEvent> asBroadcastStream() {
    return _eventController.stream.asBroadcastStream();
  }

  /// Get stream of [checkpoints]
  Stream<LogPosition>? get checkpoints => _checkpointController?.stream;
  StreamController<LogPosition>? _checkpointController;

  /// Get reason for subscription being dropped
  Future<Tuple2<SubscriptionDroppedReason, Object?>>?
      get onSubscriptionDropped => _subscriptionDropped?.future;
  Completer<Tuple2<SubscriptionDroppedReason, Object?>>? _subscriptionDropped;

  void _add(ResolvedEvent event) {
    if (!isCompleted) {
      _progress = StreamState.exists(
        event.originalStreamId,
        position: event.originalPosition,
        revision: event.originalEventNumber.toRevision(),
      );
      _eventController.add(event);
      if (SystemEventTypes.StreamDeleted == event.event.eventType) {
        _drop(
            SubscriptionDroppedReason.serverError,
            StreamDeletedException.fromEvent(
              StreamDeletedEvent.from(event),
            ));
      }
    }
  }

  void _addError(Object error, StackTrace stackTrace) {
    final typed = error is! Exception ? error : _toTypedException(error);
    if (!isCompleted) {
      _eventController.addError(typed, stackTrace);
    }
    _drop(
      error is GrpcError && error.code != Code.CANCELLED.value
          ? SubscriptionDroppedReason.serverError
          : error is GrpcError && error.code == Code.CANCELLED.value
              ? SubscriptionDroppedReason.disposed
              : SubscriptionDroppedReason.subscriberError,
      typed,
    );
    dispose();
  }

  void _confirm(String subscriptionId) {
    _subscriptionId = subscriptionId;
    _subscriptionDropped = Completer();
    _checkpointController ??= StreamController();
  }

  void _checkpoint(LogPosition position) {
    if (!isCompleted) {
      _progress = StreamState.exists(
        _progress.streamId,
        position: position,
        revision: StreamRevision.none,
      );
      _checkpointController!.add(position);
    }
  }

  /// Cancel connection with server.
  Future<void> dispose() async {
    _drop(SubscriptionDroppedReason.disposed);
    if (!isCompleted) {
      _isDisposed = true;
      await _responseStream.cancel();
      if (_eventController.hasListener) {
        await _eventController.close();
      }
      if (_checkpointController?.hasListener == true) {
        await _checkpointController?.close();
      }
    }
  }

  void _drop(SubscriptionDroppedReason reason, [Object? cause]) {
    if (_subscriptionDropped?.isCompleted == false) {
      _subscriptionDropped?.complete(
        Tuple2(reason, cause),
      );
    }
  }

  /// Create appropriate [ReadEnumerator] from given [ResponseStream]
  static Future<ReadEnumerator> from(
    StreamState expected,
    ResponseStream<ReadResp> stream,
    Exception Function(Exception) toTypedException,
  ) {
    final completer = Completer<ReadEnumerator>();
    ReadEnumerator? result;

    // Forward responses to result
    stream.listen(
      (resp) {
        switch (resp.whichContent()) {
          case ReadResp_Content.streamNotFound:
            result = _onResponse(
              ReadState.stream_not_found,
              expected,
              result,
              stream,
              completer,
              toTypedException,
            );
            break;
          case ReadResp_Content.event:
            result = _onResponse(
              ReadState.ok,
              expected,
              result,
              stream,
              completer,
              toTypedException,
            ).._add(
                convertToResolvedEvent(resp.event),
              );
            break;
          case ReadResp_Content.confirmation:
            result = _onResponse(
              ReadState.ok,
              expected,
              result,
              stream,
              completer,
              toTypedException,
            ).._confirm(
                resp.confirmation.subscriptionId,
              );
            break;
          case ReadResp_Content.checkpoint:
            result = _onResponse(
              ReadState.ok,
              expected,
              result,
              stream,
              completer,
              toTypedException,
            ).._checkpoint(LogPosition.checked(
                resp.checkpoint.commitPosition,
                resp.checkpoint.preparePosition,
              ));
            break;
          case ReadResp_Content.notSet:
            throw StateError(
              'Received empty content type: $resp',
            );
        }
      },
      onDone: () {
        result ??= _onResponse(
          ReadState.ok,
          expected,
          result,
          stream,
          completer,
          toTypedException,
        );
        result!.dispose();
      },
      onError: (
        Object error,
        StackTrace stackTrace,
      ) {
        if (!completer.isCompleted) {
          completer.completeError(
            error is Exception ? toTypedException(error) : error,
            stackTrace,
          );
        } else {
          result ??= _onResponse(
            ReadState.ok,
            expected,
            result,
            stream,
            completer,
            toTypedException,
          );
          result?._addError(
            error,
            stackTrace,
          );
        }
      },
    );
    return completer.future;
  }

  static ReadEnumerator _onResponse(
    ReadState state,
    StreamState expected,
    ReadEnumerator? result,
    ResponseStream<ReadResp> stream,
    Completer<ReadEnumerator> completer,
    Exception Function(Exception) toTypedException,
  ) {
    result ??= ReadEnumerator._(
      state,
      expected,
      stream,
      toTypedException,
    );
    if (!completer.isCompleted) {
      completer.complete(
        result,
      );
    }
    return result;
  }

  static ResolvedEvent convertToResolvedEvent(ReadResp_ReadEvent readEvent) {
    return ResolvedEvent(
        convertToEventRecord(readEvent.event),
        readEvent.hasLink() ? convertToEventRecord(readEvent.link) : null,
        readEvent.hasCommitPosition() ? readEvent.commitPosition : null);
  }

  static EventRecord convertToEventRecord(
      ReadResp_ReadEvent_RecordedEvent event) {
    return EventRecord(
      utf8.decode(event.streamIdentifier.streamId),
      UuidValue(event.id.string),
      StreamPosition.fromInt64(event.streamRevision),
      LogPosition.checked(event.commitPosition, event.preparePosition),
      event.data,
      event.customMetadata,
      event.metadata,
    );
  }
}
