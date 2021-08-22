import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/projections.pbgrpc.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';

/// Operations for controlling system and user-defined projections.
mixin EventStoreProjectionsControl on EventStoreClientBase {
  Future<ProjectionsClient> _getClient() async {
    return ProjectionsClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }

  /// Enable given projection.
  ///
  /// The [name] identifies the projection to enable.
  Future<void> enable(
    String name,
    String query, {
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await _getClient();

      final request = EnableReq()..options = (EnableReq_Options()..name = name);

      await client.enable(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
    });
  }

  /// Disable given projection.
  ///
  /// This operation save the projection's checkpoint.
  /// The [name] identifies the projection to disable.
  Future<void> disable(
    String name,
    String query, {
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(
      () => _disable(
        name,
        writeCheckpoint: true,
        userCredentials: userCredentials,
      ),
    );
  }

  /// Abort given projection.
  ///
  /// Does the same as [disable], but without saving projection's checkpoint.
  /// The [name] identifies the projection to disable.
  Future<void> abort(
    String name,
    String query, {
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(
      () => _disable(
        name,
        writeCheckpoint: false,
        userCredentials: userCredentials,
      ),
    );
  }

  /// Reset given projection back to beginning of the log.
  ///
  /// The [name] identifies the projection to reset.
  Future<void> reset(
    String name,
    String query, {
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await _getClient();

      final request = ResetReq()..options = (ResetReq_Options()..name = name);

      await client.reset(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
    });
  }

  /// Restarts the projection subsystem.
  Future<void> restartSubsystem({
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await _getClient();

      await client.restartSubsystem(
        Empty(),
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
    });
  }

  Future<void> _disable(
    String name, {
    required bool writeCheckpoint,
    UserCredentials? userCredentials,
  }) async {
    final client = await _getClient();

    final request = DisableReq()
      ..options = (DisableReq_Options()
        ..name = name
        ..writeCheckpoint = writeCheckpoint);

    await client.disable(
      request,
      options: $getOptions(
        userCredentials: userCredentials,
      ),
    );
  }
}
