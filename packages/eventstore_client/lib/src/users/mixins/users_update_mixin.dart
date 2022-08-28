part of '../users_client.dart';

mixin EventStoreUsersUpdateMixin on EventStoreUsersMixin {
  /// Update user in EventStore with given [loginName].
  Future<void> update({
    required String loginName,
    String? fullName,
    List<String> groups = const [],
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    if (loginName.isEmpty) {
      throw ArgumentOutOfRangeException("'loginName' is empty");
    }
    return $runRequest<void>(() async {
      final request = $a.UpdateReq()
        // UpdateReq_Options.password omitted, have no use-case (is tested)
        ..options = (UpdateReq_Options()
          ..loginName = loginName
          ..groups.addAll(groups));

      if (fullName?.isNotEmpty == true) {
        request.options.fullName = fullName!;
      }

      final client = await $getClient();
      await client.update(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }
}
