import 'dart:convert';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/helpers.dart';
import 'package:eventstore_client/src/generated/persistent.pb.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart' show ChannelCredentials;
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

PersistentSubscriptionResolvedEvent convertToResolvedEvent(
  ReadResp_ReadEvent readEvent,
) {
  return PersistentSubscriptionResolvedEvent(
      convertToEventRecord(readEvent.event),
      readEvent.hasLink() ? convertToEventRecord(readEvent.link) : null,
      readEvent.hasCommitPosition() ? readEvent.commitPosition : null,
      readEvent.hasRetryCount() ? readEvent.retryCount : 0);
}

EventRecord convertToEventRecord(ReadResp_ReadEvent_RecordedEvent event) {
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

StreamIdentifier toStreamIdentifier(String streamId) {
  return (StreamIdentifier()..streamName = utf8.encode(streamId));
}

Future<void> replayParked(
  String streamId,
  String groupName,
  EndPoint endPoint, {
  int? stopAt,
  UserCredentials? userCredentials,
  required EventStoreClientSettings settings,
  required ChannelCredentials channelCredentials,
}) async {
  final client = settings.useTls
      ? HttpClient(context: toSecurityContext(settings))
      : HttpClient();
  final path = '${endPoint.toUri(settings.useTls)}'
      '/subscriptions/$streamId/$groupName/replayParked'
      '${stopAt != null ? '?stopAt=$stopAt' : ''}';
  final request = await client.postUrl(
    Uri.parse(path),
  );
  final credentials = userCredentials ?? settings.defaultCredentials;
  if (credentials != null) {
    request.headers.add(Headers.Authorization, credentials);
  }
  await request.close();
  client.close(force: true);
}

class PersistentSubscriptionResolvedEvent extends ResolvedEvent {
  PersistentSubscriptionResolvedEvent(
    EventRecord event,
    EventRecord? link,
    Int64? commitPosition,
    this.replayCount,
  ) : super(event, link, commitPosition);

  /// Number of times this message has been retried by server
  final int replayCount;
}
