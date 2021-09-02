part of 'projections_mixins.dart';

/// Operations for deleting user-defined projections.
mixin EventStoreProjectionsDelete on EventStoreProjectionsMixin {
  /// Delete user-defined projection.
  /// The [name] identifies the projection that is deleted.
  Future<void> delete(
    String name, {
    UserCredentials? userCredentials,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();

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
