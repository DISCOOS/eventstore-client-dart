import 'dart:convert';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/interceptors/interceptors.dart';
import 'package:eventstore_client/src/generated/code.pb.dart';
import 'package:eventstore_client/src/generated/persistent.pb.dart';
import 'package:grpc/grpc.dart';

import 'exceptions/maximum_subscribers_reached_exception.dart';
import 'exceptions/persistent_subscription_dropped_by_server_exception.dart';
import 'exceptions/persistent_subscription_not_found_exception.dart';
import 'mixins/persistent_projections_mixins.dart';

/// Class implementing the {@macro persistent_subs_api}
///
/// Utility class for {@macro persistent_subs_doc}
///
/// {@template persistent_subs_doc}
/// [persistent subscriptions](https://developers.eventstore.com/server/v20.10/docs/persistent-subscriptions)
/// {@endtemplate}
///
/// {@template persistent_subs_api}
/// [Persistent Subscriptions API](https://developers.eventstore.com/clients/grpc/subscribing-to-streams/persistent-subscriptions)
/// {@endtemplate}
class EventStorePersistentSubscriptionsClient extends EventStoreClientBase
    with
        EventStorePersistentSubscriptionsMixin,
        EventStorePersistentSubscriptionsRead,
        EventStorePersistentSubscriptionsReplay,
        EventStorePersistentSubscriptionsCreate,
        EventStorePersistentSubscriptionsUpdate,
        EventStorePersistentSubscriptionsDelete {
  EventStorePersistentSubscriptionsClient(
    EventStoreClientSettings settings,
  ) : super(
          settings: settings,
          exceptionMap: ExceptionMap,
          interceptors: [Requests],
        );

  /// Track
  static final Requests = ClientRequestInterceptor();

  /// Converts [GrpcError]s to typed [Exception]s
  static Map<String, GrpcErrorCallback> ExceptionMap =
      <String, GrpcErrorCallback>{
    Exceptions.PersistentSubscriptionFailed: (e) =>
        PersistentSubscriptionFailedException.fromError(e),
    Exceptions.PersistentSubscriptionDoesNotExist: (e) =>
        PersistentSubscriptionNotFoundException.fromError(e),
    Exceptions.PersistentSubscriptionExists: (e) =>
        PersistentSubscriptionExistsException.fromError(e),
    Exceptions.MaximumSubscribersReached: (e) =>
        MaximumSubscribersReachedException.fromError(e),
    Exceptions.PersistentSubscriptionDropped: (e) =>
        PersistentSubscriptionDroppedException.fromError(e),
    Code.UNKNOWN.name: _onUnknown,
  };

  static Exception _onUnknown(GrpcError error) {
    if (_startWith(error, UPDATE_DOES_NOT_EXIST)) {
      final update = Requests.request<UpdateReq>();
      return PersistentSubscriptionNotFoundException(
        update == null
            ? '<unknown>'
            : update.options.hasAll()
                ? SystemStreams.AllStream
                : utf8.decode(update.options.stream.streamIdentifier.streamId),
        update == null ? '<unknown>' : update.options.groupName,
      );
    }
    return error;
  }

  static const UPDATE_DOES_NOT_EXIST =
      'Unexpected UpdatePersistentSubscriptionResult: DoesNotExist';

  static bool _startWith(GrpcError error, String prefix) {
    return error.message?.startsWith(prefix) == true;
  }
}
