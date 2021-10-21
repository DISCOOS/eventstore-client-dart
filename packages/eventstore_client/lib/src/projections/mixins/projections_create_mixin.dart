part of 'projections_mixins.dart';

/// Operations for creating user-defined projections.
mixin EventStoreProjectionsCreate on EventStoreProjectionsMixin {
  /// Creates a projection that runs until the end of the log and then stops.
  /// The [query] parameter contains the JavaScript you want created as a one
  /// time projection. See {@macro user_defined_projections_api} for more
  /// information about the query language (javascript).
  Future<void> createOneTime(
    String query, {
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();

      final options = (CreateReq_Options()
        ..oneTime = Empty()
        ..query = query);

      await client.create(
        CreateReq()..options = options,
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
    });
  }

  /// Creates a continuous projection.
  ///
  /// This projection runs until the end of the log and
  /// then continues running. Continuous projections are persisted
  /// by the server and are restarted if the projection subsystem is
  /// restarted. {@macro proj-name-param}. The [query] parameter contains
  /// the JavaScript you want created as a one time projection.
  /// Continuous projections have explicit names and you can enable or
  /// disable them via this name. See {@macro user_defined_projections_api}
  /// for more information about the query language (javascript).
  Future<void> createContinuous(
    String name,
    String query, {
    bool trackEmittedStreams = false,
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();

      final options = (CreateReq_Options()
        ..continuous = (CreateReq_Options_Continuous()
          ..name = name
          ..trackEmittedStreams = trackEmittedStreams)
        ..query = query);

      await client.create(
        CreateReq()..options = options,
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
    });
  }

  /// Creates a transient projection.
  ///
  /// This projection runs until the end of the log and
  /// then continues running. Transient projections are not persisted
  /// by the server and will be lost if the projection subsystem is
  /// restarted. {@macro proj-name-param}. The [query] parameter contains
  /// the JavaScript you want created as a one time projection.
  /// Continuous projections have explicit names and you can enable or
  /// disable them via this name. See {@macro user_defined_projections_api}
  /// for more information about the query language (javascript).
  Future<void> createTransient(
    String name,
    String query, {
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();

      final options = (CreateReq_Options()
        ..transient = (CreateReq_Options_Transient()..name = name)
        ..query = query);

      await client.create(
        CreateReq()..options = options,
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
    });
  }
}
