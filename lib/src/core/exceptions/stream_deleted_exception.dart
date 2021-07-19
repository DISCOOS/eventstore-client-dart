import 'package:eventstore_client_dart/src/core/constants.dart';
import 'package:grpc/src/shared/status.dart';

/// Exception thrown if an operation is attempted on a stream which
/// has been deleted.
class StreamDeletedException implements Exception {
  /// Constructs a new instance of [StreamDeletedException].
  StreamDeletedException(this.streamName, {this.cause});

  /// The name of the deleted stream.
  String streamName;

  /// If available, the [Exception] that caused this exception.
  final Exception? cause;

  /// Get error message
  String get message => "Event stream '$streamName'is deleted.";

  /// Constructs a new instance of [StreamDeletedException] from given [error]
  factory StreamDeletedException.fromCause(GrpcError error) =>
      StreamDeletedException(
        error.trailers![Exceptions.StreamName] ?? '<unknown>',
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, cause: $cause}';
  }
}
