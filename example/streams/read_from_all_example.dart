import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  // Create a client instance
  final client = EventStoreStreamsClient(
    EventStoreClientSettings.parse('esdb://localhost:2113?tls=false'),
  );

  // Fetch all events in EventStore
  final result = await client.readFromAll(
    forward: true,
    resolveLinks: true,
    position: LogPosition.start,
  );

  // Only print if read was successful
  if (result.isOK) {
    await for (var event in result.stream) {
      print(event);
    }
  }
}
