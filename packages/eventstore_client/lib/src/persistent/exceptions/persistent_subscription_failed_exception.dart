import 'package:eventstore_client/eventstore_client.dart';
import 'package:grpc/grpc.dart';

/// The exception that is thrown when a persistent subscription fails.
class PersistentSubscriptionFailedException implements Exception {
  PersistentSubscriptionFailedException(
    this.streamId,
    this.groupName,
    this.reason, {
    this.cause,
  });

  /// The name of the stream.
  final String streamId;

  /// The name of the subscription group.
  final String groupName;

  /// The reason given by server
  final String reason;

  /// If available, the [cause] of this exception.
  final Object? cause;

  /// Get error message
  String get message =>
      "Subscription group '$groupName' on stream '$streamId' failed: $reason";

  @override
  String toString() {
    return '$runtimeType{streamId: $streamId, groupName: $groupName, reason: $reason, cause: $cause}';
  }

  /// Constructs a new instance of [PersistentSubscriptionFailedException] from given [error]
  factory PersistentSubscriptionFailedException.fromError(GrpcError error) =>
      PersistentSubscriptionFailedException(
        error.trailers![Exceptions.StreamName] ?? '<unknown>',
        error.trailers![Exceptions.GroupName] ?? '<unknown>',
        error.trailers![Exceptions.Reason] ?? '<unknown>',
        cause: error,
      );
}
