import 'package:grpc/grpc_or_grpcweb.dart';

/// Exception thrown if there is an attempt to operate inside a
/// transaction which does not exist.
class InvalidTransactionException implements Exception {
  /// Constructs a new instance of [InvalidTransactionException].
  InvalidTransactionException(this.message, {this.cause});

  /// The message received from server
  final String message;

  /// If available, the [cause] of this exception.
  final Object? cause;

  /// Constructs a new instance of [InvalidTransactionException]
  /// from given [error]
  factory InvalidTransactionException.fromError(GrpcError error) =>
      InvalidTransactionException(
        error.message ?? '<unknown>',
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, cause: $cause}';
  }
}
