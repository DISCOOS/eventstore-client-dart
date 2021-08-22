import 'package:eventstore_client/src/core/constants.dart';
import 'package:eventstore_client/src/generated/cluster.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:universal_io/io.dart';

/// This exception is thrown when an operation requiring a leader node is made on a follower node.
class NotLeaderException implements Exception {
  /// Constructs a new instance of [NotLeaderException] from given [cause]
  NotLeaderException(String host, int port, {this.cause})
      : leader = EndPoint()
          ..address = host
          ..port = port;

  /// Constructs a new instance of [NotLeaderException] from given [error]
  factory NotLeaderException.fromCause(GrpcError error) => NotLeaderException(
        error.trailers?[Exceptions.LeaderEndpointHost] ??
            InternetAddress.anyIPv4.address,
        int.parse(error.trailers?[Exceptions.LeaderEndpointPort] ?? '0'),
        cause: error,
      );

  final EndPoint leader;
  final GrpcError? cause;

  int get port => leader.port;
  InternetAddress get address => InternetAddress(leader.address);

  @override
  String toString() {
    return '$runtimeType{address: $address, port: $port, cause: $cause}';
  }
}
