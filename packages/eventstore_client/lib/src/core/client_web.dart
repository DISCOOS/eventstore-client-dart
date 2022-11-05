import 'package:eventstore_client/eventstore_client.dart';
import 'package:grpc/grpc.dart' show ChannelCredentials;
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpc/service_api.dart';

// Implements gRCP support on non-web platform where dart:io is available
abstract class EventStoreClientImpl extends EventStoreClientBase {
  EventStoreClientImpl({
    required EventStoreClientSettings settings,
    List<ClientInterceptor> interceptors = const [],
    Map<String, GrpcErrorCallback> exceptionMap = const {},
  }) : super(
          isGrpcWeb: true,
          settings: settings,
          interceptors: interceptors,
          exceptionMap: exceptionMap,
          options: $mergedCallOptionsWith(settings),
        );

  /// @nodoc
  @override
  ChannelCredentials $createChannelCredentials(EndPoint endPoint) {
    return settings.useTls
        ? ChannelCredentials.secure()
        : ChannelCredentials.insecure();
  }

  @override
  GrpcOrGrpcWebClientChannel $createChannel(EndPoint endPoint) {
    // This factory is available on web platforms
    // NOTE: EventStoreDB supports both protocols on same port
    return GrpcOrGrpcWebClientChannel.toSingleEndpoint(
      host: endPoint.address,
      port: endPoint.port,
      transportSecure: settings.useTls,
    );
  }
}
