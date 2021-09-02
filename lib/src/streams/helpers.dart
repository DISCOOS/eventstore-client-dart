import 'dart:convert';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';
import 'package:eventstore_client/src/generated/streams.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

ResolvedEvent convertToResolvedEvent(ReadResp_ReadEvent readEvent) {
  return ResolvedEvent(
      convertToEventRecord(readEvent.event),
      readEvent.hasLink() ? convertToEventRecord(readEvent.link) : null,
      readEvent.hasCommitPosition() ? readEvent.commitPosition : null);
}

EventRecord convertToEventRecord(ReadResp_ReadEvent_RecordedEvent event) {
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

ReadReq toReadAllReq(
  LogPosition position, {
  int? count,
  bool forward = true,
  bool resolveLinks = true,
}) {
  if (count != null && count <= 0) {
    throw ArgumentOutOfRangeException.fromCause(
        GrpcError.outOfRange('count must be greater than zero'));
  }
  final options = ReadReq_Options()
    ..noFilter = Empty()
    ..resolveLinks = resolveLinks
    ..all = toAllOptions(position)
    ..readDirection = forward
        ? ReadReq_Options_ReadDirection.Forwards
        : ReadReq_Options_ReadDirection.Backwards
    // Same as long.MaxValue in csharp; 9,223,372,036,854,775,807
    ..count = count == null ? Int64.MAX_VALUE : Int64(count)
    // returns uuids as strings
    ..uuidOption = (ReadReq_Options_UUIDOption()..string = Empty());

  return ReadReq()..options = options;
}

ReadReq_Options_AllOptions toAllOptions(LogPosition position) {
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
