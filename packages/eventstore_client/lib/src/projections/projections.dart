import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/helpers.dart';

export 'mixins/projections_mixins.dart';
export 'projections_client.dart';
export 'projection_details.dart';

/// Utility class for projections
///
/// {@template proj-name-param}
/// The [name] parameter is used as an identifier for operations on
/// the created projection. The id of the resulting stream is
/// by default `\$projections-${name}-result` if `resultStreamName`
/// is not given with the options method in the query,
/// ```javascript
/// options({
///   resultStreamName: "my_demo_projection_result",
///   $includeLinks: false,
///   reorderEvents: false,
///   processingLag: 0
/// })
/// ```
/// {@endtemplate}
///
/// {@template projections_mgmnt_api}
/// [Projections Management API](https://developers.eventstore.com/clients/grpc/projections).
/// {@endtemplate}
///
/// {@template server_projections}
/// [Projections docs](https://developers.eventstore.com/server/v20.10/docs/projections)
/// {@endtemplate}
///
/// {@template user_defined_projections_api}
/// [user-defined projections API](https://developers.eventstore.com/server/v20.10/docs/projections/user-defined-projections.html#user-defined-projections-api).
/// {@endtemplate}
///
///
class Projections {
  /// Get stream id of result-stream generated by stateful projections
  /// from projection [name]. {@macro proj-name-param}.
  static String stateStreamId(String name) => '\$projections-$name-state';

  /// Get stream id of state-stream generated by stateful projections
  /// from projection [name]. {@macro proj-name-param}.
  static String resultStreamId(String name) => '\$projections-$name-result';

  /// Returns when system streams are running
  static Future<List<ResolvedEvent>> onState(
    List<String> names,
    EventStoreStreamsClient client, {
    UserCredentials? userCredentials,
    FutureOr<void> Function()? onTimeout,
    String eventType = SystemEvents.ProjectionUpdated,
    Duration? timeoutAfter = Defaults.OperationTimeout,
  }) async {
    final tests = Future.wait<ResolvedEvent>(names.map(
      (name) => _onState(
        client,
        name,
        eventType,
        userCredentials,
      ),
    ));
    return (timeoutAfter == null
        ? tests
        : tests.timeout(
            timeoutAfter,
            onTimeout: onTimeout == null
                ? null
                : () async {
                    await onTimeout();
                    return <ResolvedEvent>[];
                  },
          ));
  }

  static Future<ResolvedEvent> _onState(
    EventStoreStreamsClient client,
    String name,
    String eventType,
    UserCredentials? userCredentials,
  ) async {
    while (true) {
      try {
        final result = await client.read(
          '\$projections-$name',
          userCredentials: userCredentials,
          operationOptions: EventStoreClientOperationOptions.Default.cloneWith(
            timeoutAfter: const Duration(milliseconds: 100),
          ),
        );
        if (result.isOK) {
          final event = await result.stream.first;
          if (event.originalEventType == eventType) {
            return event;
          }
        }
        await Future<void>.delayed(
          const Duration(milliseconds: 100),
        );
      } catch (_) {
        // NOP
      }
    }
  }

  /// Returns when system streams are running
  static Future<void> onStatus(
    ProjectionStatus status,
    List<String> names,
    EventStoreProjectionsClient client, {
    UserCredentials? userCredentials,
    FutureOr<void> Function()? onTimeout,
    Duration? timeoutAfter = Defaults.OperationTimeout,
  }) async {
    final tests = Future.wait<void>(names.map(
      (name) => _onStatus(
        client,
        name,
        enumName(status),
        userCredentials,
      ),
    ));
    await (timeoutAfter == null
        ? tests
        : tests.timeout(
            timeoutAfter,
            onTimeout: onTimeout == null
                ? null
                : () async => <void>[await onTimeout()],
          ));
  }

  static Future<void> _onStatus(
    EventStoreProjectionsClient client,
    String name,
    String status,
    UserCredentials? userCredentials,
  ) async {
    while (true) {
      try {
        final result = await client.getStatus(
          name,
          userCredentials: userCredentials,
          timeoutAfter: const Duration(milliseconds: 100),
        );
        if (result.status.contains(status)) {
          return;
        }
        await Future<void>.delayed(
          const Duration(milliseconds: 100),
        );
      } catch (_) {
        // NOP
      }
    }
  }
}

enum ProjectionStatus {
  Creating,
  Loading,
  Loaded,
  Preparing,
  Prepared,
  Starting,
  LoadingStopped,
  Running,
  Stopping,
  Aborting,
  Stopped,
  Completed,
  Aborted,
  Faulted,
  Deleting,
}

class SystemProjections {
  /// '$streams' projection name
  static const String Streams = '\$streams';

  /// '$stream_by_category' projection name
  static const String StreamByCategory = '\$stream_by_category';

  /// '$by_category' projection name
  static const String ByCategory = '\$by_category';

  /// '$by_event_type' projection name
  static const String ByEventType = '\$by_event_type';

  /// '$by_correlation_id' projection name
  static const String ByCorrelationId = '\$by_correlation_id';

  /// Get list of system projection names
  static const Names = [
    Streams,
    StreamByCategory,
    ByCategory,
    ByEventType,
    ByCorrelationId,
  ];
}