import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  var position = LogPosition.start;
  final controller = StreamController<ResolvedEvent>();

  // Create a client instance
  final client = EventStoreStreamsClient(
    EventStoreClientSettings.parse('<your value>'),
  );

  // Catchup with to events matching given filter
  await subscribe(client, position, controller.sink);
}

Future<void> subscribe(
  EventStoreStreamsClient client,
  LogPosition position,
  StreamSink<ResolvedEvent> sink,
) async {
  final result = await client.subscribeToAll(
    resolveLinks: true,
    position: position,
    // Subscribe again if possible
    onSubscriptionDropped: (
      EventStreamSubscription _,
      SubscriptionDroppedEvent event,
    ) {
      if (event.isDisposed && !event.isDeleted) {
        subscribe(client, position, sink);
      }
      return Future<void>.value();
    },
    filterOptions: SubscriptionFilterOptions.excludeSystemEvents(
      // Keep track of position in $all stream to prevent replay
      checkpointReached: (SubscriptionCheckPoint checkPoint) async {
        position = checkPoint.position;
      },
    ),
  );

  if (result.isOK) {
    await sink.addStream(
      result.stream,
    );
  }

  return sink.done;
}
