import 'package:grpc/grpc.dart';

/// Exception thrown when a user is not authorised to carry out an operation.
class ArgumentOutOfRangeException implements Exception {
  /// Constructs a new instance of [ArgumentOutOfRangeException] from given [cause]
  ArgumentOutOfRangeException(this.message, {this.cause});

  final dynamic message;
  final GrpcError? cause;

  /// Constructs a new instance of [ArgumentOutOfRangeException] from given [error]
  factory ArgumentOutOfRangeException.fromCause(GrpcError error) =>
      ArgumentOutOfRangeException(
        error.message,
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, error: $cause}';
  }
}