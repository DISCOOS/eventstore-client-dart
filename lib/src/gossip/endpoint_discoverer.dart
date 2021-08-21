import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/cluster/cluster_info.dart';
import 'package:eventstore_client_dart/src/core/helpers.dart';
import 'package:eventstore_client_dart/src/core/endpoint.dart';
import 'package:eventstore_client_dart/src/core/endpoint_discoverer.dart';
import 'package:eventstore_client_dart/src/cluster/enums.dart';
import 'package:eventstore_client_dart/src/core/settings.dart';

import 'gossip_client.dart';

class GossipBasedEndpointDiscoverer extends EndpointDiscoverer {
  GossipBasedEndpointDiscoverer(
    EventStoreGossipClient client,
  ) : _client = client;

  static const List<VNodeState> NotAllowedStates = [
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
    VNodeState.discover_leader,
  ];

  final EventStoreGossipClient _client;

  ClusterInfo? _oldInfo;

  EventStoreClientSettings get _settings => _client.settings;

  @override
  Future<void> dispose() => _client.shutdown();

  @override
  Future<EndPoint> discover() async {
    for (var attempt = 1; attempt <= _settings.maxDiscoverAttempts; ++attempt) {
      try {
        final request = _discover();
        final endpoint = await (_settings.gossipTimeout.isInfinite
            ? request
            : request.timeout(
                _settings.gossipTimeout,
              ));
        if (endpoint != null) {
          return endpoint;
        }
      } on Exception {
        await Future<void>.delayed(
          _settings.discoveryInterval,
        );
      }
    }
    throw DiscoveryException(_settings.maxDiscoverAttempts);
  }

  Future<EndPoint?> _discover() async {
    final gossipCandidates = _oldInfo?.members.isNotEmpty == true
        ? _arrangeCandidates(_oldInfo?.members as List<MemberInfo>)
        : _getGossipCandidates(_settings.gossipSeeds);

    for (var candidate in gossipCandidates) {
      final info = await read(candidate);
      final bestNode = _tryDetermineBestNode(info);
      if (bestNode != null) {
        _oldInfo = info;
        return bestNode;
      }
    }
    return null;
  }

  /// Get [ClusterInfo] for given [EndPoint] candidate.
  Future<ClusterInfo> read(EndPoint candidate) async =>
      await _client.read(candidate);

  List<EndPoint> _arrangeCandidates(List<MemberInfo> members) {
    final result = <EndPoint?>[]..length = members.length;
    var i = -1;
    var j = members.length;
    for (var k = 0; k < members.length; ++k) {
      if (members[k].state == VNodeState.manager) {
        result[--j] = members[k].endPoint;
      } else {
        result[++i] = members[k].endPoint;
      }
    }
    result.shuffleEnds(i, j);
    return result.cast<EndPoint>();
  }

  List<EndPoint> _getGossipCandidates(List<EndPoint> gossipSeeds) {
    return gossipSeeds.toList()..shuffle();
  }

  EndPoint? _tryDetermineBestNode(ClusterInfo info) {
    final nodes = info.members
        .where((x) => x.isAlive)
        .where((x) => !NotAllowedStates.contains(x.state))
        .toList();

    // Shift leaders before followers
    nodes.shiftBy((node) => node.state != VNodeState.leader);

    switch (_settings.nodePreference) {
      case NodePreference.random:
        nodes.shuffle();
        break;
      case NodePreference.leader:
        nodes.shuffleDown((m) => m.state == VNodeState.leader);
        break;
      case NodePreference.follower:
        nodes.shuffleDown((m) => m.state == VNodeState.follower);
        break;
      case NodePreference.read_only_replica:
        nodes.shuffleDown(_isInReadOnlyState);
        break;
    }

    return nodes.isNotEmpty ? nodes.first.endPoint : null;
  }

  bool _isInReadOnlyState(MemberInfo node) =>
      node.state == VNodeState.read_only_leaderless ||
      node.state == VNodeState.read_only_replica;
}
