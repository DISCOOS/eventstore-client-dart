# Client examples
These code examples are best practice usage of the client

## Connecting to EventStoreDB
The preferred way of configuring a client is by 
using a [connection string](https://developers.eventstore.com/clients/grpc/#connection-string). 
In most cases, you would need to configure a secure connection. The following example show how 
to create a [EventStoreStreamsClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStoreStreamsClient-class.html) 
with a connection string:

```dart
final settings = EventStoreClientSettings.parse('{connectionString}');
final streamsClient = EventStoreStreamsClient(settings);
```
The same pattern applies for all clients. These are examples of connection strings that all Dart clients support:
```dart
// Single node
EventStoreClientSettings.parse("esdb://localhost"); // with hostname only
EventStoreClientSettings.parse("esdb://localhost:2113"); // with hostname and port
EventStoreClientSettings.parse("esdb://user:pass@localhost:2113"); // with username and password
EventStoreClientSettings.parse("esdb://user:pass@localhost:2113/"); // extra forward slash also works
EventStoreClientSettings.parse("esdb://user:pass@localhost:2113?tlsVerifyCert=false"); // disables server certificate validation
EventStoreClientSettings.parse("esdb://user:pass@localhost:2113?tls=false"); // connects over http instead of https

// Cluster
EventStoreClientSettings.parse("esdb://host1,host2,host3"); // with hostnames only
EventStoreClientSettings.parse("esdb://host1:1234,host2:4321,host3:3231"); // with hostnames and port
EventStoreClientSettings.parse("esdb://user:pass@host1:1234,host2:4321,host3:3231?nodePreference=follower"); // with username and password
EventStoreClientSettings.parse("esdb://host1,host2,host3?tls=false"); // connects over http instead of https
EventStoreClientSettings.parse("esdb://host1,host2,host3?tlsVerifyCert=false"); // disables server certificate validation
```

The following clients are available
* [EventStoreStreamsClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStoreStreamsClient-class.html) - for working with streams
* [EventStoreProjectionsClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStoreProjectionsClient-class.html) - for working with projections
* [EventStorePersistentSubscriptionsClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStorePersistentSubscriptionsClient-class.html) - for working with persistent subscriptions
* [EventStoreGossipClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStoreGossipClient-class.html) - for inspecting server nodes using the gossip protocol
* [EventStoreUsersClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStoreUsersClient-class.html) - for working with internal users
* [EventStoreMonitoringClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStoreMonitoringClient-class.html) - for fetching statistics from nodes 


See official documentation for more information about 
[connections to EventStoreDB](https://developers.eventstore.com/clients/grpc/#connecting-to-eventstoredb).

## Working with Streams
The [EventStoreStreamsClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStoreStreamsClient-class.html) 
is the primary client for working with [streams in EventStoreDB](https://developers.eventstore.com/clients/grpc/appending-events/). 
The following examples show how you should use it:

* [Append to a stream](streams/append_to_stream_example.dart)
* [Read from $all stream](streams/read_from_all_example.dart)
* [Read from a stream](streams/read_from_stream_example.dart)
* [Subscribe to $all stream](streams/subscribe_to_all_example.dart)
* [Subscribe to $all with filter](streams/subscribe_to_all_with_filter_example.dart)
* [Subscribe to $all with callback](streams/subscribe_to_all_with_callback_example.dart)
* [Subscribe to $all with retry](streams/subscribe_to_all_with_retry_example.dart)
* [Subscribe to a stream](streams/subscribe_to_stream_example.dart)
* [Subscribe to a stream with callback](streams/subscribe_to_stream_with_callback_example.dart)

## Working with Projections
The [EventStoreProjectionsClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStoreProjectionsClient-class.html)
is the primary client for working with [projections in EventStoreDB](https://developers.eventstore.com/clients/grpc/projections). 
The following example show how you should use it:

* TDB

## Working with Persistent subscriptions
The [EventStorePersistentSubscriptionsClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStorePersistentSubscriptionsClient-class.html)
is the primary client for working with [persistent projections in EventStoreDB](https://developers.eventstore.com/clients/grpc/subscribing-to-streams/persistent-subscriptions.html). 
The following example show how you should use it:

* TDB
