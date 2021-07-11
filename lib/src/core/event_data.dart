import 'dart:collection';

import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

import 'constants.dart';

/// Represents an event to be written to a stream
class EventData {
  /// Constructs a new [EventData] instance.
  /// <param name="eventId">The <see cref="Uuid"/> of the event, used as part of the idempotent write check.</param>
  /// <param name="type">The name of the event type. It is strongly recommended that these use lowerCamelCase if projections are to be used.</param>
  /// <param name="data">The raw bytes of the event data.</param>
  /// <param name="metadata">The raw bytes of the event metadata.</param>
  /// <param name="contentType">The Content-Type of the <see cref="Data"/>. Valid values are 'application/json' and 'application/octet-stream'.</param>
  /// <exception cref="ArgumentOutOfRangeException"></exception>
  EventData({
    required String uuid,
    required this.type,
    required Iterable<int> data,
    Iterable<int> metadata = const [],
    this.contentType = ContentTypes.ApplicationJson,
  })  : _uuid = uuid,
        data = UnmodifiableListView(data),
        metadata = UnmodifiableListView(metadata) {
    if (uuid.isEmpty) {
      throw GrpcError.invalidArgument(
        "Member 'uuid' can not be empty",
      );
    }

    if (contentType != ContentTypes.ApplicationJson &&
        contentType != ContentTypes.ApplicationOctetStream) {
      throw GrpcError.invalidArgument(
        'Only ${ContentTypes.ApplicationJson} or '
        '${ContentTypes.ApplicationOctetStream} are acceptable values.',
      );
    }
  }

  /// The [UuidValue] of the event, used as part of the idempotent write check.
  UuidValue get uuid => UuidValue(_uuid);
  final String _uuid;

  /// The name of the event type.
  /// It is strongly recommended that these
  /// use lowerCamelCase if projections are to be used.
  final String type;

  /// The raw bytes of the event data.
  final UnmodifiableListView<int> data;

  /// The Content-Type of [data].
  /// Valid values are 'application/json' and 'application/octet-stream'.
  final String contentType;

  /// The raw bytes of the event metadata.
  final UnmodifiableListView<int> metadata;
}
