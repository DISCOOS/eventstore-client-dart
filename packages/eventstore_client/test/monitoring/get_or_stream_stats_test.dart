import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('Monitoring client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(
        secure: true,
        settings: EventStoreClientSettings.V21_LTS,
        defaultCredentials: EventStoreClientHarness.DefaultCredentials,
      )
      ..install(
        EventStoreImage.V21_LTS,
        secure: true,
        environment: {
          'EVENTSTORE_STATS_PERIOD_SEC': '1',
        },
        timeoutAfter: null,
      );

    late final EventStoreStreamsClient streamClient;

    setUpAll(() {
      streamClient = harness.client();
    });

    // ---------------------------------------
    // Test stats operation
    // ---------------------------------------

    test('gets a single stats object', () async {
      // Arrange
      final usersClient = EventStoreMonitoringClient(
        streamClient.settings,
      );

      // Act
      final stats = await usersClient.getStats();

      // Assert
      expect(stats.isNotEmpty, true);
    });

    test('subscribes to a stream of stats objects', () async {
      // Arrange
      final usersClient = EventStoreMonitoringClient(
        streamClient.settings,
      );

      // Act
      final stats = await usersClient.subscribe(
        refreshTimePeriodInMs: 100,
      );

      // Assert
      expect(await stats.take(3).toList(), isNotEmpty);
    });
  });
}
