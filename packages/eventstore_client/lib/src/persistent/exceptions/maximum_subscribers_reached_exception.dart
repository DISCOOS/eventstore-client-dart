import 'package:eventstore_client/src/core/constants.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

/// The exception that is thrown when the maximum number of
/// subscribers on a persistent subscription is exceeded.
class MaximumSubscribersReachedException implements Exception {
  MaximumSubscribersReachedException(
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
      "Maximum subscriptions reached for subscription group '$groupName' on stream '$streamId'.";

  @override
  String toString() {
    return '$runtimeType{streamId: $streamId, groupName: $groupName, cause: $cause}';
  }

  /// Constructs a new instance of [MaximumSubscribersReachedException] from given [error]
  factory MaximumSubscribersReachedException.fromError(GrpcError error) =>
      MaximumSubscribersReachedException(
        error.trailers![Exceptions.StreamName] ?? '<unknown>',
        error.trailers![Exceptions.GroupName] ?? '<unknown>',
        cause: error,
      );
}
