import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/read_enumerator.dart';
import 'package:eventstore_client/src/generated/persistent.pbgrpc.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:meta/meta.dart';

import 'helpers.dart';

part 'persistent_projections_create_mixin.dart';

part 'persistent_projections_delete_mixin.dart';

part 'persistent_projections_read_mixin.dart';

part 'persistent_projections_replay_mixin.dart';

part 'persistent_projections_update_mixin.dart';

mixin EventStorePersistentSubscriptionsMixin on EventStoreClient {
  @visibleForOverriding
  Future<PersistentSubscriptionsClient> $getClient() async {
    return PersistentSubscriptionsClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }

  /// Check if persistent subscription on [SystemStreams.AllStream]
  /// is supported by [ApiVersion][EventStoreClientSettings.apiVersion]
  /// in current [settings].
  bool isAllStreamSupported() => isFeatureSupported(
        ApiFeature.PersistentSubscriptionOnAllStream,
      );
}
