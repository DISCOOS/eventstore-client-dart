part of '../operations_client.dart';

mixin EventStoreOperationsAdminMixin on EventStoreOperationsMixin {
  /// Shuts down EventStoreDB node.
  /// Use parameter [node] to specify which node.
  Future<void> shutdownNode({
    required EndPoint node,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<void>(() async {
      final client = await $getClient(node);
      await client.shutdown(
        $a.Empty(),
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }

  /// Initiates an index merge operation on given EventStoreDB node.
  /// Use parameter [node] to specify which node.
  Future<void> mergeIndexes({
    required EndPoint node,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<void>(() async {
      final client = await $getClient(node);
      await client.mergeIndexes(
        $a.Empty(),
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }

  /// Resigns EventStoreDB node from the cluster
  /// Use parameter [node] to specify which node.
  Future<void> resignNode({
    required EndPoint node,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<void>(() async {
      final client = await $getClient(node);
      await client.resignNode(
        $a.Empty(),
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }

  /// Sets EventStoreDB node priority.
  /// Use parameter [node] to specify which node.
  /// Use parameter [priority] to specify node priority.
  Future<void> setNodePriority({
    required EndPoint node,
    required int priority,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<void>(() async {
      final client = await $getClient(node);
      final request = $a.SetNodePriorityReq()..priority = priority;
      await client.setNodePriority(
        request,
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }

  /// Restart persistent subscriptions.
  /// Use parameter [node] to specify which node.
  Future<void> restartPersistentSubscriptions({
    required EndPoint node,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return $runRequest<void>(() async {
      final client = await $getClient(node);
      await client.restartPersistentSubscriptions(
        $a.Empty(),
        options: $getOptions(
          userCredentials: userCredentials,
          operationOptions: operationOptions,
        ),
      );
    });
  }
}
