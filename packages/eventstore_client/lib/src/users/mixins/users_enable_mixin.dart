part of '../users_client.dart';

mixin EventStoreUsersEnableMixin on EventStoreUsersMixin {
  /// Enable user in EventStore with given [loginName].
  Future<void> enable({
    required String loginName,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    if (loginName.isEmpty) {
      throw ArgumentOutOfRangeException("'loginName' is empty");
    }
    return $runRequest<void>(() async {
      final request = $a.EnableReq()
        ..options = (EnableReq_Options()..loginName = loginName);

      final client = await $getClient();
      await client.enable(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }
}
