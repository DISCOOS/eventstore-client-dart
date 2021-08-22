/// A community developed gRPC client library for EventStoreDB
library eventstore_client;

import 'package:eventstore_client/src/core/client_base.dart';
import 'package:eventstore_client/src/core/settings.dart';
import 'package:eventstore_client/src/streams/streams_client.dart';

export 'package:grpc/grpc.dart';

export 'src/cluster/cluster_info.dart';
export 'src/cluster/enums.dart';
export 'src/cluster/member_info.dart';
export 'src/core/client_base.dart';
export 'src/core/constants.dart';
export 'src/core/endpoint.dart';
export 'src/core/endpoint_discoverer.dart';
export 'src/core/event_data.dart';
export 'src/core/event_record.dart';
export 'src/core/resolved_event.dart';
export 'src/core/exceptions/exceptions.dart';
export 'src/core/event_record.dart';
export 'src/core/log_position.dart';
export 'src/core/operation_options.dart';
export 'src/core/settings.dart';
export 'src/core/stream_position.dart';
export 'src/core/stream_revision.dart';
export 'src/core/stream_state.dart';
export 'src/core/system_events.dart';
export 'src/core/typedefs.dart';
export 'src/core/uuid.dart';
export 'src/gossip/gossip_client.dart';
export 'src/gossip/endpoint_discoverer.dart';
export 'src/projections/projections_client.dart';
export 'src/projections/projection_details.dart';
export 'src/security/system_groups.dart';
export 'src/security/user_credentials.dart';
export 'src/streams/delete_results.dart';
export 'src/streams/enums.dart';
export 'src/streams/event_type_filter.dart';
export 'src/streams/read_filter.dart';
export 'src/streams/stream_acl.dart';
export 'src/streams/stream_filter.dart';
export 'src/streams/streams_client.dart';
export 'src/streams/stream_metadata.dart';
export 'src/streams/stream_metadata_result.dart';
export 'src/streams/subscription_checkpoint.dart';
export 'src/streams/subscription_filter_options.dart';
export 'src/streams/system_streams.dart';
export 'src/streams/write_results.dart';

class EventStoreClient extends EventStoreClientBase
    with EventStoreStreamsClient {
  EventStoreClient(EventStoreClientSettings settings)
      : super(
          settings: settings,
          exceptionMap: EventStoreStreamsClient.ExceptionMap,
        );
}
