import 'package:eventstore_client/eventstore_client.dart';

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
