import 'package:eventstore_client_dart/eventstore_client_dart.dart';

/// A class representing the options to apply to an individual operation.
class EventStoreClientOperationOptions {
  const EventStoreClientOperationOptions({
    this.timeoutAfter,
    required this.batchAppendSize,
    required this.throwOnAppendFailure,
  });

  /// Default [EventStoreClientOperationOptions]
  static const Default = EventStoreClientOperationOptions(
    throwOnAppendFailure: true,
    timeoutAfter: Duration(seconds: 5),
    batchAppendSize: Defaults.BatchAppendSize,
  );

  /// An optional [Duration] to use for gRPC deadlines.
  final Duration? timeoutAfter;

  ///  Whether or not to immediately throw a [WrongExpectedVersionException]
  ///  when an append fails.
  final bool throwOnAppendFailure;

  /// The batch size, in bytes.
  final int batchAppendSize;

  /// Clones a copy of the current <[EventStoreClientOperationOptions].
  EventStoreClientOperationOptions cloneWith({
    Duration? timeoutAfter,
    int? batchAppendSize,
    bool? throwOnAppendFailure,
  }) =>
      EventStoreClientOperationOptions(
        timeoutAfter: timeoutAfter,
        batchAppendSize: batchAppendSize ?? this.batchAppendSize,
        throwOnAppendFailure: throwOnAppendFailure ?? this.throwOnAppendFailure,
      );
}
