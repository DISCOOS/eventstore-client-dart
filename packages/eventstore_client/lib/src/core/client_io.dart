import 'package:eventstore_client/eventstore_client.dart';
import 'package:grpc/grpc.dart' show ChannelCredentials, ChannelOptions;
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpc/service_api.dart';

import 'helpers.dart';
import 'helpers_io.dart';

// Implements gRCP-web support on web platform
abstract class EventStoreClientImpl extends EventStoreClientBase {
  EventStoreClientImpl({
    required EventStoreClientSettings settings,
    List<ClientInterceptor> interceptors = const [],
    Map<String, GrpcErrorCallback> exceptionMap = const {},
  }) : super(
          settings: settings,
          interceptors: interceptors,
          exceptionMap: exceptionMap,
        );

  /// @nodoc
  @override
  ChannelCredentials $createChannelCredentials(EndPoint endPoint) {
    return settings.useTls
        ? ChannelCredentials.secure(
            // If not provided, the default trust store is used.
            certificates: readHostCertificate(settings),
            onBadCertificate: (cert, host) {
              return settings.tlsSetup.onBadCertificate != null
                  // Use supplied bad cert callback if provided
                  ? settings.tlsSetup.onBadCertificate!(
                      cert,
                      host,
                      endPoint.port,
                    )
                  // else if verifyCert is true, bad certs are not allowed
                  : !settings.tlsSetup.verifyCert;
            },
          )
        : ChannelCredentials.insecure();
  }

  @override
  GrpcOrGrpcWebClientChannel $createChannel(EndPoint endPoint) {
    // This factory is only available on non-web platforms
    return GrpcOrGrpcWebClientChannel.grpc(
      endPoint.address,
      port: endPoint.port,
      options: ChannelOptions(
        credentials: $getOrAddCredentials(endPoint),
        // Workaround for grpc.keepalive_time_ms:
        // > After a duration of this time the client/server pings its peer
        // > to see if the transport is still alive.
        idleTimeout: settings.keepAliveInterval.isNone
            ? Defaults.GrpcIdleTimeout
            : settings.keepAliveTimeout,
        // Workaround for grpc.keepalive_timeout_ms:
        // > After waiting for a duration of this time, if the keepalive
        // > ping sender does not receive the ping ack, it will close
        // > the transport.
        connectionTimeout: settings.keepAliveTimeout.isNone
            ? Defaults.GrpcConnectionTimeout
            : settings.keepAliveTimeout,
      ),
    );
  }
}
