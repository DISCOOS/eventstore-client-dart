import 'package:eventstore_client/eventstore_client.dart';
import 'package:fixnum/fixnum.dart';

/// Event received by subscriptions if the stream is tombstoned (hard delete)
class StreamDeletedEvent extends ResolvedEvent {
  StreamDeletedEvent._(
    EventRecord event,
    EventRecord? link,
    Int64? commitPosition,
  ) : super(event, link, commitPosition);

  static final Position = StreamPosition.checked(Max);

  factory StreamDeletedEvent.from(ResolvedEvent event) {
    _verifyType(event, SystemEvents.StreamDeleted);
    return StreamDeletedEvent._(
      event.event,
      event.link,
      event.originalPosition?.commitPosition,
    );
  }
}

/// Event received by subscriptions if event is a link to another
class LinkToEvent extends ResolvedEvent {
  LinkToEvent._(
    EventRecord event,
    EventRecord? link,
    Int64? commitPosition,
  ) : super(event, link, commitPosition);

  factory LinkToEvent.from(ResolvedEvent event) {
    _verifyType(event, SystemEvents.LinkTo);
    return LinkToEvent._(
      event.event,
      event.link,
      event.originalPosition?.commitPosition,
    );
  }
}

/// Event received by subscriptions to metadata streams
class StreamMetadataEvent extends ResolvedEvent {
  StreamMetadataEvent._(
    EventRecord event,
    EventRecord? link,
    Int64? commitPosition,
  ) : super(event, link, commitPosition);

  factory StreamMetadataEvent.from(ResolvedEvent event) {
    _verifyType(event, SystemEvents.StreamMetadata);
    return StreamMetadataEvent._(
      event.event,
      event.link,
      event.originalPosition?.commitPosition,
    );
  }
}

/// Event received by subscriptions to system settings streams
class SettingsEvent extends ResolvedEvent {
  SettingsEvent._(
    EventRecord event,
    EventRecord? link,
    Int64? commitPosition,
  ) : super(event, link, commitPosition);

  factory SettingsEvent.from(ResolvedEvent event) {
    _verifyType(event, SystemEvents.Settings);
    return SettingsEvent._(
      event.event,
      event.link,
      event.originalPosition?.commitPosition,
    );
  }
}

/// Event received by subscriptions to system statistics stream
class StatsCollectionEvent extends ResolvedEvent {
  StatsCollectionEvent._(
    EventRecord event,
    EventRecord? link,
    Int64? commitPosition,
  ) : super(event, link, commitPosition);

  factory StatsCollectionEvent.from(ResolvedEvent event) {
    _verifyType(event, SystemEvents.StatsCollection);
    return StatsCollectionEvent._(
      event.event,
      event.link,
      event.originalPosition?.commitPosition,
    );
  }
}

void _verifyType(ResolvedEvent event, String type) {
  if (event.originalEventType != type) {
    throw ArgumentError.value(
      event,
      'event.originalEventType',
      "Expected type '$SystemEvents'",
    );
  }
}
