import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  // Create a client instance
  final client = EventStoreClient(
    EventStoreClientSettings.parse('<your value>'),
  );

  final onEvent = (SubscriptionResolvedEvent event) async {
    print(event.resolved);
  };

  // Catchup to all events in EventStore with callback
  await client.subscribeToAll(
    resolveLinks: true,
    eventAppeared: onEvent,
    position: LogPosition.start,
  );
}
