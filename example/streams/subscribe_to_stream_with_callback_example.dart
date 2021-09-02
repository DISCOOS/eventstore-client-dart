import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  // Create a client instance
  final client = EventStoreStreamsClient(
    EventStoreClientSettings.parse('<your value>'),
  );

  final onEvent = (EventStreamSubscription _, ResolvedEvent event) async {
    print(event);
  };

  // Catchup to events in given stream with callback
  await client.subscribe(
    'some-stream-id',
    resolveLinks: true,
    onEventAppeared: onEvent,
    position: StreamPosition.start,
  );
}
