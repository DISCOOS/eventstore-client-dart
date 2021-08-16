import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/uuid.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:universal_io/io.dart';

void main() {
  group('Gossip based endpoint discoverer', () {
    const GossipSeed = EndPoint('localhost', 443);

    test('should discover leader from gossip seed', () async {
      // Arrange
      final endPoint = EndPoint(InternetAddress.anyIPv4.host, 4444);
      final clusterInfo = ClusterInfo([_createMemberInfo(endPoint)]);
      final settings = _createSettings(GossipSeed, maxAttempts: 1);
      final client = GossipClientMock(settings, () => clusterInfo);
      final discoverer = GossipBasedEndpointDiscoverer(client);

      // Act
      final result = await discoverer.discover();

      // Assert
      expect(result, endPoint);
    });

    test('should discover leader from gossip seed twice', () async {
      // Arrange
      final endPoint1 = EndPoint(InternetAddress.anyIPv4.host, 1111);
      final endPoint2 = EndPoint(InternetAddress.anyIPv4.host, 2222);
      final clusterInfo1 = ClusterInfo([
        _createMemberInfo(endPoint1, state: VNodeState.leader),
        _createMemberInfo(endPoint2, state: VNodeState.follower),
      ]);
      final clusterInfo2 = ClusterInfo([
        _createMemberInfo(endPoint1, state: VNodeState.leader, isAlive: false),
        _createMemberInfo(endPoint2, state: VNodeState.leader),
      ]);
      final settings = _createSettings(GossipSeed, maxAttempts: 1);

      // Act
      var index = -1;
      final discoverer = GossipBasedEndpointDiscoverer(
        GossipClientMock(settings, () {
          final infos = [clusterInfo1, clusterInfo2];
          final info = infos[++index % infos.length];
          return info;
        }),
      );
      final result1 = await discoverer.discover();
      final result2 = await discoverer.discover();

      // Assert
      expect(result1, endPoint1);
      expect(result2, endPoint2);
    });

    test('should not exceed max discovery attempts', () async {
      // Arrange
      const MaxDiscoveryAttempts = 5;
      final settings = _createSettings(
        GossipSeed,
        maxAttempts: MaxDiscoveryAttempts,
      );
      final client = GossipClientMock(settings, () => throw Exception());
      final discoverer = GossipBasedEndpointDiscoverer(client);

      // Act
      final result = discoverer.discover();

      // Assert
      await expectLater(
        result,
        throwsA(isA<DiscoveryException>().having(
          (e) => e.maxDiscoverAttempts,
          'Should contain maxDiscoveryAttempts=$MaxDiscoveryAttempts',
          MaxDiscoveryAttempts,
        )),
      );
    });

    test('should not pick nodes in invalid states', () async {
      // Arrange
      const InvalidStates = [
        VNodeState.manager,
        VNodeState.shutting_down,
        VNodeState.shutdown,
        VNodeState.unknown,
        VNodeState.initializing,
        VNodeState.catching_up,
        VNodeState.resigning_leader,
        VNodeState.shutting_down,
        VNodeState.pre_leader,
        VNodeState.pre_replica,
        VNodeState.pre_read_only_replica,
        VNodeState.clone,
        VNodeState.discover_leader
      ];
      const MaxDiscoveryAttempts = 5;
      final endPoint = EndPoint(InternetAddress.anyIPv4.host, 4444);
      final settings = _createSettings(
        GossipSeed,
        maxAttempts: MaxDiscoveryAttempts,
      );
      final clusterInfo = ClusterInfo(
        InvalidStates.map((state) => _createMemberInfo(
              endPoint,
              state: state,
            )),
      );
      final client = GossipClientMock(settings, () => clusterInfo);
      final discoverer = GossipBasedEndpointDiscoverer(client);

      // Act
      final result = discoverer.discover();

      // Assert
      await expectLater(
        result,
        throwsA(isA<DiscoveryException>().having(
          (e) => e.maxDiscoverAttempts,
          'Should contain maxDiscoveryAttempts=$MaxDiscoveryAttempts',
          MaxDiscoveryAttempts,
        )),
      );
    });

    test('should pick node based on preference', () async {
      // Arrange
      const Tests = <VNodeState, NodePreference>{
        VNodeState.leader: NodePreference.leader,
        VNodeState.follower: NodePreference.follower,
        VNodeState.read_only_replica: NodePreference.read_only_replica,
        VNodeState.read_only_leaderless: NodePreference.read_only_replica,
      };
      const Always = [
        VNodeState.leader,
        VNodeState.manager,
        VNodeState.follower,
      ];

      for (var test in Tests.entries) {
        await _testShouldPickNodeBasedOnPreference(
          GossipSeed,
          Always,
          test.key,
          test.value,
        );
      }
    });

    test('falls back to first alive node if preferred is not found', () async {
      // Arrange
      final endPoint1 = EndPoint(InternetAddress.anyIPv4.host, 1111);
      final endPoint2 = EndPoint(InternetAddress.anyIPv4.host, 2222);
      final clusterInfo = ClusterInfo([
        _createMemberInfo(endPoint1, state: VNodeState.leader, isAlive: false),
        _createMemberInfo(endPoint2, state: VNodeState.follower, isAlive: true),
      ]);
      final settings = _createSettings(GossipSeed, maxAttempts: 1);
      final discoverer = GossipBasedEndpointDiscoverer(
        GossipClientMock(settings, () => clusterInfo),
      );

      // Act
      final result = await discoverer.discover();

      // Assert
      expect(result, endPoint2);
    });
  });
}

Future<void> _testShouldPickNodeBasedOnPreference(
  EndPoint gossipSeed,
  List<VNodeState> always,
  VNodeState expected,
  NodePreference preference,
) async {
  // Arrange
  var i = 0;
  final states = <VNodeState>[
    ...always,
    always.contains(expected) ? VNodeState.read_only_replica : expected
  ];
  final settings = _createSettings(
    gossipSeed,
    preference: preference,
  );
  final clusterInfo = ClusterInfo(states.map(
    (state) => _createMemberInfo(
      EndPoint(InternetAddress.anyIPv4.host, 1111 * (++i)),
      state: state,
    ),
  ));
  final member = clusterInfo.members.lastWhere(
    (m) => m.state == expected,
  );
  final client = GossipClientMock(settings, () => clusterInfo);
  final discoverer = GossipBasedEndpointDiscoverer(client);

  // Act
  final actual = await discoverer.discover();

  // Assert
  expect(actual, member.endPoint);
}

MemberInfo _createMemberInfo(
  EndPoint endPoint, {
  bool isAlive = true,
  VNodeState state = VNodeState.leader,
}) {
  return MemberInfo(
    state: state,
    isAlive: isAlive,
    endPoint: endPoint,
    uuid: UuidV4.newUuid().value,
  );
}

EventStoreClientSettings _createSettings(
  EndPoint GossipSeed, {
  int maxAttempts = 1,
  NodePreference preference = NodePreference.leader,
}) {
  return EventStoreClientSettings(
    useTls: false,
    gossipSeeds: [GossipSeed],
    nodePreference: preference,
    discoveryInterval: Duration.zero,
    maxDiscoverAttempts: maxAttempts,
    gossipTimeout: Defaults.InfiniteDuration,
  );
}

class GossipClientMock extends Fake implements EventStoreGossipClient {
  GossipClientMock(
    this.settings,
    this.clusterInfo,
  );
  final ClusterInfo Function() clusterInfo;

  @override
  final EventStoreClientSettings settings;

  @override
  Future<ClusterInfo> read(EndPoint endPoint) async {
    return clusterInfo();
  }
}
