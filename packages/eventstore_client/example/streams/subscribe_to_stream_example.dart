import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  // Create a client instance
  final client = EventStoreStreamsClient(
    EventStoreClientSettings.parse('<your value>'),
  );

  // Catchup to events in given stream
  final result = await client.subscribe(
    'some-stream-id',
    resolveLinks: true,
    position: StreamPosition.start,
  );

  // Only print if read was successful
  if (result.isOK) {
    await for (var event in result.stream) {
      print(event);
    }
  }
}
