import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/operations.pbgrpc.dart' as $a;
import 'package:eventstore_client/src/generated/shared.pb.dart' as $a;
import 'package:meta/meta.dart';

part 'mixins/operations_admin_mixin.dart';
part 'mixins/operations_mixins.dart';
part 'mixins/operations_scavenge_mixin.dart';

class EventStoreOperationsClient extends EventStoreClientBase
    with
        EventStoreOperationsMixin,
        EventStoreOperationsAdminMixin,
        EventStoreOperationsScavengeMixin {
  EventStoreOperationsClient(
    EventStoreClientSettings settings,
  ) : super(settings: settings, exceptionMap: ExceptionMap);

  /// Converts [GrpcError]s to typed [Exception]s
  static Map<String, GrpcErrorCallback> ExceptionMap = {
    Exceptions.ScavengeNotFound: (e) => ScavengeNotFoundException.fromError(e),
  };
}
