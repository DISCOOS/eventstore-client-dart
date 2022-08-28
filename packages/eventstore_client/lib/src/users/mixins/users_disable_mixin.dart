part of '../users_client.dart';

mixin EventStoreUsersDisableMixin on EventStoreUsersMixin {
  /// Disable user in EventStore with given [loginName].
  Future<void> disable({
    required String loginName,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    if (loginName.isEmpty) {
      throw ArgumentOutOfRangeException("'loginName' is empty");
    }
    return $runRequest<void>(() async {
      final request = $a.DisableReq()
        ..options = (DisableReq_Options()
          ..loginName = loginName);

      final client = await $getClient();
      await client.disable(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }
}
