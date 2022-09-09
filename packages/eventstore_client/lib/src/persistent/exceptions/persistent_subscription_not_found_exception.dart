import 'package:eventstore_client/eventstore_client.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

/// The exception that is thrown when a persistent subscription is not found.
class PersistentSubscriptionNotFoundException implements Exception {
  PersistentSubscriptionNotFoundException(
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
      "Subscription group '$groupName' on stream '$streamId' does not exist.";

  @override
  String toString() {
    return '$runtimeType{streamId: $streamId, groupName: $groupName, cause: $cause}';
  }

  /// Constructs a new instance of [PersistentSubscriptionNotFoundException] from given [error]
  factory PersistentSubscriptionNotFoundException.fromError(GrpcError error) =>
      PersistentSubscriptionNotFoundException(
        error.trailers![Exceptions.StreamName] ?? '<unknown>',
        error.trailers![Exceptions.GroupName] ?? '<unknown>',
        cause: error,
      );
}
