import 'dart:convert';

import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/enums.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/core/stream_revision.dart';
import 'package:eventstore_client_dart/src/generated/shared.pb.dart';
import 'package:eventstore_client_dart/src/generated/streams.pb.dart';
import 'package:eventstore_client_dart/src/streams/system_streams.dart';
import 'package:eventstore_client_dart/src/generated/google/empty.pb.dart'
    as $g;
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

  StreamState fromAppendSuccess(AppendResp resp) {
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

  StreamState fromAppendWrongExpectedVersion(AppendResp resp) {
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
      ..resolveLinks = resolveLinks
      ..stream = _toStreamOptions(meta: false)
      ..readDirection = forward
          ? ReadReq_Options_ReadDirection.Forwards
          : ReadReq_Options_ReadDirection.Backwards
      // Same as long.MaxValue in csharp; 9,223,372,036,854,775,807
      ..count = count == null ? Int64.MAX_VALUE : Int64(count)
      // returns uuids as strings
      ..uuidOption = (ReadReq_Options_UUIDOption()..string = Empty());

    return ReadReq()..options = options;
  }

  ReadReq toReadMetaReq() {
    final options = ReadReq_Options()
      ..count = Int64(1)
      ..noFilter = Empty()
      ..resolveLinks = false
      ..stream = _toStreamOptions(meta: true)
      ..readDirection = ReadReq_Options_ReadDirection.Backwards
      // returns uuids as strings
      ..uuidOption = (ReadReq_Options_UUIDOption()..string = Empty());

    return ReadReq()..options = options;
  }

  ReadReq_Options_StreamOptions _toStreamOptions({
    bool meta = false,
  }) {
    final stream = ReadReq_Options_StreamOptions()
      ..streamIdentifier = toStreamIdentifier(meta: meta);
    if (meta) {
      stream.end = Empty();
      // stream.revision = StreamRevision.none.value;
    } else if (revision == null || revision == StreamRevision.empty) {
      stream.start = Empty();
    } else if (revision == StreamRevision.none) {
      stream.end = Empty();
    } else {
      stream.revision = revision!.value;
    }
    return stream;
  }

  StreamIdentifier toStreamIdentifier({bool meta = false}) {
    return (StreamIdentifier()
      ..streamName = utf8.encode(
        meta ? SystemStreams.metaStreamOf(name) : name,
      ));
  }

  AppendReq toAppendReq() {
    return _toAppendReq(meta: false);
  }

  AppendReq toAppendMetaReq() {
    return _toAppendReq(meta: true);
  }

  AppendReq _toAppendReq({required bool meta}) {
    final options = AppendReq_Options()
      ..streamIdentifier = toStreamIdentifier(meta: meta);

    if (revision != null && revision != StreamRevision.none) {
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

  BatchAppendReq_Options toBatchAppendReqOptions() {
    final options = BatchAppendReq_Options()
      ..streamIdentifier = toStreamIdentifier(meta: false);

    if (revision != null && revision != StreamRevision.none) {
      options.streamPosition = revision!.value;
    } else {
      switch (type) {
        case StreamStateType.any:
          options.any = $g.Empty();
          break;
        case StreamStateType.no_stream:
          options.noStream = $g.Empty();
          break;
        case StreamStateType.stream_exists:
          options.streamExists = $g.Empty();
          break;
      }
    }
    return options;
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

  StreamState toAny() => StreamState.any(name);
  StreamState toExists() => StreamState.exists(name);
  StreamState toNoStream() => StreamState.noStream(name);
  StreamState toRevision(int revision) => StreamState(name,
      StreamStateType.stream_exists, null, StreamRevision.checked(revision));
}
