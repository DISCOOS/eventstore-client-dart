part of '../users_client.dart';

mixin EventStoreUsersDetailsMixin on EventStoreUsersMixin {
  /// Gets the [UserDetails] of an internal user with given [loginName].
  Future<UserDetails> getUser({
    required String loginName,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    if (loginName.isEmpty) {
      throw ArgumentOutOfRangeException("'loginName' is empty");
    }
    return $runRequest<UserDetails>(() async {
      final request = $a.DetailsReq()
        ..options = (DetailsReq_Options()..loginName = loginName);

      final client = await $getClient();
      final response = client.details(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return _toUserDetails(
        await response.single,
      );
    });
  }

  /// Gets the [UserDetails] of the internal user given by
  /// [UserCredentials.username]. If [userCredentials] is not provided,
  /// [EventStoreClientSettings.defaultCredentials] in [settings] is
  /// used. If [UserCredentials.username] is empty, an
  /// [ArgumentOutOfRangeException] is thrown.
  Future<UserDetails> getCurrentUser({
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<UserDetails>(() async {
      final username =
          (userCredentials ?? settings.defaultCredentials)?.username;
      if (username?.isNotEmpty == false) {
        throw ArgumentOutOfRangeException(
          'username is not provided',
        );
      }

      final request = $a.DetailsReq()
        ..options = (DetailsReq_Options()..loginName = username!);
      final client = await $getClient();
      final response = client.details(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return _toUserDetails(
        await response.single,
      );
    });
  }

  /// Gets the [UserDetails] of all internal users.
  Future<List<UserDetails>> getAllUsers({
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<List<UserDetails>>(() async {
      final request = $a.DetailsReq();

      final client = await $getClient();
      final response = client.details(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
      return await response.map(_toUserDetails).toList();
    });
  }

  UserDetails _toUserDetails($a.DetailsResp result) {
    return UserDetails(
      loginName: result.userDetails.loginName,
      fullName: result.userDetails.fullName,
      isDisabled: result.userDetails.disabled,
      groups: result.userDetails.groups.toList(),
      lastUpdated: fromTicksSinceEpoch(
        result.userDetails.lastUpdated.ticksSinceEpoch.toInt(),
      ),
    );
  }
}
