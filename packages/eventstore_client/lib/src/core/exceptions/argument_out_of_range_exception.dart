import 'package:grpc/grpc_or_grpcweb.dart';

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
