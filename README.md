[![Dart](https://github.com/DISCOOS/eventstore-client-dart/actions/workflows/dart.yml/badge.svg)](https://github.com/DISCOOS/eventstore-client-dart/actions/workflows/dart.yml)
[![codecov](https://codecov.io/gh/DISCOOS/eventstore-client-dart/branch/master/graph/badge.svg?token=HAHS8DUBHM)](https://codecov.io/gh/DISCOOS/eventstore-client-dart)

A mono-repo for [eventstore_client][eventstore_client] and associated packages for building event sourced applications.

## About

Dart package [eventstore_client][eventstore_client] is a community developed gRPC client library for EventStoreDB. EventStoreDB is an open-source, functional database with Complex Event Processing
capabilities. Documentation for EventStoreDB can be [found here](https://eventstore.com/docs).

**Authors**:
- [Kenneth Gulbrandsøy](https://medium.com/kengu)

## Usage and documentation
This mono-repo contains the following packages
* [EventStore Client Library](packages/eventstore_client/README.md) - used by application
* [EventStore Client Test Library](packages/eventstore_client/README.md) - used by developers to test application code


This client is not yet properly documented, but we have made [some example usages](packages/eventstore_client/example/README.md),
and publish the [API reference](https://pub.dev/documentation/eventstore_client/latest).
For additional documentation about general usage, see the [official documentation for gRPC clients](https://developers.eventstore.com/clients/grpc/getting-started)
on [eventstore.com](https://developers.eventstore.com).

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/DISCOOS/eventstore-client-dart/issues
[eventstore_client]: https://pub.dev/packages/eventstore_client