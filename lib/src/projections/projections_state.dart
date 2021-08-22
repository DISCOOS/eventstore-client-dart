import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/projections.pbgrpc.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';

/// Operations for updating user-defined projections.
mixin EventStoreProjectionsState on EventStoreClientBase {
  Future<ProjectionsClient> _getClient() async {
    return ProjectionsClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }

  /// Gets the state of an projection as an untyped json document.
  /// The [name] argument identifies the projection state.
  /// The [partition] argument identifies the partition of given projection.
  Future<JsonDocument> getState(
    String name, {
    String? partition,
    UserCredentials? userCredentials,
  }) async {
    return $runRequest<JsonDocument>(() async {
      final client = await _getClient();

      final options = StateReq_Options()..name = name;
      if (partition != null) {
        options.partition = partition;
      }

      final response = await client.state(
        StateReq()..options = options,
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
      return response.state.toProto3Json();
    });
  }

  /// Gets the result of an projection as an untyped json document.
  /// The [name] argument identifies the projection result.
  /// The [partition] argument identifies the partition of given projection.
  Future<JsonDocument> getResult(
    String name, {
    String? partition,
    UserCredentials? userCredentials,
  }) async {
    return $runRequest<JsonDocument>(() async {
      final client = await _getClient();

      final options = ResultReq_Options()..name = name;
      if (partition != null) {
        options.partition = partition;
      }

      final response = await client.result(
        ResultReq()..options = options,
        options: $getOptions(
          userCredentials: userCredentials,
        ),
      );
      return response.result.toProto3Json();
    });
  }
}
