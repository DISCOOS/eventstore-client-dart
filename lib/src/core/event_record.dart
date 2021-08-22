import 'dart:collection';

import 'package:eventstore_client/src/core/constants.dart';
import 'package:uuid/uuid.dart';

import 'log_position.dart';
import 'helpers.dart';
import 'stream_position.dart';

/// Represents a previously written event.
class EventRecord {
  /// Constructs a new [EventRecord].
  EventRecord(
    this.eventStreamId,
    this.eventId,
    this.eventNumber,
    this.position,
    List<int> data,
    List<int> customMetadata,
    Map<String, String> metadata,
  )   : data = UnmodifiableListView(data),
        metadata = UnmodifiableListView(customMetadata),
        created = fromTicksSinceEpoch(
          int.parse(metadata[Metadata.Created]!),
        ),
        eventType = metadata[Metadata.Type] as String,
        contentType = metadata[Metadata.ContentType] as String;

  /// The stream that this event belongs to.
  final String eventStreamId;

  /// The [UuidValue] representing this event.
  final UuidValue eventId;

  /// The type of event this is.
  final String eventType;

  /// The [StreamPosition] of this event in the stream.
  final StreamPosition eventNumber;

  /// The Content-Type of the event's data.
  final String contentType;

  /// The raw bytes representing the data of this event.
  final UnmodifiableListView<int> data;

  /// The raw bytes representing the metadata of this event.
  final UnmodifiableListView<int> metadata;

  /// A UTC [DateTime] representing when this event was created in the system.
  final DateTime created;

  /// The [LogPosition]  o this event in the $all stream.
  final LogPosition position;

  /// Check if [contentType] is [ContentTypes.ApplicationJson]
  bool get isJson => contentType == ContentTypes.ApplicationJson;

  /// Check if [contentType] is [ContentTypes.ApplicationOctetStream]
  bool get isOctetStream => contentType == ContentTypes.ApplicationOctetStream;

  @override
  String toString() {
    return '$runtimeType{eventStreamId: $eventStreamId, eventId: $eventId, '
        'eventType: $eventType, eventNumber: $eventNumber, contentType: $contentType, data: $data, metadata: $metadata, created: $created, position: $position}';
  }
}
