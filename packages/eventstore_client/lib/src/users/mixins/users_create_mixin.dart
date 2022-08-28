part of '../users_client.dart';

mixin EventStoreUsersCreateMixin on EventStoreUsersMixin {
  /// Create user in EventStore with given [loginName].
  Future<void> create({
    required String loginName,
    required String password,
    required String fullName,
    List<String> groups = const [],
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    if (loginName.isEmpty) {
      throw ArgumentOutOfRangeException("'loginName' is empty");
    }
    if (password.isEmpty) {
      throw ArgumentOutOfRangeException("'password' is empty");
    }
    if (fullName.isEmpty) {
      throw ArgumentOutOfRangeException("'fullName' is empty");
    }

    return $runRequest<void>(() async {
      final request = $a.CreateReq()
        ..options = (CreateReq_Options()
          ..loginName = loginName
          ..password = password
          ..fullName = fullName
          ..groups.addAll(groups));

      final client = await $getClient();
      await client.create(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }
}
