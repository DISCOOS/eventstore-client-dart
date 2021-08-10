import 'package:eventstore_client_dart/eventstore_client_dart.dart';

void main() async {
  // Create a client instance
  final client = EventStoreClient(
    EventStoreClientSettings.parse(
      'esdb://127.0.0.1:2113',
    ),
  );

  // Fetch all events in EventStore
  final result = await client.readFromAll(
    LogPosition.start,
    forward: true,
    resolveLinks: true,
  );
  if (result.isOK) {
    await for (var event in result.stream) {
      print(event);
    }
  }
}
