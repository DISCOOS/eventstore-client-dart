import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/helpers.dart';
import 'package:eventstore_client/src/generated/users.pbgrpc.dart' as $a;
import 'package:eventstore_client/src/generated/users.pbgrpc.dart';
import 'package:meta/meta.dart';

part 'mixins/users_mixins.dart';
part 'mixins/users_create_mixin.dart';
part 'mixins/users_update_mixin.dart';
part 'mixins/users_delete_mixin.dart';
part 'mixins/users_enable_mixin.dart';
part 'mixins/users_disable_mixin.dart';
part 'mixins/users_details_mixin.dart';
part 'mixins/users_password_mixin.dart';

class EventStoreUsersClient extends EventStoreClientBase
    with
        EventStoreUsersMixin,
        EventStoreUsersCreateMixin,
        EventStoreUsersUpdateMixin,
        EventStoreUsersDeleteMixin,
        EventStoreUsersEnableMixin,
        EventStoreUsersDisableMixin,
        EventStoreUsersDetailsMixin,
        EventStoreUsersPasswordMixin {
  EventStoreUsersClient(
    EventStoreClientSettings settings,
  ) : super(settings: settings, exceptionMap: ExceptionMap);

  /// Converts [GrpcError]s to typed [Exception]s
  static Map<String, GrpcErrorCallback> ExceptionMap =
      <String, GrpcErrorCallback>{
    Exceptions.UserNotFound: (e) => UserNotFoundException.fromError(e),
    Exceptions.UserConflict: (e) => UserConflictException.fromError(e),
  };
}
