import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/projections.pbgrpc.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';

/// Operations for updating user-defined projections.
mixin EventStoreProjectionsUpdate on EventStoreClientBase {
  Future<ProjectionsClient> _getClient() async {
    return ProjectionsClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }

  /// Updates given projection.
  /// The [name] parameter identifies the projection that is updated.
  /// The [query] parameter contains the updated JavaScript.
  /// See {@macro user_defined_projections_api} for more
  /// information about the query language (javascript).
  /// The [emitEnabled] parameter controls if projection emits events
  Future<void> update(
    String name,
    String query, {
    bool? emitEnabled,
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await _getClient();

      final options = (UpdateReq_Options()
        ..name = name
        ..query = query);
      if (emitEnabled == null) {
        options.noEmitOptions = Empty();
      } else {
        options.emitEnabled = emitEnabled;
      }

      await client.update(
        UpdateReq()..options = options,
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
    });
  }
}
