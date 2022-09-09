import 'package:grpc/grpc_or_grpcweb.dart';

/// Exception thrown if user with given loginName was not found.
class UserNotFoundException implements Exception {
  /// Constructs a new instance of [UserNotFoundException].
  UserNotFoundException(this.message, {this.cause});

  /// The message received from server
  final String message;

  /// If available, the [cause] of this exception.
  final Object? cause;

  /// Constructs a new instance of [UserNotFoundException]
  /// from given [error]
  factory UserNotFoundException.fromError(GrpcError error) =>
      UserNotFoundException(
        error.message ?? '<unknown>',
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, cause: $cause}';
  }
}
