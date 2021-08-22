import 'dart:typed_data';
import 'package:meta/meta.dart';
import 'package:grpc/grpc.dart';
import 'package:universal_io/io.dart';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/endpoint_discoverer.dart';
import 'package:eventstore_client/src/gossip/gossip_client.dart';

import 'call_options.dart';
import 'constants.dart';
import 'exceptions/exceptions.dart';
import 'helpers.dart';
import 'interceptors/interseptors.dart';
import 'operation_options.dart';
import '../security/user_credentials.dart';

abstract class EventStoreClientBase {
  EventStoreClientBase({
    required this.settings,
    Map<String, GrpcErrorCallback> exceptionMap = const {},
  })  : _options = _mergedCallOptionsWith(settings),
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

  /// List of lazily created [ClientChannel]
  final Map<EndPoint, ClientChannel> _channels = {};

  /// List of lazily created [HttpClientCredentials]
  final Map<EndPoint, ChannelCredentials> _credentials = {};

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

  /// Discover node [EndPoint] given current
  /// [EventStoreClientSettings.nodePreference].
  Future<EndPoint> discover() async {
    return _leader = await _leaderDiscoverer.discover();
  }

  /// Shutdown all channels
  Future<void> shutdown() async {
    await Future.wait([
      _leaderDiscoverer.dispose(),
      ..._channels.values.map((e) => e.shutdown()),
    ]);
    _channels.clear();
    _credentials.clear();
  }

  /// @nodoc
  @visibleForOverriding
  CallOptions $getOptions({
    Duration? timeoutAfter,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return _mergedCallOptionsWith(
      settings,
      options: _options,
      timeoutAfter: timeoutAfter,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }

  /// @nodoc
  @visibleForOverriding
  Future<ClientChannel> $getCurrentChannel() async {
    await discover();
    return $getOrAddChannel(_leader!);
  }

  /// @nodoc
  @visibleForOverriding
  ChannelCredentials $getOrAddCredentials(EndPoint endPoint) {
    return _credentials.putIfAbsent(
      endPoint,
      () => settings.useTls
          ? ChannelCredentials.secure(
              certificates: $readHostCertificate(),
              onBadCertificate: (_, __) {
                return true;
              })
          : ChannelCredentials.insecure(),
    );
  }

  /// @nodoc
  @visibleForOverriding
  ClientChannel $getOrAddChannel(EndPoint endPoint) {
    return _channels.putIfAbsent(
      endPoint,
      () => ClientChannel(
        endPoint.address,
        port: endPoint.port,
        options: ChannelOptions(
          credentials: $getOrAddCredentials(endPoint),
          // Workaround for grpc.keepalive_time_ms:
          // > After a duration of this time the client/server pings its peer
          // > to see if the transport is still alive.
          idleTimeout: settings.keepAliveInterval.isNone
              ? Defaults.GrpcIdleTimeout
              : settings.keepAliveTimeout,
          // Workaround for grpc.keepalive_timeout_ms:
          // > After waiting for a duration of this time, if the keepalive
          // > ping sender does not receive the ping ack, it will close
          // > the transport.
          connectionTimeout: settings.keepAliveTimeout.isNone
              ? Defaults.GrpcConnectionTimeout
              : settings.keepAliveTimeout,
        ),
      ),
    );
  }

  /// @nodoc
  @visibleForOverriding
  Uint8List $readHostCertificate() {
    final file = File(settings.publicKeyPath);
    if (!file.existsSync()) {
      throw HostCertificateNotFound(file.absolute.path);
    }
    return file.readAsBytesSync();
  }

  /// @nodoc
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

  /// @nodoc
  @visibleForOverriding
  Future<T> $runRequest<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on Exception catch (error) {
      throw $toTypedException(error);
    }
  }

  /// @nodoc
  @visibleForOverriding
  Exception $toTypedException(Exception error) {
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
    EventStoreClientSettings settings, {
    CallOptions? options,
    Duration? timeoutAfter,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return EventStoreCallOptions.create(
      settings,
      timeoutAfter: timeoutAfter,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    )..mergedWith(options);
  }
}
