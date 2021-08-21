import 'package:fixnum/fixnum.dart';
import 'package:uuid/uuid.dart';

import 'event_record.dart';
import 'log_position.dart';
import 'stream_position.dart';

/// A structure representing a single event or a resolved link event.
class ResolvedEvent {
  /// Constructs a new [ResolvedEvent].
  ResolvedEvent(
    this.event,
    this.link,
    Int64? commitPosition,
  ) : originalPosition = commitPosition == null
            ? LogPosition.start
            : LogPosition.checked(
                commitPosition,
                (link ?? event).position.preparePosition,
              );

  /// If this [ResolvedEvent] represents a link event, the [event]
  /// will be the resolved link event, otherwise it will be the single event.
  final EventRecord event;

  /// The link event if this [ResolvedEvent] is a link event.
  final EventRecord? link;

  /// Indicates whether this [ResolvedEvent] is a resolved link event.
  bool get isResolved => link != null;

  /// Returns the event that was read or which triggered the subscription.
  ///
  /// If this [ResolvedEvent] represents a link event, the [originalEvent]
  /// will be the [link], otherwise it will be [event].
  EventRecord get originalEvent => link ?? event;

  /// [LogPosition] of the [originalEvent] if available.
  final LogPosition? originalPosition;

  /// The event id of the [originalEvent].
  UuidValue get originalEventId => originalEvent.eventId;

  /// The type of the [originalEvent].
  String get originalEventType => originalEvent.eventType;

  /// The stream name of the [originalEvent].
  String get originalStreamId => originalEvent.eventStreamId;

  /// The [StreamPosition] in the stream of the [originalEvent].
  StreamPosition get originalEventNumber => originalEvent.eventNumber;

  @override
  String toString() {
    return '$runtimeType{event: $event, link: $link, originalPosition: $originalPosition}';
  }
}
