part of '../users_client.dart';

mixin EventStoreUsersPasswordMixin on EventStoreUsersMixin {
  /// Change current password for user in EventStore with given [loginName].
  Future<void> changePassword({
    required String loginName,
    required String oldPassword,
    required String newPassword,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    if (loginName.isEmpty) {
      throw ArgumentOutOfRangeException("'loginName' is empty");
    }
    if (oldPassword.isEmpty) {
      throw ArgumentOutOfRangeException("'oldPassword' is empty");
    }
    if (newPassword.isEmpty) {
      throw ArgumentOutOfRangeException("'newPassword' is empty");
    }

    return $runRequest<void>(() async {
      final request = $a.ChangePasswordReq()
        ..options = (ChangePasswordReq_Options()
          ..loginName = loginName
          ..currentPassword = oldPassword
          ..newPassword = newPassword);

      final client = await $getClient();
      await client.changePassword(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }

  /// Resets password for user in EventStore with given [loginName].
  Future<void> resetPassword({
    required String loginName,
    required String newPassword,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    if (loginName.isEmpty) {
      throw ArgumentOutOfRangeException("'loginName' is empty");
    }
    if (newPassword.isEmpty) {
      throw ArgumentOutOfRangeException("'newPassword' is empty");
    }
    return $runRequest<void>(() async {
      final request = $a.ResetPasswordReq()
        ..options = (ResetPasswordReq_Options()
          ..loginName = loginName
          ..newPassword = newPassword);

      final client = await $getClient();
      await client.resetPassword(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }
}
