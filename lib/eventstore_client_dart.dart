/// A client library for EventStoreDB 20.x and above
library eventstore_client_dart;

import 'package:eventstore_client_dart/src/core/client_base.dart';
import 'package:eventstore_client_dart/src/core/settings.dart';
import 'package:eventstore_client_dart/src/streams/streams_client.dart';

export 'package:grpc/grpc.dart';

export 'src/cluster/cluster_info.dart';
export 'src/cluster/member_info.dart';
export 'src/core/client_base.dart';
export 'src/core/constants.dart';
export 'src/core/endpoint.dart';
export 'src/core/event_data.dart';
export 'src/core/exceptions/exceptions.dart';
export 'src/core/enums.dart';
export 'src/core/log_position.dart';
export 'src/core/operation_options.dart';
export 'src/core/settings.dart';
export 'src/core/stream_position.dart';
export 'src/core/stream_revision.dart';
export 'src/core/stream_state.dart';
export 'src/core/typedefs.dart';
export 'src/security/system_groups.dart';
export 'src/security/user_credentials.dart';
export 'src/streams/delete_results.dart';
export 'src/streams/read_results.dart';
export 'src/streams/stream_acl.dart';
export 'src/streams/streams_client.dart';
export 'src/streams/stream_metadata.dart';
export 'src/streams/stream_metadata_result.dart';
export 'src/streams/write_results.dart';

class EventStoreClient extends EventStoreClientBase
    with EventStoreStreamsClient {
  EventStoreClient(EventStoreClientSettings settings)
      : super(
          settings: settings,
          exceptionMap: EventStoreStreamsClient.ExceptionMap,
        );
}
