import 'dart:typed_data';
import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/endpoint_discoverer.dart';
import 'package:eventstore_client_dart/src/gossip/gossip_client.dart';
import 'package:meta/meta.dart';
import 'package:grpc/grpc.dart';
import 'package:universal_io/io.dart';

import 'call_options.dart';
import 'constants.dart';
import 'exceptions/exceptions.dart';
import 'interceptors/interseptors.dart';
import 'operation_options.dart';
import '../security/user_credentials.dart';

abstract class EventStoreClientBase {
  EventStoreClientBase({
    required this.settings,
    CallOptions? options,
    Map<String, GrpcErrorCallback> exceptionMap = const {},
  })  : _options = _mergedCallOptionsWith(settings, options),
        _exceptionMap = {
          Exceptions.NotLeader: (error) => NotLeaderException.fromCause(error),
          Exceptions.AccessDenied: (error) =>
              AccessDeniedException.fromCause(error),
          ...exceptionMap,
        },
        _leaderDiscoverer = settings.isSingleNode
            ? SingleNodeEndpointDiscoverer(settings.singleNode!.toUri())
            : GossipBasedEndpointDiscoverer(EventStoreGossipClient(settings));

  /// GRPC [CallOptions] instance
  final CallOptions? _options;

  /// [leader] is lazily fetched or created on next get
  late EndPoint? _leader;

  /// [channel] is lazily fetched or created on next get
  late ClientChannel _channel;

  /// [channel] is lazily fetched or created on next get from this list
  final Map<EndPoint, ClientChannel> _channels = {};

  /// Connection name supplied as metadata to server
  final EventStoreClientSettings settings;

  /// Converts [GrpcError]s to typed [Exception]s
  final Map<String, GrpcErrorCallback> _exceptionMap;

  /// Discover current [leader]
  final EndpointDiscoverer _leaderDiscoverer;

  /// Get [EndPoint] for last known leader node.
  ///  If connecting to a single node, this returns
  ///  [EventStoreClientSettings.singleNode].
  EndPoint get leader {
    if (settings.isSingleNode) {
      _leader = settings.singleNode!;
    } else {
      _leader ??= settings.gossipSeeds.first;
    }
    return _leader!;
  }

  /// Get current [ClientChannel] instance
  ClientChannel get channel => _channel;

  /// Shutdown all channels
  Future<void> shutdown() async {
    await Future.wait([
      _leaderDiscoverer.dispose(),
      ..._channels.values.map((e) => e.shutdown()),
    ]);
    _channels.clear();
  }

  @visibleForOverriding
  CallOptions $getOptions({
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return _mergedCallOptionsWith(
      settings,
      _options,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }

  @visibleForOverriding
  Future<ClientChannel> $getCurrentChannel() async {
    _leader = await _leaderDiscoverer.discover();
    return $getOrAddChannel(_leader!);
  }

  @visibleForOverriding
  ClientChannel $getOrAddChannel(EndPoint endPoint) {
    return _channels.putIfAbsent(
      endPoint,
      () => ClientChannel(
        endPoint.address,
        port: endPoint.port,
        options: ChannelOptions(
          credentials: settings.useTls
              ? ChannelCredentials.secure(
                  certificates: $readHostCertificate(),
                  onBadCertificate: (_, __) {
                    return true;
                  },
                )
              : ChannelCredentials.insecure(),
        ),
      ),
    );
  }

  @visibleForOverriding
  Uint8List $readHostCertificate() {
    final file = File(settings.publicKeyPath);
    if (!file.existsSync()) {
      throw HostCertificateNotFound(file.absolute.path);
    }
    return file.readAsBytesSync();
  }

  @visibleForOverriding
  List<ClientInterceptor> $toInterceptors(
    String connectionName, {
    List<ClientInterceptor> interceptors = const [],
  }) {
    return [
      ...interceptors,
      ConnectionNameInterceptor(connectionName),
    ];
  }

  @visibleForOverriding
  Future<T> $runRequest<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on Exception catch (error) {
      throw _toTypedException(error);
    }
  }

  Exception _toTypedException(Exception error) {
    if (error is GrpcError) {
      final key = error.trailers?[Exceptions.ExceptionKey];
      final callback = _exceptionMap[key];
      if (callback != null) {
        return _checkNewLeader(
          callback(error),
        );
      }

      switch (error.code) {
        case StatusCode.unavailable:
          if (error.message?.toLowerCase() == 'deadline exceeded') {
            return GrpcError.deadlineExceeded(
              error.message,
              error.details,
              error.rawResponse,
            );
          }
          break;
        case StatusCode.unauthenticated:
          return NotAuthenticatedException(
            error.message,
            cause: error,
          );
      }
    }
    return error;
  }

  Exception _checkNewLeader(Exception ex) {
    if (ex is NotLeaderException) {
      _leader = ex.leader as EndPoint?;
    }
    return ex;
  }

  static CallOptions _mergedCallOptionsWith(
    EventStoreClientSettings settings,
    CallOptions? options, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return EventStoreCallOptions.create(
      settings,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    )..mergedWith(options);
  }
}
