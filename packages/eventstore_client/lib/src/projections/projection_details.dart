/// Provides the details for a projection.
class ProjectionDetails {
  /// Constructs an [ProjectionDetails]
  ProjectionDetails({
    required this.coreProcessingTime,
    required this.version,
    required this.epoch,
    required this.effectiveName,
    required this.writesInProgress,
    required this.readsInProgress,
    required this.partitionsCached,
    required this.status,
    required this.stateReason,
    required this.name,
    required this.mode,
    required this.position,
    required this.progress,
    required this.lastCheckpoint,
    required this.eventsProcessedAfterRestart,
    required this.checkpointStatus,
    required this.bufferedEvents,
    required this.writePendingEventsBeforeCheckpoint,
    required this.writePendingEventsAfterCheckpoint,
  });

  /// The CoreProcessingTime
  final int coreProcessingTime;

  /// The projection version
  final int version;

  /// The Unix epoch
  final int epoch;

  /// The projection effectiveName
  final String effectiveName;

  /// The projection WritesInProgress
  final int writesInProgress;

  /// The projection ReadsInProgress
  final int readsInProgress;

  /// The projection PartitionsCached
  final int partitionsCached;

  /// The projection Status
  final String status;

  /// The projection StateReason
  final String stateReason;

  /// The projection Name
  final String name;

  /// The projection Mode
  final String mode;

  /// The projection Position
  final String position;

  /// The projection Progress
  final double progress;

  /// The projection LastCheckpoint
  final String lastCheckpoint;

  /// The projection EventsProcessedAfterRestart
  final int eventsProcessedAfterRestart;

  /// The projection CheckpointStatus
  final String checkpointStatus;

  /// The projection BufferedEvents
  final int bufferedEvents;

  /// The projection WritePendingEventsBeforeCheckpoint
  final int writePendingEventsBeforeCheckpoint;

  /// The projection WritePendingEventsAfterCheckpoint
  final int writePendingEventsAfterCheckpoint;
}
