A testing library for applications using 
[EventStore Client][package:eventstore_client] with a local EventStoreDB instance.

## Usage

A simple usage example setup for testing an event-sourced application:

```dart
import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

void main() {
  // Reusable test resources
  late EventStoreStreamsClient client;
  late EventStoreServerSingleNode server;

  setUpAll(() {
    server = EventStoreServerSingleNode();
    client = EventStoreStreamsClient(
      EventStoreClientSettings.parse('<your value>'),
    );
    return server.start();
  });

  tearDownAll(() async {
    await client.shutdown();
    await server.stop();
  });

  test('test application', () {
    // TODO: Add test using client
  });
}
```

If you want to run an application against a standalone EventStoreDB running locally, 
you can use the command-line tool `esdbtcli` provided by this package. Before you can 
use it, you need to active it with:

```bash
dart pub global activate eventstore_client_test 
```

For more information about usage, run
```bash
esdbtcli -h

A command-line tool for testing EventStoreDB locally

Usage: esdbtcli <command> [arguments]

Global options:
-h, --help            Print this usage information.
-v, --[no-]verbose    Prints more output.

Available commands:
  certs   Generates self-signed certificates for EventStoreDB
  start   Start a single EventStoreDB instance in docker
  stop    Stop a single EventStoreDB instance running in docker

Run "esdbtcli help <command>" for more information about a command.
```

**Note**

All test utilities for working with EventStoreDB instances assumes that docker is installed on your machine.


## Features and bugs
Please file feature requests and bugs at the [issue tracker][tracker].

[package:eventstore_client]: https://pub.dev/packages/eventstore_client
[tracker]: https://github.com/DISCOOS/eventstore_client/issues
