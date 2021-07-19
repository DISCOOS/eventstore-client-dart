import 'package:async/async.dart';
import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/client_base.dart';
import 'package:eventstore_client_dart/src/core/constants.dart';
import 'package:eventstore_client_dart/src/core/event_data.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/core/stream_state.dart';
import 'package:eventstore_client_dart/src/core/typedefs.dart';
import 'package:eventstore_client_dart/src/generated/shared.pb.dart';
import 'package:eventstore_client_dart/src/generated/streams.pbgrpc.dart';
import 'package:eventstore_client_dart/src/streams/delete_results.dart';
import 'package:eventstore_client_dart/src/streams/read_results.dart';
import 'package:eventstore_client_dart/src/streams/write_results.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

class EventStoreStreamsClient extends EventStoreClientBase {
  EventStoreStreamsClient(
    String connectionName,
    ClientChannel channel, {
    CallOptions? options,
    List<ClientInterceptor> interceptors = const [],
  }) : super(
          connectionName,
          <String, GrpcErrorCallback>{
            Exceptions.WrongExpectedVersion: (e) =>
                WrongExpectedVersionException.fromCause(e),
            Exceptions.StreamDeleted: (ex) =>
                StreamDeletedException.fromCause(ex)
          },
        ) {
    _client = StreamsClient(
      channel,
      options: options,
      interceptors: toInterceptors(
        connectionName,
        interceptors,
      ),
    );
  }

  late final StreamsClient _client;

  /// Read all [ResolvedEvent]s in EventStore from given [position].
  /// Use [count] to limit number of events to read.
  /// Default is all events from given position.
  /// Use [forward] to read towards the end of stream. Default is true.
  /// Use [resolveLinks] to resolve links as [ResolvedEvent].
  /// Returns as [ReadEventsResult] on first response from the server.
  Future<ReadEventsResult> readFromAll(
    LogPosition position, {
    int? count,
    bool forward = true,
    CallOptions? options,
    bool resolveLinks = true,
  }) {
    return runRequest<ReadEventsResult>(() {
      final request = _toReadAllReq(
        position,
        count: count,
        forward: forward,
        resolveLinks: resolveLinks,
      );
      final resultStream = _client.read(
        request,
        options: _toOptions(options),
      );
      return ReadEventsResult.from(
        StreamState.all(position),
        resultStream,
      );
    });
  }

  /// Read [ResolvedEvent]s from given stream [name] and [position].
  /// Use [count] to limit number of events to read.
  /// Default is all events from given position.
  /// Use [forward] to read towards the end of stream. Default is true.
  /// Use [resolveLinks] to resolve links as [ResolvedEvent].
  /// Returns as [ReadEventsResult] on first response from the server.
  Future<ReadEventsResult> readFromStream(
    String name,
    StreamPosition position, {
    int? count,
    bool forward = true,
    CallOptions? options,
    bool resolveLinks = true,
  }) {
    return runRequest<ReadEventsResult>(() {
      final state = StreamState.exists(
        name,
        revision: StreamRevision.fromPosition(position),
      );
      final request = state.toReadReq(
        count: count,
        forward: forward,
        resolveLinks: resolveLinks,
      );
      final resultStream = _client.read(
        request,
        options: _toOptions(options),
      );
      return ReadEventsResult.from(
        state,
        resultStream,
      );
    });
  }

  /// Append [events] to stream given by [state].
  /// Returns as [WriteResult] when the operation has completed.
  /// If a concurrent write has occurred, a [WrongExpectedVersionResult]
  /// is returned. Otherwise, [WriteSuccessResult] is returned.
  Future<WriteResult> append(
    StreamState state,
    Stream<EventData> events, {
    CallOptions? options,
  }) {
    return runRequest<WriteResult>(() async {
      final requests = StreamGroup.mergeBroadcast([
        Stream.value(state.toAppendReq()),
        events.map(_toAppendEvent),
      ]);
      final result = await _client.append(
        requests,
        options: _toOptions(options),
      );
      return WriteResult.from(state, result);
    });
  }

  /// Perform a hard delete of stream.
  /// When using hard delete, the stream gets closed with a tombstone event.
  /// Such an event tells the database that the stream cannot be reopened,
  /// so any attempt to append to the hard-deleted stream will fail.
  /// See [deleting streams and events](https://developers.eventstore.com/server/v20.10/docs/streams/deleting-streams-and-events.html)
  Future<DeleteResult> tombstone(
    StreamState state, {
    CallOptions? options,
  }) {
    return runRequest<DeleteResult>(() async {
      final request = state.toTombstoneReq();
      final result = await _client.tombstone(
        request,
        options: _toOptions(options),
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
    CallOptions? options,
  }) {
    return runRequest<DeleteResult>(() async {
      final request = state.toDeleteReq();
      final result = await _client.delete(
        request,
        options: _toOptions(options),
      );
      return DeleteResult.fromDeleteResp(state, result);
    });
  }

  CallOptions _toOptions(CallOptions? options) {
    // TODO: Implement connection settings
    return (options ?? CallOptions()).mergedWith(CallOptions(metadata: {
      Headers.RequiresLeader: 'False',
      // Headers.Authorization: 'Basic ${base64Encode(utf8.encode('admin:changeit'))}',
    }));
  }

  AppendReq _toAppendEvent(EventData event) {
    return AppendReq()
      ..proposedMessage = (AppendReq_ProposedMessage()
        ..id = (UUID()..string = event.uuid.uuid)
        ..data = event.data
        ..customMetadata = event.metadata
        ..metadata.addAll({
          Metadata.Type: event.type,
          Metadata.ContentType: event.contentType,
        }));
  }

  ReadReq _toReadAllReq(
    LogPosition position, {
    int? count,
    bool forward = true,
    bool resolveLinks = true,
  }) {
    if (count != null && count <= 0) {
      throw GrpcError.outOfRange('count must be greater than zero');
    }
    final options = ReadReq_Options()
      ..noFilter = Empty()
      ..resolveLinks = resolveLinks
      ..all = _toAllOptions(position)
      ..readDirection = forward
          ? ReadReq_Options_ReadDirection.Forwards
          : ReadReq_Options_ReadDirection.Backwards
      ..count = count == null ? Int64.MAX_VALUE : Int64(count)
      // returns uuids as strings
      ..uuidOption = (ReadReq_Options_UUIDOption()..string = Empty());

    return ReadReq()..options = options;
  }

  ReadReq_Options_AllOptions _toAllOptions(LogPosition position) {
    final all = ReadReq_Options_AllOptions();
    if (position == LogPosition.start) {
      all.start = Empty();
    } else if (position == LogPosition.end) {
      all.end = Empty();
    } else {
      all.position = ReadReq_Options_Position()
        ..commitPosition = position.commitPosition
        ..preparePosition = position.preparePosition;
    }
    return all;
  }
}
