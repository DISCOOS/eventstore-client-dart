import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('When using EventStoreDB v20_LTS, operations client ', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(
        secure: true,
        settings: EventStoreClientSettings.V20_LTS,
        defaultCredentials: EventStoreClientHarness.DefaultCredentials,
      )
      ..install(
        EventStoreImage.V20_LTS,
        secure: true,
        timeoutAfter: null,
      );

    late final EventStoreStreamsClient streamClient;

    setUpAll(() {
      streamClient = harness.client();
    });

    // ---------------------------------------
    // Test stats operation
    // ---------------------------------------

    test('merge indexes', () async {
      // Arrange
      final operationsClient = EventStoreOperationsClient(
        streamClient.settings,
      );

      // Assert
      await operationsClient.mergeIndexes(
        node: streamClient.leader,
      );
    });

    test('restart persistent subscriptions', () async {
      // Arrange
      final operationsClient = EventStoreOperationsClient(
        streamClient.settings,
      );

      // Assert
      await operationsClient.restartPersistentSubscriptions(
        node: streamClient.leader,
      );
    });

    test('resign node', () async {
      // Arrange
      final operationsClient = EventStoreOperationsClient(
        streamClient.settings,
      );

      // Assert
      await operationsClient.resignNode(
        node: streamClient.leader,
      );
    });

    test('shutdown node', () async {
      // Arrange
      final operationsClient = EventStoreOperationsClient(
        streamClient.settings,
      );

      // Assert
      await operationsClient.shutdownNode(
        node: streamClient.leader,
      );
    });
  });
}
