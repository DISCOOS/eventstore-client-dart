import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  // Create a client instance
  final client = EventStoreStreamsClient(
    EventStoreClientSettings.parse('<your value>'),
  );

  final onEvent = (EventStreamSubscription _, ResolvedEvent event) async {
    print(event);
  };

  // Catchup to all events in EventStore with callback
  await client.subscribeToAll(
    resolveLinks: true,
    onEventAppeared: onEvent,
    position: LogPosition.start,
  );
}
