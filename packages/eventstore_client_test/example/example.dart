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
      EventStoreClientSettings.parse('esdb://127.0.0.1:2113'),
    );
    return server.start();
  });

  tearDownAll(() async {
    await client.shutdown();
    await server.stop();
  });

  test('test client', () {
    // TODO: Add test using client
  });
}
