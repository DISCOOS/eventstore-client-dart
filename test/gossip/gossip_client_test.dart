import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('Gossip client', () {
    final GossipSeed = EndPoint(
      '127.0.0.1',
      EventStoreClientHarness.PORT_2113,
    );

    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(secure: true)
      ..install(
        secure: true,
        enableGossip: true,
      );

    late final EventStoreClient client;

    setUpAll(() {
      client = harness.client();
    });

    // ---------------------------------------
    // Test read operations
    // ---------------------------------------

    test('reads cluster info from end point', () async {
      // Arrange
      final gossipClient = EventStoreGossipClient(
        client.settings,
      );

      // Act
      final result = await gossipClient.read(GossipSeed);

      // Assert
      expect(result.members.length, 1);
      expect(result.members.first.isAlive, isTrue);
      expect(result.members.first.endPoint, GossipSeed);
      expect(result.members.first.state, VNodeState.leader);
    });

    test('discovers leader', () async {
      // Arrange
      final gossipClient = EventStoreGossipClient(
        client.settings,
      );

      // Act
      final leader = await gossipClient.discover();
      final info = await gossipClient.read(leader);

      // Assert
      expect(leader, GossipSeed);
      expect(leader, gossipClient.leader);
      expect(info.members.length, 1);
      expect(info.members.first.isAlive, isTrue);
      expect(info.members.first.endPoint, GossipSeed);
      expect(info.members.first.state, VNodeState.leader);
    });

    test('is used by event store client to discover leader', () async {
      // Arrange
      final gossipClient = EventStoreGossipClient(
        client.settings,
      );

      // Act
      final leader = await client.discover();
      final info = await gossipClient.read(leader);

      // Assert
      expect(leader, GossipSeed);
      expect(leader, gossipClient.leader);
      expect(info.members.length, 1);
      expect(info.members.first.isAlive, isTrue);
      expect(info.members.first.endPoint, GossipSeed);
      expect(info.members.first.state, VNodeState.leader);
    });
  });
}
