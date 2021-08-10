A client library for EventStoreDB 20.x and above

## Features
This package supports the following EventStoreDB client APIs  

- [x] Streams gRPC API
- [ ] Projections gRPC API
- [ ] Persistent Streams gRPC API
- [ ] Operations gRPC API
- [ ] Monitoring gRPC API
- [ ] Gossip gRPC API (open source version of EventstoreDB)
- [ ] Cluster gRPC API (commercial version of EventstoreDB)


## Usage

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

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DISCOOS/eventstore-client-dart/issues/new
