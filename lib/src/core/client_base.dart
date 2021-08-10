import 'package:eventstore_client_dart/src/core/settings.dart';
import 'package:eventstore_client_dart/src/core/typedefs.dart';
import 'package:meta/meta.dart';
import 'package:eventstore_client_dart/src/generated/cluster.pbgrpc.dart';
import 'package:grpc/grpc.dart';

import 'constants.dart';
import 'exceptions/exceptions.dart';
import 'interceptors/interseptors.dart';

abstract class EventStoreClientBase {
  EventStoreClientBase({
    required this.settings,
    required this.channel,
    this.options,
    Map<String, GrpcErrorCallback> exceptionMap = const {},
  }) : _exceptionMap = {
          Exceptions.NotLeader: (error) => NotLeaderException.fromCause(error),
          Exceptions.AccessDenied: (error) =>
              AccessDeniedException.fromCause(error),
          ...exceptionMap,
        };

  /// GRPC [ClientChannel] instance
  final ClientChannel channel;

  /// GRPC [CallOptions] instance
  final CallOptions? options;

  /// Connection name supplied as metadata to server
  final EventStoreClientSettings settings;

  /// Converts [GrpcError]s to typed [Exception]s
  final Map<String, GrpcErrorCallback> _exceptionMap;

  /// Get [EndPoint] for last known leader node
  EndPoint? get leader => _leader;
  EndPoint? _leader;

  @visibleForOverriding
  List<ClientInterceptor> toInterceptors(
    String connectionName, {
    List<ClientInterceptor> interceptors = const [],
  }) {
    return [
      ...interceptors,
      ConnectionNameInterceptor(connectionName),
    ];
  }

  @visibleForOverriding
  Future<T> runRequest<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on Exception catch (error) {
      // This will throw if error is typed
      _toTypedException(error);
      rethrow;
    }
  }

  void _toTypedException(Object error) {
    if (error is GrpcError) {
      final key = error.trailers?[Exceptions.ExceptionKey];
      final callback = _exceptionMap[key];
      final exception = callback == null ? error : callback(error);
      _checkNewLeader(exception);
      throw exception;
    }
  }

  void _checkNewLeader(Object error) {
    if (error is NotLeaderException) {
      _leader = error.leader;
    }
  }
}
