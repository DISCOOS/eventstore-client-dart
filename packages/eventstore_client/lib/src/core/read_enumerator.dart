import 'dart:async';

import 'package:eventstore_client/src/generated/code.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';
import 'package:tuple/tuple.dart';

import 'package:eventstore_client/eventstore_client.dart';

enum ReadResponse {
  streamNotFound,
  event,
  confirmation,
  checkpoint,
  notSet,
}

/// Internal class for reading [ReadResponse] from server
class ReadEnumerator<T extends GeneratedMessage> {
  ReadEnumerator._(
    this.state,
    this._progress,
    this._responseStream,
    this._toTypedException,
  );

  /// The [StreamState] after the operation.
  final ReadState state;

  /// Internal [ResponseStream] for cancelling
  final ResponseStream<T> _responseStream;

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
      if (SystemEvents.StreamDeleted == event.event.eventType) {
        _drop(
          SubscriptionDroppedReason.serverError,
          StreamDeletedException.fromEvent(
            StreamDeletedEvent.from(event),
          ),
        );
      }
    }
  }

  void _addError(Object error, StackTrace stackTrace) {
    final typed = error is! Exception ? error : _toTypedException(error);
    if (isSubscription) {
      // Subscription stream does not throw errors,
      // they are dropped with a reason and cause
      _drop(
        error is GrpcError && error.code != Code.CANCELLED.value
            ? SubscriptionDroppedReason.serverError
            : error is GrpcError && error.code == Code.CANCELLED.value
                ? SubscriptionDroppedReason.disposed
                : SubscriptionDroppedReason.subscriberError,
        typed,
      );
    } else if (!isCompleted) {
      _eventController.addError(typed, stackTrace);
    }
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
  static Future<ReadEnumerator<T>> from<T extends GeneratedMessage>({
    required StreamState expected,
    required ResponseStream<T> stream,
    required String Function(T) toSubscriptionId,
    required ReadResponse Function(T) toReadResp,
    required ResolvedEvent Function(T) toResolvedEvent,
    required Exception Function(Exception) toTypedException,
    LogPosition Function(T)? toCheckpoint,
  }) {
    ReadEnumerator<T>? result;
    final completer = Completer<ReadEnumerator<T>>();

    // Forward responses to result
    stream.listen(
      (resp) {
        switch (toReadResp(resp)) {
          case ReadResponse.streamNotFound:
            result = _onResponse<T>(
              ReadState.stream_not_found,
              expected,
              result,
              stream,
              completer,
              toTypedException,
            );
            break;
          case ReadResponse.event:
            result = _onResponse(
              ReadState.ok,
              expected,
              result,
              stream,
              completer,
              toTypedException,
            ).._add(
                toResolvedEvent(resp),
              );
            break;
          case ReadResponse.confirmation:
            result = _onResponse(
              ReadState.ok,
              expected,
              result,
              stream,
              completer,
              toTypedException,
            ).._confirm(
                toSubscriptionId(resp),
              );
            break;
          case ReadResponse.checkpoint:
            result = _onResponse(
              ReadState.ok,
              expected,
              result,
              stream,
              completer,
              toTypedException,
            ).._checkpoint(
                toCheckpoint!(resp),
              );
            break;
          case ReadResponse.notSet:
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
      cancelOnError: true,
    );
    return completer.future;
  }

  static ReadEnumerator<T> _onResponse<T extends GeneratedMessage>(
    ReadState state,
    StreamState expected,
    ReadEnumerator<T>? result,
    ResponseStream<T> stream,
    Completer<ReadEnumerator<T>> completer,
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
}
