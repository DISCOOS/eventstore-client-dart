import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  // Create a client instance
  final client = EventStoreClient(
    EventStoreClientSettings.parse('<your value>'),
  );

  final onEvent = (SubscriptionResolvedEvent event) async {
    print(event.resolved);
  };

  // Catchup to events in given stream with callback
  await client.subscribeToStream(
    'some-stream-id',
    resolveLinks: true,
    eventAppeared: onEvent,
    position: StreamPosition.start,
  );
}
