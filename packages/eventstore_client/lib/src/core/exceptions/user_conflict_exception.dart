import 'package:grpc/grpc_or_grpcweb.dart';

/// Exception thrown if user with given loginName already exists.
class UserConflictException implements Exception {
  /// Constructs a new instance of [UserConflictException].
  UserConflictException(this.message, {this.cause});

  /// The message received from server
  final String message;

  /// If available, the [cause] of this exception.
  final Object? cause;

  /// Constructs a new instance of [UserConflictException]
  /// from given [error]
  factory UserConflictException.fromError(GrpcError error) =>
      UserConflictException(
        error.message ?? '<unknown>',
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, cause: $cause}';
  }
}
