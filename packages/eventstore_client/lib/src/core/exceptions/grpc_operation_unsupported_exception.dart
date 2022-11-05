import 'package:grpc/grpc_or_grpcweb.dart';

class GrpcOperationUnsupportedException implements Exception {
  /// Constructs a new instance of [GrpcOperationUnsupportedException] from given [cause]
  GrpcOperationUnsupportedException(this.message, {this.cause});

  final dynamic message;
  final GrpcError? cause;

  /// Constructs a new instance of [GrpcOperationUnsupportedException] from given [error]
  factory GrpcOperationUnsupportedException.fromCause(GrpcError error) =>
      GrpcOperationUnsupportedException(
        error.message,
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, error: $cause}';
  }
}
