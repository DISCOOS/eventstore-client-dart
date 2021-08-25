import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/projections/projections_control.dart';
import 'package:eventstore_client/src/projections/projections_create.dart';
import 'package:eventstore_client/src/projections/projections_state.dart';
import 'package:eventstore_client/src/projections/projections_statistics.dart';
import 'package:eventstore_client/src/projections/projections_update.dart';

/// Class implementing the {@macro projections_mgmnt_api}.
///
/// Projections require the event body of events queried for to be in JSON.
///
/// For more information about defining queries, see the
/// {@macro user_defined_projections_api}. See also {@macro server_projections}.
///
class EventStoreProjectionsClient extends EventStoreClientBase
    with
        EventStoreProjectionsState,
        EventStoreProjectionsCreate,
        EventStoreProjectionsUpdate,
        EventStoreProjectionsControl,
        EventStoreProjectionsStatistics {
  EventStoreProjectionsClient(
    EventStoreClientSettings settings,
  ) : super(settings: settings);
}
