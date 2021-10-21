A library with utilities for testing eventstore_client

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

## Features and bugs
Please file feature requests and bugs at the [issue tracker][tracker].

[package:eventstore_client]: https://pub.dev/packages/eventstore_client
[tracker]: https://github.com/DISCOOS/eventstore_client/issues
[example]: https://github.com/DISCOOS/eventstore_client/tree/master/example
