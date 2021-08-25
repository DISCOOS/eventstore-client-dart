import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/projections.pbgrpc.dart';

/// Operations for deleting user-defined projections.
mixin EventStoreProjectionsDelete on EventStoreClientBase {
  Future<ProjectionsClient> _getClient() async {
    return ProjectionsClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }

  /// Delete user-defined projection.
  /// The [name] identifies the projection that is deleted.
  Future<void> delete(
    String name, {
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await _getClient();

      final options = DeleteReq_Options()..name = name;

      await client.delete(
        DeleteReq()..options = options,
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
    });
  }
}
