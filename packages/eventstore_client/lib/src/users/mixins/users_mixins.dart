part of '../users_client.dart';

mixin EventStoreUsersMixin on EventStoreClient {
  @visibleForOverriding
  Future<UsersClient> $getClient() async {
    return UsersClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }
}
