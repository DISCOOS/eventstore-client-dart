import 'package:eventstore_client/src/core/constants.dart';
import 'package:grpc/grpc.dart';

/// Exception thrown when an append exceeds the maximum size set by the server.
class MaximumAppendSizeExceededException implements Exception {
  /// Constructs a new instance of [MaximumAppendSizeExceededException].
  MaximumAppendSizeExceededException(this.maxAppendSize, {this.cause});

  /// The configured maximum append size.
  int maxAppendSize;

  /// If available, the [cause] of this exception.
  final Object? cause;

  /// Get error message
  String get message => 'Maximum Append Size of $maxAppendSize Exceeded.';

  /// Constructs a new instance of [MaximumAppendSizeExceededException]
  /// from given [error]
  factory MaximumAppendSizeExceededException.fromError(GrpcError error) =>
      MaximumAppendSizeExceededException(
        int.parse(error.trailers![Exceptions.MaximumAppendSize] ?? '-1'),
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, cause: $cause}';
  }
}
