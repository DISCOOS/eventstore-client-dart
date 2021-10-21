import 'package:eventstore_client/eventstore_client.dart';
import 'package:grpc/grpc.dart';

/// The exception that is thrown when a persistent subscription already exists
class PersistentSubscriptionExistsException implements Exception {
  PersistentSubscriptionExistsException(
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
      "Subscription group '$groupName' on stream '$streamId' already exist.";

  @override
  String toString() {
    return '$runtimeType{streamId: $streamId, groupName: $groupName, cause: $cause}';
  }

  /// Constructs a new instance of [PersistentSubscriptionExistsException] from given [error]
  factory PersistentSubscriptionExistsException.fromError(GrpcError error) =>
      PersistentSubscriptionExistsException(
        error.trailers![Exceptions.StreamName] ?? '<unknown>',
        error.trailers![Exceptions.GroupName] ?? '<unknown>',
        cause: error,
      );
}
