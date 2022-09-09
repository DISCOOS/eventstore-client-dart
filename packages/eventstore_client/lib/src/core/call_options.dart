import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/helpers.dart';
import 'package:grpc/grpc_or_grpcweb.dart';

/// A helper class for creating [CallOptions].
///
class EventStoreCallOptions {
  static CallOptions create(
    EventStoreClientSettings settings, {
    Duration? timeoutAfter,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    final credentials = (userCredentials ?? settings.defaultCredentials);
    return CallOptions(
        timeout: timeoutAfter ?? toTimeout(settings, operationOptions),
        metadata: <String, String>{
          Headers.RequiresLeader:
              settings.nodePreference == NodePreference.leader
                  ? 'true'
                  : 'false',
          if (credentials?.isEmpty == false)
            Headers.Authorization: credentials.toString()
        });
  }

  static Duration? toTimeout(
    EventStoreClientSettings settings,
    EventStoreClientOperationOptions? operationOptions,
  ) {
    final timeout = operationOptions?.timeoutAfter ?? settings.operationTimeout;
    return timeout.isNone ? null : timeout;
  }
}
