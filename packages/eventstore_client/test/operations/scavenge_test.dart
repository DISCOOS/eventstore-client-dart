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

    test('starts scavenging', () async {
      // Arrange
      final operationsClient = EventStoreOperationsClient(
        streamClient.settings,
      );

      // Act
      final result = await operationsClient.start(
        node: streamClient.leader,
      );

      // Assert
      expect(result.scavengeId, isNotEmpty);
      expect(result.state, ScavengeState.Started);
    });

    test(
      'stops scavenging',
      () async {
        // Arrange
        final operationsClient = EventStoreOperationsClient(
          streamClient.settings,
        );
        final operation = await operationsClient.start(
          node: streamClient.leader,
        );

        // Act
        final result = await operationsClient.stop(
          node: streamClient.leader,
          scavengeId: operation.scavengeId,
        );

        // Assert
        expect(result.scavengeId, isNotEmpty);
        expect(result.state, ScavengeState.Stopped);
      }, // This test throws an ScavengeNotFoundException because
      // scavenge  completes immediately on a empty eventstore.
      skip: true,
    );

    test('throws on stop with scavengeId not found', () async {
      // Arrange
      final operationsClient = EventStoreOperationsClient(
        streamClient.settings,
      );
      final operation = await operationsClient.start(
        node: streamClient.leader,
      );

      // Assert
      await expectLater(
        operationsClient.stop(
          node: streamClient.leader,
          scavengeId: operation.scavengeId,
        ),
        throwsA(isA<ScavengeNotFoundException>()),
      );
    });

    test('throws on start with threadCount < 1', () async {
      // Arrange
      final operationsClient = EventStoreOperationsClient(
        streamClient.settings,
      );

      // Assert
      expect(
        () => operationsClient.start(node: streamClient.leader, threadCount: 0),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
      expect(
        () =>
            operationsClient.start(node: streamClient.leader, threadCount: -1),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
    });

    test('throws on start with startFromChunk < 0', () async {
      // Arrange
      final operationsClient = EventStoreOperationsClient(
        streamClient.settings,
      );

      // Assert
      expect(
        () => operationsClient.start(
          node: streamClient.leader,
          startFromChunk: -1,
        ),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
    });
  });
}
