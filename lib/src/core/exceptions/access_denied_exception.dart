import 'package:grpc/grpc.dart';

/// Exception thrown when a user is not authorised to carry out an operation.
class AccessDeniedException implements Exception {
  AccessDeniedException(this.message, this.cause);
  final dynamic message;
  final GrpcError cause;

  factory AccessDeniedException.from(GrpcError error) => AccessDeniedException(
        error.message,
        error,
      );

  @override
  String toString() {
    return '$this{message: $message, error: $cause}';
  }
}
