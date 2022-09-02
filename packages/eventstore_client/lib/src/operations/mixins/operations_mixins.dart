part of '../operations_client.dart';

mixin EventStoreOperationsMixin on EventStoreClientBase {
  @visibleForOverriding
  Future<$a.OperationsClient> $getClient(EndPoint node) async {
    return $a.OperationsClient(
      $getOrAddChannel(node),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }
}
