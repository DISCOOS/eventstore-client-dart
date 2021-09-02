# Client examples
These code examples are best practice usage of the client

##Streams
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

##Projections
The [EventStoreProjectionsClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStoreProjectionsClient-class.html)
is the primary client for working with [projections in EventStoreDB](https://developers.eventstore.com/clients/grpc/projections). 
The following example show how you should use it:

* TDB

##Persistent subscriptions
The [EventStorePersistentSubscriptionsClient](https://pub.dev/documentation/eventstore_client/latest/eventstore_client/EventStorePersistentSubscriptionsClient-class.html)
is the primary client for working with [persistent projections in EventStoreDB](https://developers.eventstore.com/clients/grpc/subscribing-to-streams/persistent-subscriptions.html). 
The following example show how you should use it:

* TDB
