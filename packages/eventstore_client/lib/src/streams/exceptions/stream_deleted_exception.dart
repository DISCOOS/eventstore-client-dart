import 'package:eventstore_client/src/core/constants.dart';
import 'package:eventstore_client/src/core/resolved_event.dart';
import 'package:grpc/grpc.dart';

/// Exception thrown if an operation is attempted on a stream which
/// has been deleted.
class StreamDeletedException implements Exception {
  /// Constructs a new instance of [StreamDeletedException].
  StreamDeletedException(this.streamId, {this.cause});

  /// The name of the deleted stream.
  String streamId;

  /// If available, the [cause] of this exception.
  final Object? cause;

  /// Get error message
  String get message => "Event stream '$streamId' is deleted.";

  /// Constructs a new instance of [StreamDeletedException] from given [error]
  factory StreamDeletedException.fromError(GrpcError error) =>
      StreamDeletedException(
        error.trailers![Exceptions.StreamName] ?? '<unknown>',
        cause: error,
      );

  /// Constructs a new instance of [StreamDeletedException] from given [event]
  factory StreamDeletedException.fromEvent(ResolvedEvent event) =>
      StreamDeletedException(
        event.originalStreamId,
        cause: event,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, cause: $cause}';
  }
}
