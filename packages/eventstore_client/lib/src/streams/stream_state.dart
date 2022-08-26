import 'dart:convert';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';
import 'package:eventstore_client/src/generated/streams.pb.dart';
import 'package:eventstore_client/src/generated/google/empty.pb.dart' as $g;
import 'package:eventstore_client/src/generated/google/duration.pb.dart' as $g;
import 'package:eventstore_client/src/generated/google/timestamp.pb.dart' as $g;
import 'package:eventstore_client/src/generated/streams.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';

class StreamState {
  const StreamState(
    this.streamId,
    this.type, {
    this.position,
    this.revision,
    this.first,
    this.last,
    this.lastAll,
  });

  /// Create [StreamState] with given [name] and [StreamStateType.no_stream]
  factory StreamState.noStream(String name) => StreamState(
        name,
        StreamStateType.no_stream,
        position: null,
        revision: StreamRevision.none,
      );

  /// Create [StreamState] with given [name] and [StreamStateType.any]
  factory StreamState.any(
    String name, {
    LogPosition? position,
    StreamRevision? revision,
  }) =>
      StreamState(
        name,
        StreamStateType.any,
        position: position,
        revision: revision,
      );

  /// Create [StreamState] with given [name] and [StreamStateType.stream_exists]
  factory StreamState.exists(
    String name, {
    LogPosition? position,
    StreamRevision? revision,
  }) =>
      StreamState(
        name,
        StreamStateType.stream_exists,
        position: position,
        revision: revision,
      );

  /// Create [StreamState] with [SystemStreams.AllStream] and [StreamStateType.stream_exists]
  factory StreamState.all(LogPosition? position) => StreamState(
        SystemStreams.AllStream,
        StreamStateType.stream_exists,
        position: position,
      );

  final String streamId;
  final StreamStateType type;

  /// Current stream log position
  final LogPosition? position;

  /// Current Stream revision
  final StreamRevision? revision;

  /// First Stream revision
  final StreamRevision? first;

  /// Last Stream revision
  final StreamRevision? last;

  /// Last $all Stream log position
  final LogPosition? lastAll;

  /// Check if [revision] exists and is not [StreamRevision.none]
  bool get hasRevision => revision != null && revision != StreamRevision.none;

  /// Get [StreamPosition] with optional offset from [revision].
  /// If revision is [StreamRevision.none], position returned is
  /// [StreamPosition.end]
  StreamPosition getStreamPosition([int? offset]) => StreamPosition.checked(
        (offset ?? 0) + (revision ?? StreamRevision.empty).value.toInt(),
      );

  /// Check if stream [streamId] is [SystemStreams.AllStream]
  bool get isAll => streamId == SystemStreams.AllStream;

  /// Check if StreamState [type] is [StreamStateType.any]
  bool get isAny => type == StreamStateType.any;

  /// Check if StreamState [type] is [StreamStateType.no_stream]
  bool get isNoStream => type == StreamStateType.no_stream;

  /// Check if StreamState [type] is [StreamStateType.stream_exists]
  bool get isStreamExists => type == StreamStateType.stream_exists;

  /// Construct [StreamState] from [AppendResp]
  StreamState fromAppendSuccess(AppendResp resp) {
    if (resp.hasSuccess()) {
      return StreamState(
        streamId,
        resp.success.hasNoStream()
            ? StreamStateType.no_stream
            : StreamStateType.stream_exists,
        position: LogPosition.checked(
          resp.success.position.commitPosition,
          resp.success.position.preparePosition,
        ),
        revision: resp.success.hasCurrentRevision()
            ? StreamRevision.fromInt64(resp.success.currentRevision)
            : StreamRevision.none,
      );
    }
    throw UnsupportedError('AppendResp $resp is unsupported');
  }

  /// Construct [StreamState] from [AppendResp]
  StreamState fromAppendWrongExpectedVersion(AppendResp resp) {
    if (resp.hasWrongExpectedVersion()) {
      return StreamState(
        streamId,
        resp.wrongExpectedVersion.hasCurrentNoStream()
            ? StreamStateType.no_stream
            : StreamStateType.stream_exists,
        position: null,
        revision: resp.wrongExpectedVersion.hasCurrentRevision()
            ? StreamRevision.fromInt64(
                resp.wrongExpectedVersion.currentRevision,
              )
            : StreamRevision.none,
      );
    }
    throw UnsupportedError('AppendResp $resp is unsupported');
  }

  /// Construct [StreamState] with [first] revision
  StreamState withFirstRevision(Int64 value) {
    return StreamState(
      streamId,
      StreamStateType.stream_exists,
      position: position,
      revision: revision,
      first: StreamRevision.fromInt64(value),
      last: last,
      lastAll: lastAll,
    );
  }

  /// Construct [StreamState] with [last] revision
  StreamState withLastRevision(Int64 value) {
    return StreamState(
      streamId,
      StreamStateType.stream_exists,
      position: position,
      revision: revision,
      first: first,
      last: StreamRevision.fromInt64(value),
      lastAll: lastAll,
    );
  }

  /// Construct [StreamState] with [lastAll] log position
  StreamState withLastAllPosition(Int64 commitPosition, Int64 preparePosition) {
    return StreamState(
      streamId,
      StreamStateType.stream_exists,
      position: position,
      revision: revision,
      first: first,
      last: last,
      lastAll: LogPosition.checked(commitPosition, preparePosition),
    );
  }

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
        meta ? SystemStreams.metaStreamOf(streamId) : streamId,
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

  BatchAppendReq_Options toBatchAppendReqOptions(EventStoreClientBase client) {
    final options = BatchAppendReq_Options()
      ..streamIdentifier = toStreamIdentifier(meta: false);

    if (client.settings.batchAppendDeadline != null) {
      final deadline = $g.Duration()
        ..seconds = Int64(client.settings.batchAppendDeadline!.inSeconds)
        ..nanos = 0;

      if (client.isFeatureSupported(ApiFeature.BatchAppendDeadline)) {
        options.deadline = deadline;
      } else {
        options.deadline21100 = $g.Timestamp(
          seconds: Int64(DateTime.now().millisecondsSinceEpoch ~/ 1000) +
              deadline.seconds,
          nanos: 0,
        );
      }
    }

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
          streamId == other.streamId &&
          type == other.type &&
          position == other.position &&
          revision == other.revision;

  @override
  int get hashCode =>
      streamId.hashCode ^ type.hashCode ^ position.hashCode ^ revision.hashCode;

  @override
  String toString() {
    return 'StreamState{name: $streamId, type: $type, position: $position, revision: $revision}';
  }

  StreamState toAny() => StreamState.any(streamId);
  StreamState toExists() => StreamState.exists(streamId);
  StreamState toNoStream() => StreamState.noStream(streamId);
  StreamState toRevision(int revision) => StreamState(
        streamId,
        StreamStateType.stream_exists,
        position: null,
        revision: StreamRevision.checked(revision),
      );
}
