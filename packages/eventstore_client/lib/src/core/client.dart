import 'package:eventstore_client/eventstore_client.dart';
import 'package:grpc/grpc.dart';

import 'client_io.dart' if (dart.library.html) 'client_web.dart';

abstract class EventStoreClient extends EventStoreClientImpl {
  EventStoreClient({
    required EventStoreClientSettings settings,
    List<ClientInterceptor> interceptors = const [],
    Map<String, GrpcErrorCallback> exceptionMap = const {},
  }) : super(
          settings: settings,
          interceptors: interceptors,
          exceptionMap: exceptionMap,
        );
}
