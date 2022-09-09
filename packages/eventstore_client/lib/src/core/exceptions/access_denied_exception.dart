import 'package:grpc/grpc_or_grpcweb.dart';

/// Exception thrown when a user is not authorised to carry out an operation.
class AccessDeniedException implements Exception {
  /// Constructs a new instance of [AccessDeniedException] from given [cause]
  AccessDeniedException(this.message, {this.cause});

  final dynamic message;
  final GrpcError? cause;

  /// Constructs a new instance of [AccessDeniedException] from given [error]
  factory AccessDeniedException.fromCause(GrpcError error) =>
      AccessDeniedException(
        error.message,
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, error: $cause}';
  }
}
