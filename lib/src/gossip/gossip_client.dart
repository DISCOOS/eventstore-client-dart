import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/uuid.dart';
import 'package:eventstore_client/src/generated/gossip.pbgrpc.dart' as $a;
import 'package:eventstore_client/src/generated/shared.pb.dart';

class EventStoreGossipClient extends EventStoreClientBase {
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

  /// Get [ClusterInfo] from given [endpoint]
  Future<ClusterInfo> read(EndPoint endpoint) async {
    return $runRequest(() async {
      final client = _getClient(endpoint);
      final response = client.read(Empty());
      final info = await response.asStream().first;

      final members = info.members.map((member) => MemberInfo(
            isAlive: member.isAlive,
            state: _toState(member),
            endPoint: _toEndPoint(member),
            uuid: UuidV4.fromDTO(member.instanceId).value,
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
