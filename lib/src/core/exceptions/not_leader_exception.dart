import 'package:eventstore_client_dart/src/core/constants.dart';
import 'package:eventstore_client_dart/src/generated/cluster.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:universal_io/io.dart';

/// This exception is thrown when an operation requiring a leader node is made on a follower node.
class NotLeaderException implements Exception {
  NotLeaderException(String host, int port, this.cause)
      : leader = EndPoint()
          ..address = host
          ..port = port;

  factory NotLeaderException.from(GrpcError error) => NotLeaderException(
        error.trailers?[Exceptions.LeaderEndpointHost] ??
            InternetAddress.anyIPv4.address,
        int.parse(error.trailers?[Exceptions.LeaderEndpointPort] ?? '0'),
        error,
      );

  final EndPoint leader;
  final GrpcError? cause;

  int get port => leader.port;
  InternetAddress get address => InternetAddress(leader.address);

  @override
  String toString() {
    return '$this{address: $address, port: $port, cause: $cause}';
  }
}
