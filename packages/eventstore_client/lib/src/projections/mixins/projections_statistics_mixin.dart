part of 'projections_mixins.dart';

/// Operations for updating user-defined projections.
mixin EventStoreProjectionsStatistics on EventStoreProjectionsMixin {
  /// Get statistics for one-time projections.
  Future<List<ProjectionDetails>> listOneTime({
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();

      return _getList(
        client,
        StatisticsReq_Options()..oneTime = Empty(),
        userCredentials: userCredentials,
      );
    });
  }

  /// Get statistics for continuous projections.
  Future<List<ProjectionDetails>> listContinuous({
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();

      return _getList(
        client,
        StatisticsReq_Options()..continuous = Empty(),
        userCredentials: userCredentials,
      );
    });
  }

  /// Get statistics for transient projections.
  Future<List<ProjectionDetails>> listTransient({
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();

      return _getList(
        client,
        StatisticsReq_Options()..transient = Empty(),
        userCredentials: userCredentials,
      );
    });
  }

  /// Get statistics for all projections.
  Future<List<ProjectionDetails>> listAll({
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();

      return _getList(
        client,
        StatisticsReq_Options()..all = Empty(),
        userCredentials: userCredentials,
      );
    });
  }

  /// Get statistics for all projections.
  /// The [name] argument identifies the projection.
  Future<ProjectionDetails> getStatus(
    String name, {
    Duration? timeoutAfter,
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();

      final list = await _getList(
        client,
        StatisticsReq_Options()..name = name,
        timeoutAfter: timeoutAfter,
        userCredentials: userCredentials,
      );
      return list.first;
    });
  }

  Future<List<ProjectionDetails>> _getList(
    ProjectionsClient client,
    StatisticsReq_Options options, {
    Duration? timeoutAfter,
    UserCredentials? userCredentials,
  }) {
    final responseStream = client.statistics(
      StatisticsReq()..options = options,
      options: $getOptions(
        timeoutAfter: timeoutAfter,
        userCredentials: userCredentials,
      ),
    );
    return responseStream
        .map((resp) => resp.details)
        .map(
          (details) => ProjectionDetails(
            name: details.name,
            mode: details.mode,
            status: details.status,
            position: details.position,
            progress: details.progress,
            epoch: details.epoch.toInt(),
            version: details.version.toInt(),
            stateReason: details.stateReason,
            effectiveName: details.effectiveName,
            lastCheckpoint: details.lastCheckpoint,
            readsInProgress: details.readsInProgress,
            checkpointStatus: details.checkpointStatus,
            partitionsCached: details.partitionsCached,
            bufferedEvents: details.bufferedEvents.toInt(),
            writePendingEventsBeforeCheckpoint:
                details.writePendingEventsBeforeCheckpoint,
            writesInProgress: details.writesInProgress,
            eventsProcessedAfterRestart:
                details.eventsProcessedAfterRestart.toInt(),
            writePendingEventsAfterCheckpoint:
                details.writePendingEventsAfterCheckpoint,
            coreProcessingTime: details.coreProcessingTime.toInt(),
          ),
        )
        .toList();
  }
}
