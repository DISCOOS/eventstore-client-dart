import 'package:meta/meta.dart';
import 'package:eventstore_client_dart/src/generated/cluster.pbgrpc.dart';
import 'package:grpc/grpc.dart';

import 'interceptors/interseptors.dart';

class EventStoreDBClientBase {
  EventStoreDBClientBase(this.connectionName);

  /// Connection name supplied as metadata to server
  final String connectionName;

  /// Get [EndPoint] for last known leader node
  EndPoint? get leader => _leader;
  EndPoint? _leader;

  @visibleForOverriding
  List<ClientInterceptor> toInterceptors(
    String connectionName,
    List<ClientInterceptor> interceptors,
  ) {
    return [
      TypedExceptionInterceptor(),
      ReportLeaderInterceptor(
        (endpoint) => _leader = endpoint,
      ),
      ConnectionNameInterceptor(connectionName),
      ...interceptors,
    ];
  }
}
