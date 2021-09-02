import 'dart:convert';

import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  // Create a client instance
  final client = EventStoreStreamsClient(
    EventStoreClientSettings.parse('<your value>'),
  );

  final events = List.generate(
    10,
    (index) => EventData(
      type: 'some-event-type',
      data: utf8.encode('{"x":$index}'),
      uuid: UuidV4.newUuid().value.uuid,
      metadata: utf8.encode('{"y":$index}'),
    ),
  );

  // Append events to 'some-stream-id'
  await client.append(
    StreamState.any('some-stream-id'),
    Stream.fromIterable(events),
  );
}
