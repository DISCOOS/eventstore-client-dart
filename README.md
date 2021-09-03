A community developed gRPC client library for EventStoreDB.

[![Pub](https://img.shields.io/pub/v/eventstore_client.svg)](https://pub.dev/packages/eventstore_client)
[![Dart](https://github.com/DISCOOS/eventstore-client-dart/actions/workflows/test.yml/badge.svg)](https://github.com/DISCOOS/eventstore-client-dart/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/DISCOOS/eventstore-client-dart/branch/master/graph/badge.svg?token=HAHS8DUBHM)](https://codecov.io/gh/DISCOOS/eventstore-client-dart)

EventStoreDB is an open-source, functional database with Complex Event Processing
capabilities. Documentation for EventStoreDB can be [found here](https://eventstore.com/docs).

This package is still in active development and not yet reached a stable version. 
You should expect breaking changes that will require refactoring both code and behaviors
of code depending on this package. When stable 1.0.0 is released, we pledge to keep the 
package backwards compatible within each major version. 

## Getting started
* Create a cluster in [EventStore Cloud](https://developers.eventstore.com/cloud/intro/) (or [deploy your own](https://developers.eventstore.com/server/v21.6/docs/installation/#quick-start-preview))
* Create an appropriate [connection string](https://developers.eventstore.com/clients/grpc/getting-started/#connection-details)
* Create an instance of EventStoreStreamsClient with given connection string

A simple usage example of reading from a _self-hosted single-node_:

```dart
import 'package:eventstore_client/eventstore_client.dart';

void main() async {
  // Create a client instance
  final client = EventStoreStreamsClient(
    EventStoreClientSettings.parse(
      'esdb://127.0.0.1:2113',
    ),
  );

  // Fetch all events in EventStore
  final result = await client.readFromAll(
    forward: true,
    resolveLinks: true,
    position: LogPosition.start,
  );

  // Only print if read was successful
  if (result.isOK) {
    await for (var event in result.stream) {
      print(event);
    }
  }
}
```

## Usage and documentation
This client is not yet properly documented, but we have made [some example usages](example/README.md), 
and publish the [API reference](https://pub.dev/documentation/eventstore_client/latest). 
For additional documentation about general usage, see the [official documentation for gRPC clients](https://developers.eventstore.com/clients/grpc/getting-started) 
on [eventstore.com](https://developers.eventstore.com).

## Features and bugs

This package is in active development and breaking changes should still be expected. It currently 
supports the following EventStoreDB client APIs:

* :white_check_mark:  Streams API
* :white_check_mark:  Projections Management API
* :white_check_mark:  Persistent Subscriptions Management API
* :white_check_mark:  Gossip API (open source version of EventstoreDB)

We are working on the following APIs:
* :stopwatch:  User Management API

The following APIs are planned for implementation in prioritized order: 
* :one:  Operations API
* :two:  Monitoring API
* :three:  Cluster Management API (commercial version of EventstoreDB) 

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DISCOOS/eventstore-client-dart/issues/new

## Community
There is a community discussion space at [Event Store Discuss](https://discuss.eventstore.com). 
If you prefer slack, there is also an #eventstore channel in the [DDD-CQRS-ES](https://j.mp/ddd-es-cqrs) 
slack community. The maintainers of this community developed client will do their 
best to answer any questions in both these channels.

## Contributing
Development is done on the `master` branch. As for the official clients, we also 
attempt to do our best to ensure that the history remains clean and to do so, we generally 
ask contributors to squash their commits into a set or single logical commit. 
For additional information about contributing, see [CONTRIBUTION.md][contributing].

[contributing]: https://github.com/DISCOOS/eventstore-client-dart/blob/master/CONTRIBUTION.md