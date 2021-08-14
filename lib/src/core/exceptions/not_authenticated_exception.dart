import 'package:grpc/grpc.dart';

/// The exception that is thrown when a user is not authenticated.
class NotAuthenticatedException implements Exception {
  /// Constructs a new instance of [NotAuthenticatedException] from given [error]
  NotAuthenticatedException(this.message, {this.cause});

  final dynamic message;
  final GrpcError? cause;

  /// Constructs a new instance of [NotAuthenticatedException] from given [error]
  factory NotAuthenticatedException.fromCause(GrpcError error) =>
      NotAuthenticatedException(
        error.message,
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, error: $cause}';
  }
}
