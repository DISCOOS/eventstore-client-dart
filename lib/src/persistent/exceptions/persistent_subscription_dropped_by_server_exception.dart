import 'package:eventstore_client/src/core/constants.dart';
import 'package:grpc/grpc.dart';

/// The exception that is thrown when the EventStoreDB drops a
/// persistent subscription.
class PersistentSubscriptionDroppedException implements Exception {
  PersistentSubscriptionDroppedException(
    this.streamId,
    this.groupName, {
    this.cause,
  });

  /// The name of the stream.
  final String streamId;

  /// The name of the subscription group.
  final String groupName;

  /// If available, the [cause] of this exception.
  final Object? cause;

  /// Get error message
  String get message =>
      "Subscription group '$groupName' on stream '$streamId' was dropped.";

  @override
  String toString() {
    return '$runtimeType{streamId: $streamId, groupName: $groupName, cause: $cause}';
  }

  /// Constructs a new instance of [PersistentSubscriptionDroppedException] from given [error]
  factory PersistentSubscriptionDroppedException.fromError(GrpcError error) =>
      PersistentSubscriptionDroppedException(
        error.trailers![Exceptions.StreamName] ?? '<unknown>',
        error.trailers![Exceptions.GroupName] ?? '<unknown>',
        cause: error,
      );
}
