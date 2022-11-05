A community developed gRPC client library for EventStoreDB.

[![Pub](https://img.shields.io/pub/v/eventstore_client.svg)](https://pub.dev/packages/eventstore_client)
[![Dart](https://github.com/DISCOOS/eventstore-client-dart/actions/workflows/dart.yml/badge.svg)](https://github.com/DISCOOS/eventstore-client-dart/actions/workflows/dart.yml)
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
and published the [API reference](https://pub.dev/documentation/eventstore_client/latest).
For additional documentation about general usage, see the 
[official documentation for gRPC clients](https://developers.eventstore.com/clients/grpc/getting-started)
on [eventstore.com](https://developers.eventstore.com).

### Note on gRPC-web support
[EventStoreDB](https://github.com/EventStore/EventStore) does not support the 
[gRPC-web protocol](https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-WEB.md) 
directly ([in-process proxy](https://github.com/grpc/grpc-web/blob/master/doc/in-process-proxy.md)). 
The EventStore team could add in-process proxy support using [Grpc.AspNetCore.Web](https://www.nuget.org/packages/Grpc.AspNetCore.Web), 
but I doubt they will prioritize this because gRCP-web have limited streaming support (details below). 
If you plan to connect directly to EventStoreDB from a browser, you need to configure a gRCP-web proxy in 
front of EventStoreDB, that translates between [native gRPC](https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-HTTP2.md) 
and gRPC-web protocols automatically (see official [Google implementation of grpc-web](https://github.com/grpc/grpc-web)).

#### IMPORTANT! 
gRPC-web have [limited streaming support](https://github.com/grpc/grpc-web#streaming-support). 
Especially bidirectional streams (both RPC requests and responses are sent and received using streams) which 
EventStoreDB use for `Append`-operations, are not supported by the gRPC-web protocol. When browser-support 
for [Streams](https://streams.spec.whatwg.org/) is high enough ([see global coverage](https://caniuse.com/streams)), 
the gRCP-web protocol will become optional and web clients will also be able to use the native gRPC protocol.

The following EventStore commands are not supported in the browser as
a consequence of these limitations:

```protobuf
// persistent.proto
service PersistentSubscriptions {
  // Client streaming of requests is not supported by grpc-web
  rpc Read (stream ReadReq) returns (stream ReadResp);
}

// streams.proto
service Streams {
  // Client streaming of requests is not supported by grpc-web
  rpc Append (stream AppendReq) returns (AppendResp);
  // Client streaming of requests is not supported by grpc-web
  rpc BatchAppend (stream BatchAppendReq) returns (stream BatchAppendResp);
}
```


#### Choices if you need web-support
You have two principally different options to choose from when connecting to EventStoreDB from a browser with 
EventStore client.

If you only need to read events, then one of these options is sufficient
1. use Envoy as [bridge](tool/grpc/bridge/README.md) between gprc-web and native grpc protocols (official Google solution)
3. implement an [in-process proxy](https://github.com/grpc/grpc-web/blob/master/doc/in-process-proxy.md)
  in EventStoreDB yourself

If you also need to support appending events from the browser, then you need to make a custom gRPC server between 
the gRCP-web proxy (Envoy or in-process) and EventStoreDB. This custom gRPC server must translate the bi-directional 
`Append` command exposed by EventStoreDB to a command exposed by the custom gRCP server that is supported by the 
gRPC-web protocol. You could do this by implementing an `Append` command with an unary request (all events in one 
request) that returns a stream of responses (same as the `Append` command exposed by EventStoreDB does). 
This command _is_ supported by gRCP-web and _should work_ (in theory, I have not tested it myself). 

**My advice**

If you need `Append`-support from the browser, I think the better solution is to wait for the official support 
of [native gRPC](https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-HTTP2.md) that
use [Streams](https://streams.spec.whatwg.org/). I don't know when this will happen, but 
the [global coverage](https://caniuse.com/streams) is already high. See the
[roadmap for full streaming support](https://github.com/grpc/grpc-web/blob/master/doc/streaming-roadmap.md) 
for official information about web-support.

### Multi-platform coding tips
When working with Dart code that only runs on specific platforms, you need organize the 
code such that it only loads on these platforms. You can do this by organizing platform 
specific code in files that are conditionally imported and exported. 
See [constants.dart](lib/src/core/constants.dart) for a simple example and 
[client.dart](lib/src/core/client.dart) for a more complicated one. Both operate using 
the following principle:
```dart
// my_library.dart

// Conditional usage based on dart:html support
// NOTE: Conditional could be any other core dart feature
// IMPORTANT! The actual code in each library must have the 
// same contract for this to work. E.g same constant, field, 
// function, class or mixin name that this file uses. 
import 'dep_io.dart' if(dart.library.html) 'dep_web.dart';

// Conditional export of elements in dep_io.dart and dep_web.dart
// NOTE: This is only needed if consumers of my_library need to 
// use any elements in dep_io.dart and dep_web.dart 
// (invoke, create instance, subclass or override).
export 'dep_io.dart' if(dart.library.html) 'dep_web.dart';

// Some code that depends on 'Dep' class with same public 
// interface in both dep_io.dart and dep_web.dart
class MyLibrary extends Dep{}

```

We have used this method to conditionally set 
* the `MAX` constant to safe maximum values (2^53-1 for js, 2^64-1 for all others)
* set [EventStoreClientBase.isGrpcWeb](lib/src/core/client_base.dart) - used to gracefully fail unsupported operations
* add guards that prevents use of EventStore commands that is unsupported on web

## Features and bugs

This package is in active development and breaking changes should still be expected. It currently
supports the following EventStoreDB client APIs:

* ✅   Streams API
* ✅   Projections Management API
* ✅   Persistent Subscriptions Management API
* ✅   Gossip API (open source version of EventstoreDB)
* ✅ User Management API
* ✅ Operations API
* ✅ Monitoring API (statistics only from v21.x)

We are working on the following APIs:

* ⏱ Elections API

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DISCOOS/eventstore-client-dart/issues/new

## Community
There is a community discussion space at [Event Store Discuss](https://discuss.eventstore.com).
If you prefer Discord, there is also an [#event-store-db](https://discord.com/channels/514783899440775168/762672037113757746) 
channel. [Click to join](https://discord.gg/7TfNjdckcY) the community and start asking questions. The maintainers of this community 
developed client will do their best to answer any questions in both these channels.

## Contributing
Development is done on the `master` branch. As for the official clients, we also
attempt to do our best to ensure that the history remains clean and to do so, we generally
ask contributors to squash their commits into a set or single logical commit.
For additional information about contributing, see [CONTRIBUTION.md][contributing].

[contributing]: https://github.com/DISCOOS/eventstore-client-dart/blob/master/CONTRIBUTION.md