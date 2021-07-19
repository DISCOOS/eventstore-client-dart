import 'dart:convert';

import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/enums.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/core/stream_revision.dart';
import 'package:eventstore_client_dart/src/generated/shared.pb.dart';
import 'package:eventstore_client_dart/src/generated/streams.pb.dart';
import 'package:fixnum/fixnum.dart';

class StreamState {
  const StreamState(
    this.name,
    this.type, [
    this.position,
    this.revision,
  ]);

  final String name;
  final StreamStateType type;
  final LogPosition? position;
  final StreamRevision? revision;

  StreamPosition getStreamPosition([int? offset]) => StreamPosition.checked(
        (offset ?? 0) + (revision ?? StreamRevision.empty).value.toInt(),
      );

  bool get isAll => name == '\$all';
  bool get isAny => type == StreamStateType.any;
  bool get isNoStream => type == StreamStateType.no_stream;
  bool get isStreamExists => type == StreamStateType.stream_exists;

  StreamState fromSuccess(AppendResp resp) {
    if (resp.hasSuccess()) {
      return StreamState(
        name,
        resp.success.hasNoStream()
            ? StreamStateType.no_stream
            : StreamStateType.stream_exists,
        LogPosition.checked(
          resp.success.position.commitPosition,
          resp.success.position.preparePosition,
        ),
        resp.success.hasCurrentRevision()
            ? StreamRevision.fromInt64(resp.success.currentRevision)
            : StreamRevision.none,
      );
    }
    throw UnsupportedError('AppendResp $resp is unsupported');
  }

  StreamState fromWrongExpectedVersion(AppendResp resp) {
    if (resp.hasWrongExpectedVersion()) {
      return StreamState(
        name,
        resp.wrongExpectedVersion.hasCurrentNoStream()
            ? StreamStateType.no_stream
            : StreamStateType.stream_exists,
        null,
        resp.wrongExpectedVersion.hasCurrentRevision()
            ? StreamRevision.fromInt64(
                resp.wrongExpectedVersion.currentRevision,
              )
            : StreamRevision.none,
      );
    }
    throw UnsupportedError('AppendResp $resp is unsupported');
  }

  factory StreamState.noStream(String name) =>
      StreamState(name, StreamStateType.no_stream, null, StreamRevision.none);

  factory StreamState.all(LogPosition? position) => StreamState(
        '\$all',
        StreamStateType.stream_exists,
        position,
      );

  factory StreamState.any(
    String name, {
    LogPosition? position,
    StreamRevision? revision,
  }) =>
      StreamState(
        name,
        StreamStateType.any,
        position,
        revision,
      );

  factory StreamState.exists(
    String name, {
    LogPosition? position,
    StreamRevision? revision,
  }) =>
      StreamState(
        name,
        StreamStateType.stream_exists,
        position,
        revision,
      );

  ReadReq toReadReq({
    int? count,
    bool forward = true,
    bool resolveLinks = true,
  }) {
    final options = ReadReq_Options()
      ..noFilter = Empty()
      ..stream = _toStreamOptions()
      ..resolveLinks = resolveLinks
      ..readDirection = forward
          ? ReadReq_Options_ReadDirection.Forwards
          : ReadReq_Options_ReadDirection.Backwards
      ..count = count == null ? Int64.MAX_VALUE : Int64(count)
      // returns uuids as strings
      ..uuidOption = (ReadReq_Options_UUIDOption()..string = Empty());

    return ReadReq()..options = options;
  }

  ReadReq_Options_StreamOptions _toStreamOptions() {
    final stream = ReadReq_Options_StreamOptions()
      ..streamIdentifier = toStreamIdentifier();
    if (revision == null || revision == StreamRevision.empty) {
      stream.start = Empty();
    } else if (revision == StreamRevision.none) {
      stream.end = Empty();
    } else {
      stream.revision = revision!.value;
    }
    return stream;
  }

  StreamIdentifier toStreamIdentifier() =>
      (StreamIdentifier()..streamName = utf8.encode(name));

  AppendReq toAppendReq() {
    final options = AppendReq_Options()
      ..streamIdentifier = toStreamIdentifier();

    if (revision != null) {
      options.revision = revision!.value;
    } else {
      switch (type) {
        case StreamStateType.any:
          options.any = Empty();
          break;
        case StreamStateType.no_stream:
          options.noStream = Empty();
          break;
        case StreamStateType.stream_exists:
          options.streamExists = Empty();
          break;
      }
    }
    return AppendReq()..options = options;
  }

  TombstoneReq toTombstoneReq() {
    final options = TombstoneReq_Options()
      ..streamIdentifier = toStreamIdentifier();

    if (revision != null) {
      options.revision = revision!.value;
    } else {
      switch (type) {
        case StreamStateType.any:
          options.any = Empty();
          break;
        case StreamStateType.no_stream:
          options.noStream = Empty();
          break;
        case StreamStateType.stream_exists:
          options.streamExists = Empty();
          break;
      }
    }
    return TombstoneReq()..options = options;
  }

  DeleteReq toDeleteReq() {
    final options = DeleteReq_Options()
      ..streamIdentifier = toStreamIdentifier();

    if (revision != null) {
      options.revision = revision!.value;
    } else {
      switch (type) {
        case StreamStateType.any:
          options.any = Empty();
          break;
        case StreamStateType.no_stream:
          options.noStream = Empty();
          break;
        case StreamStateType.stream_exists:
          options.streamExists = Empty();
          break;
      }
    }
    return DeleteReq()..options = options;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreamState &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          type == other.type &&
          position == other.position &&
          revision == other.revision;

  @override
  int get hashCode =>
      name.hashCode ^ type.hashCode ^ position.hashCode ^ revision.hashCode;

  @override
  String toString() {
    return 'StreamState{name: $name, type: $type, position: $position, revision: $revision}';
  }
}
