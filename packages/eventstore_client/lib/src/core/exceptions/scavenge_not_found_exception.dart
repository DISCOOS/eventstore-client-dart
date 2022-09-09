import 'package:grpc/grpc_or_grpcweb.dart';

/// Exception thrown if scavenge with given scavengeId was not found.
class ScavengeNotFoundException implements Exception {
  /// Constructs a new instance of [ScavengeNotFoundException].
  ScavengeNotFoundException(this.message, {this.cause});

  /// The message received from server
  final String message;

  /// If available, the [cause] of this exception.
  final Object? cause;

  /// Constructs a new instance of [ScavengeNotFoundException]
  /// from given [error]
  factory ScavengeNotFoundException.fromError(GrpcError error) =>
      ScavengeNotFoundException(
        error.message ?? '<unknown>',
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, cause: $cause}';
  }
}
