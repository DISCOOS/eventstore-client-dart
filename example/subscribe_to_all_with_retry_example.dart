import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  var position = LogPosition.start;
  final controller = StreamController<ResolvedEvent>();

  // Create a client instance
  final client = EventStoreClient(
    EventStoreClientSettings.parse('<your value>'),
  );

  // Catchup with to events matching given filter
  await subscribe(client, position, controller.sink);
}

Future<void> subscribe(
  EventStoreClient client,
  LogPosition position,
  StreamSink<ResolvedEvent> sink,
) async {
  // Subscribe again if possible
  final onDropped = (SubscriptionDroppedEvent event) {
    if (event.isDisposed && !event.isDeleted) {
      subscribe(client, position, sink);
    }
    return Future<void>.value();
  };

  // Keep track of position in $all stream to prevent replay
  final onCheckpoint = (SubscriptionCheckPoint checkPoint) async {
    position = checkPoint.position;
  };

  final result = await client.subscribeToAll(
    resolveLinks: true,
    position: position,
    subscriptionDropped: onDropped,
    filterOptions: SubscriptionFilterOptions.excludeSystemEvents(
      checkpointReached: onCheckpoint,
    ),
  );

  if (result.isOK) {
    await sink.addStream(
      result.stream,
    );
  }

  return sink.done;
}
