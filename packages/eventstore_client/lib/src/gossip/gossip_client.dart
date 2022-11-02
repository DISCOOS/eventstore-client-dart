import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/helpers.dart';
import 'package:eventstore_client/src/generated/gossip.pbgrpc.dart' as $a;
import 'package:eventstore_client/src/generated/shared.pb.dart';

class EventStoreGossipClient extends EventStoreClient {
  EventStoreGossipClient(
    EventStoreClientSettings settings,
  ) : super(settings: settings);

  $a.GossipClient _getClient(EndPoint endPoint) {
    return $a.GossipClient(
      $getOrAddChannel(endPoint),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }

  /// Get [ClusterInfo] from given [endpoint].
  /// If [extended] is 'true' extended information
  /// about leader is gathered, which includes
  /// server api version and active features.
  Future<ClusterInfo> read(
    EndPoint endpoint, {
    bool extended = false,
  }) async {
    return $runRequest(() async {
      final client = _getClient(endpoint);
      final response = client.read(Empty());
      final leader = await response.asStream().first;

      final info = extended
          ? await getNodeInfo(
              endpoint,
              settings: settings,
              channelCredentials: $getOrAddCredentials(endpoint),
            )
          : null;

      final members = leader.members.map((member) => MemberInfo(
            isAlive: member.isAlive,
            state: _toState(member),
            endPoint: _toEndPoint(member),
            uuid: UuidV4.fromDTO(member.instanceId).value,
            features: info?.features ?? const [],
            apiVersion: info?.apiVersion ?? settings.apiVersion,
          ));
      return ClusterInfo(members);
    });
  }

  VNodeState _toState($a.MemberInfo member) {
    return VNodeState.values[member.state.value];
  }

  EndPoint _toEndPoint($a.MemberInfo member) => EndPoint(
        member.httpEndPoint.address,
        member.httpEndPoint.port,
      );
}
