A client library for EventStoreDB 20.x and above

## Getting started
* Create a cluster in [EventStore Cloud](https://developers.eventstore.com/cloud/intro/) (or [deploy your own](https://developers.eventstore.com/server/v21.6/docs/installation/#quick-start-preview))
* Create an appropriate [connection string](https://developers.eventstore.com/clients/grpc/getting-started/#connection-details)
* Create an instance of EventStoreClient with given connection string

A simple usage example of reading from a _self-hosted single-node_:

```dart
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

  // Only print if read was successful
  if (result.isOK) {
    await for (var event in result.stream) {
      print(event);
    }
  }
}
```


## Features and bugs

This package supports the following EventStoreDB client APIs

- [x] Streams gRPC API
- [ ] Projections Management gRPC API
- [ ] Persistent Subscriptions Management gRPC API
- [x] Gossip gRPC API (open source version of EventstoreDB)
- [ ] Cluster Management gRPC API (commercial version of EventstoreDB)
- [ ] Operations gRPC API
- [ ] Monitoring gRPC API
- [ ] User Management gRPC API

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DISCOOS/eventstore-client-dart/issues/new
