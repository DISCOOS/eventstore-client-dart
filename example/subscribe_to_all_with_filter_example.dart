import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  // Create a client instance
  final client = EventStoreClient(
    EventStoreClientSettings.parse('<your value>'),
  );

  // Catchup with to events matching given filter
  final result = await client.subscribeToAll(
    resolveLinks: true,
    position: LogPosition.start,
    filterOptions: SubscriptionFilterOptions.excludeSystemEvents(),
  );

  if (result.isOK) {
    await for (var event in result.stream) {
      print(event);
    }
  }
}
