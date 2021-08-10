import 'package:eventstore_client_dart/src/core/constants.dart';
import 'package:eventstore_client_dart/src/core/endpoint.dart';

/// A base class for discovering an [EndPoint] used
/// to communicate with EventStoreDB.
abstract class EndpointDiscoverer {
  Future<EndPoint> discover();
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
}
