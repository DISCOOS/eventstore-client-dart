import 'dart:convert';

import 'package:async/async.dart';
import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/constants.dart';
import 'package:eventstore_client/src/core/event_data.dart';
import 'package:eventstore_client/src/core/features.dart';
import 'package:eventstore_client/src/core/helpers.dart';
import 'package:eventstore_client/src/core/log_position.dart';
import 'package:eventstore_client/src/core/read_enumerator.dart';
import 'package:eventstore_client/src/core/resolved_event.dart';
import 'package:eventstore_client/src/streams/stream_position.dart';
import 'package:eventstore_client/src/streams/stream_state.dart';
import 'package:eventstore_client/src/core/typedefs.dart';
import 'package:eventstore_client/src/core/uuid.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';
import 'package:eventstore_client/src/generated/streams.pbgrpc.dart';
import 'package:eventstore_client/src/streams/enums.dart';
import 'package:eventstore_client/src/streams/event_type_filter.dart';
import 'package:eventstore_client/src/streams/stream_acl.dart';
import 'package:eventstore_client/src/streams/write_results.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:meta/meta.dart';
import 'package:tuple/tuple.dart';

import 'helpers.dart';
import 'stream_metadata.dart';

part 'delete_results.dart';
part 'mixins/streams_append_mixin.dart';
part 'mixins/streams_delete_mixin.dart';
part 'mixins/streams_mixins.dart';
part 'mixins/streams_read_mixin.dart';
part 'mixins/streams_subscribe_mixin.dart';
part 'read_results.dart';
part 'stream_metadata_result.dart';
part 'subscription.dart';

class EventStoreStreamsClient extends EventStoreClientBase
    with
        EventStoreStreamsMixin,
        EventStoreStreamsReadMixin,
        EventStoreStreamsAppendMixin,
        EventStoreStreamsDeleteMixin,
        EventStoreStreamsSubscribeMixin {
  EventStoreStreamsClient(
    EventStoreClientSettings settings,
  ) : super(settings: settings, exceptionMap: ExceptionMap);

  /// Converts [GrpcError]s to typed [Exception]s
  static Map<String, GrpcErrorCallback> ExceptionMap =
      <String, GrpcErrorCallback>{
    Exceptions.InvalidTransaction: (e) =>
        InvalidTransactionException.fromError(e),
    Exceptions.WrongExpectedVersion: (e) =>
        WrongExpectedVersionException.fromError(e),
    Exceptions.StreamDeleted: (e) => StreamDeletedException.fromError(e),
    Exceptions.StreamNotFound: (e) => StreamNotFoundException.fromError(e),
    Exceptions.MaximumAppendSizeExceeded: (e) =>
        MaximumAppendSizeExceededException.fromError(e),
    Exceptions.MissingRequiredMetadataProperty: (e) =>
        RequiredMetadataPropertyMissingException.fromError(e),
  };
}