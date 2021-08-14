import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/security/user_credentials.dart';
import 'package:grpc/grpc.dart';

import 'constants.dart';
import 'operation_options.dart';

/// A helper class for creating [CallOptions].
class EventStoreCallOptions {
  static CallOptions create(
    EventStoreClientSettings settings, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    final credentials = (userCredentials ?? settings.defaultCredentials);
    return CallOptions(
        timeout: operationOptions?.timeoutAfter ?? settings.operationTimeout,
        metadata: <String, String>{
          Headers.RequiresLeader:
              settings.nodePreference == NodePreferenceType.leader
                  ? 'true'
                  : 'false',
          if (credentials?.isEmpty == false)
            Headers.Authorization: credentials.toString()
        });
  }
}
