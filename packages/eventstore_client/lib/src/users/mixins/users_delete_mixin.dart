part of '../users_client.dart';

mixin EventStoreUsersDeleteMixin on EventStoreUsersMixin {
  /// Delete user in EventStore with given [loginName].
  Future<void> delete({
    required String loginName,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<void>(() async {
      final request = $a.DeleteReq()
        ..options = (DeleteReq_Options()
          ..loginName = loginName);

      final client = await $getClient();
      await client.delete(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }
}
