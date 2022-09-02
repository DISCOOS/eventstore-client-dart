part of '../operations_client.dart';

mixin EventStoreOperationsScavengeMixin on EventStoreOperationsMixin {
  /// Starts a scavenge operation.
  /// Use parameter [threadCount] to control the number of threads to use.
  /// Use parameter [startFromChunk] to control where to start scavenging.
  /// Use parameter [node] to specify which node to start scavenge.
  /// Returns a [ScavengeResult] with [ScavengeResult.state] and
  /// [ScavengeResult.scavengeId].
  /// Throws an [ArgumentOutOfRangeException] on negative parameters.
  Future<ScavengeResult> start({
    required EndPoint node,
    int threadCount = 1,
    int startFromChunk = 0,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    if (startFromChunk < 0) {
      throw ArgumentOutOfRangeException("'startFromChunk' must be positive");
    }
    if (threadCount <= 0) {
      throw ArgumentOutOfRangeException("'threadCount' must be positive");
    }

    return $runRequest<ScavengeResult>(() async {
      final request = $a.StartScavengeReq()
        ..options = ($a.StartScavengeReq_Options()
          ..startFromChunk = startFromChunk
          ..threadCount = threadCount);

      final client = await $getClient(node);
      final result = await client.startScavenge(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return ScavengeResult.from(result);
    });
  }

  /// Start scavenge operation with given [scavengeId].
  /// Use parameter [node] to specify which node to stop scavenge.
  /// Throws a [ScavengeNotFoundException] if [scavengeId] does
  /// not exist in [node].
  Future<ScavengeResult> stop({
    required EndPoint node,
    required String scavengeId,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<ScavengeResult>(() async {
      final request = $a.StopScavengeReq()
        ..options = ($a.StopScavengeReq_Options()..scavengeId = scavengeId);

      final client = await $getClient(node);
      final result = await client.stopScavenge(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return ScavengeResult.from(result);
    });
  }
}
