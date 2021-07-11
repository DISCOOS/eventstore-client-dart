import 'package:async/async.dart';
import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/client_base.dart';
import 'package:eventstore_client_dart/src/core/constants.dart';
import 'package:eventstore_client_dart/src/core/event_data.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/core/stream_state.dart';
import 'package:eventstore_client_dart/src/generated/shared.pb.dart';
import 'package:eventstore_client_dart/src/generated/streams.pbgrpc.dart';
import 'package:eventstore_client_dart/src/streams/read_results.dart';
import 'package:eventstore_client_dart/src/streams/write_results.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

class EventStoreDBStreamsClient extends EventStoreDBClientBase {
  EventStoreDBStreamsClient(
    String connectionName,
    ClientChannel channel, {
    CallOptions? options,
    List<ClientInterceptor> interceptors = const [],
  }) : super(connectionName) {
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

  Future<ReadEventsResult> readFromAll(
    LogPosition position, {
    int? count,
    bool forward = true,
    CallOptions? options,
    bool resolveLinks = true,
  }) async {
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
  }

  Future<ReadEventsResult> readFromStream(
    String name,
    StreamPosition position, {
    int? count,
    bool forward = true,
    CallOptions? options,
    bool resolveLinks = true,
  }) async {
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
  }

  Future<WriteResult> append(
    StreamState state,
    Stream<EventData> events, {
    CallOptions? options,
  }) async {
    final requests = StreamGroup.mergeBroadcast([
      Stream.value(state.toAppendReq()),
      events.map(_toAppendEvent),
    ]);
    final result = await _client.append(
      requests,
      options: _toOptions(options),
    );
    return WriteResult.from(state, result);
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
