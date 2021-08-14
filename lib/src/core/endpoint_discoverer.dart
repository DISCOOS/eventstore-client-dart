import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/helpers.dart';
import 'package:eventstore_client_dart/src/gossip/gossip_client.dart';

/// A base class for discovering an [EndPoint] used
/// to communicate with EventStoreDB.
abstract class EndpointDiscoverer {
  Future<EndPoint> discover();
  Future<void> dispose();
}

class SingleNodeEndpointDiscoverer extends EndpointDiscoverer {
  SingleNodeEndpointDiscoverer(this.uri);
  final Uri uri;

  @override
  Future<EndPoint> discover() {
    return Future.value(EndPoint(
      uri.host,
      uri.port == 0 ? Defaults.GrpcPort : uri.port,
    ));
  }

  @override
  Future<void> dispose() => Future.value();
}

class GossipBasedEndpointDiscoverer extends EndpointDiscoverer {
  GossipBasedEndpointDiscoverer(
    EventStoreGossipClient client,
  ) : _client = client;

  static const List<VNodeState> _notAllowedStates = [
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
        final endpoint = await _discover();
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
      final info = await _client.read(candidate);
      final bestNode = _tryDetermineBestNode(info);
      if (bestNode != null) {
        _oldInfo = info;
        return bestNode;
      }
    }
    return null;
  }

  List<EndPoint> _arrangeCandidates(List<MemberInfo> members) {
    final result = <EndPoint>[]..length = members.length;
    var i = -1;
    var j = members.length;
    for (var k = 0; k < members.length; ++k) {
      if (members[k].state == VNodeState.manager) {
        result[--j] = members[k].endPoint;
      } else {
        result[++i] = members[k].endPoint;
      }
    }
    return result..shuffleEnds(i, j);
  }

  List<EndPoint> _getGossipCandidates(List<EndPoint> gossipSeeds) {
    return gossipSeeds.toList()..shuffle();
  }

  EndPoint? _tryDetermineBestNode(ClusterInfo info) {
    final nodes = info.members
        .where((x) => x.isAlive)
        .where((x) => !_notAllowedStates.contains(x.state))
        .toList();

    // Shift leaders before followers
    nodes.sortBy((node) => node.state, ascending: false);

    switch (_settings.nodePreference) {
      case NodePreferenceType.random:
        nodes.shuffle();
        break;
      case NodePreferenceType.leader:
        nodes.shuffleDown((m) => m.state == VNodeState.leader);
        break;
      case NodePreferenceType.follower:
        nodes.shuffleDown((m) => m.state == VNodeState.follower);
        break;
      case NodePreferenceType.read_only_replica:
        nodes.shuffleDown(_isInReadOnlyState);
        break;
    }

    return nodes.isNotEmpty ? nodes.first.endPoint : null;
  }

  bool _isInReadOnlyState(MemberInfo node) =>
      node.state == VNodeState.read_only_leaderless ||
      node.state == VNodeState.read_only_replica;
}

/// The exception that is thrown when [EndPoint] discovery fails.
class DiscoveryException implements Exception {
  DiscoveryException(
    this.maxDiscoverAttempts,
  ) : message = 'Failed to discover candidate '
            'in $maxDiscoverAttempts attempts.';

  /// Error message
  final String message;

  /// The configured number of discovery attempts.
  final int maxDiscoverAttempts;

  @override
  String toString() {
    return '$runtimeType{message: $message}';
  }
}
