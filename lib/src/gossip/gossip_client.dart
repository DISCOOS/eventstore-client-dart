import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/generated/gossip.pbgrpc.dart' as $a;
import 'package:eventstore_client_dart/src/generated/shared.pb.dart';
import 'package:uuid/uuid.dart';

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

  Future<ClusterInfo> read(EndPoint endPoint) async {
    final client = _getClient(endPoint);
    final response = client.read(Empty());
    final info = await response.asStream().first;
    final members = info.members.map((member) => MemberInfo(
          isAlive: member.isAlive,
          state: _toState(member),
          endPoint: _toEndPoint(member),
          uuid: UuidValue(member.instanceId.string),
        ));
    return ClusterInfo(members);
  }

  VNodeState _toState($a.MemberInfo member) {
    return VNodeState.values[member.state.value];
  }

  EndPoint _toEndPoint($a.MemberInfo member) => EndPoint(
        member.httpEndPoint.address,
        member.httpEndPoint.port,
      );
}
