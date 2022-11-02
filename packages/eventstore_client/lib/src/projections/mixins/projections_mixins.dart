import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/projections.pbgrpc.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';
import 'package:meta/meta.dart';

part 'projections_create_mixin.dart';
part 'projections_update_mixin.dart';
part 'projections_delete_mixin.dart';
part 'projections_state_mixin.dart';
part 'projections_statistics_mixin.dart';

part 'projections_control_mixin.dart';

mixin EventStoreProjectionsMixin on EventStoreClient {
  @visibleForOverriding
  Future<ProjectionsClient> $getClient() async {
    return ProjectionsClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }
}
