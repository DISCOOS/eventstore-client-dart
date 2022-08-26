import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('EventStore client', () {
    final Supported = 'supported';
    final Unsupported = 'unsupported';
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(
        connectionName: Supported,
        settings: EventStoreClientSettings.v20_LTS,
      )
      ..withClient(
        connectionName: Unsupported,
        settings: EventStoreClientSettings.v21_LTS,
      )
      ..install(
        EventStoreImage.v20_LTS,
      );

    // ---------------------------------------
    // Test append operations
    // ---------------------------------------

    test('updates server version on verify success', () async {
      // Arrange
      final client = harness.client(
        connectionName: Supported,
      );
      expect(client.api.server?.version, isNull);
      expect(client.settings.apiVersion, ApiVersions.v20_LTS);

      // Act
      await client.verify();

      // Assert
      expect(client.api.server?.version, ApiVersions.v20_LTS);
    });

    test('updates server version on verify failure', () async {
      // Arrange
      final client = harness.client(
        connectionName: Unsupported,
      );
      expect(client.api.server?.version, isNull);
      expect(client.settings.apiVersion, ApiVersions.v21_LTS);

      // Act
      await expectLater(
        client.verify(),
        throwsA(isA<UnsupportedApiVersionException>()),
      );

      // Assert
      expect(client.api.server?.version, ApiVersions.v20_LTS);
    });
  });
}
