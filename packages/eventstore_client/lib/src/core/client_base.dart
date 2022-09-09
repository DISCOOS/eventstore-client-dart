import 'dart:async';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/code.pb.dart';
import 'package:grpc/grpc.dart' show ChannelCredentials, ChannelOptions;
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpc/service_api.dart';
import 'package:meta/meta.dart';
import 'package:pub_semver/pub_semver.dart';

import 'call_options.dart';
import 'helpers.dart';
import 'interceptors/interceptors.dart';

class Versions {
  Versions._({
    required this.client,
    this.server,
  });
  final Api client;
  final Api? server;
}

class Api {
  Api._(this.version);
  final String version;
}

abstract class EventStoreClientBase {
  final List<ClientInterceptor> _interceptors;

  EventStoreClientBase({
    required this.settings,
    List<ClientInterceptor> interceptors = const [],
    Map<String, GrpcErrorCallback> exceptionMap = const {},
  })  : _interceptors = interceptors,
        _api = Versions._(
          client: Api._(settings.apiVersion),
        ),
        _options = _mergedCallOptionsWith(settings),
        _exceptionMap = {
          Exceptions.NotLeader: (error) => NotLeaderException.fromCause(error),
          Exceptions.AccessDenied: (error) =>
              AccessDeniedException.fromCause(error),
          ...exceptionMap,
        };

  /// GRPC [CallOptions] instance
  final CallOptions? _options;

  /// [leader] is lazily fetched or created on next get
  late EndPoint? _leader;

  /// List of lazily created [GrpcOrGrpcWebClientChannel]
  final Map<EndPoint, GrpcOrGrpcWebClientChannel> _channels = {};

  /// List of lazily created [ChannelCredentials]
  final Map<EndPoint, ChannelCredentials> _credentials = {};

  /// Connection name supplied as metadata to server
  final EventStoreClientSettings settings;

  /// Get api versions. If [verify] is not invoked,
  /// [Versions.server] is null.
  Versions get api => _api;
  Versions _api;
  String get _version => (api.server ?? api.client).version;

  /// Converts [GrpcError]s to typed [Exception]s
  final Map<String, GrpcErrorCallback> _exceptionMap;

  /// Discover current [leader]
  EndpointDiscoverer? _leaderDiscoverer;

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
    _leaderDiscoverer ??= settings.isSingleNode
        ? SingleNodeEndpointDiscoverer(settings.singleNode!.toUri(
            settings.useTls,
          ))
        : GossipBasedEndpointDiscoverer(EventStoreGossipClient(settings));

    return _leader = await _leaderDiscoverer!.discover();
  }

  /// Verify that [EventStoreClientSettings.apiVersion]
  /// is compatible with server version. Throws a
  /// [UnsupportedApiVersionException] if
  /// [MemberInfo.apiVersion] is incompatible with
  /// requested [EventStoreClientSettings.apiVersion].
  Future<void> verify() async {
    if (_shouldVerify) {
      final version = await _getServerApiVersion();
      _api = Versions._(
        client: Api._(settings.apiVersion),
        server: Api._(version),
      );
      final constraint = VersionConstraint.parse(
        '<=${_api.server!.version}',
      );
      final isSupported = constraint.allows(Version.parse(
        settings.apiVersion,
      ));
      if (!isSupported) {
        throw UnsupportedApiVersionException(
          'Server version ${_api.server!.version} is not supported '
          'for node $leader. Requested version is ${settings.apiVersion}.',
        );
      }
      _shouldVerify = false;
    }
  }

  Future<String> _getServerApiVersion() async {
    await discover();
    final node = await getNodeInfo(
      leader,
      settings: settings,
      channelCredentials: $getOrAddCredentials(leader),
    );
    return node.apiVersion;
  }

  bool _shouldVerify = true;

  /// Shutdown all channels
  Future<void> shutdown() async {
    await Future.wait([
      if (_leaderDiscoverer != null) _leaderDiscoverer!.dispose(),
      ..._channels.values.map((e) => e.shutdown()),
    ]);
    _channels.clear();
    _credentials.clear();
  }

  /// Check if given [feature] is supported by [api].
  bool isFeatureSupported(ApiFeature feature) {
    return feature.allows(_version);
  }

  /// @nodoc
  @visibleForOverriding
  void $verifyFeatureAllowed(ApiFeature feature) {
    if (!isFeatureSupported(feature)) {
      throw FeatureNotSupportedException(feature, _version);
    }
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
  Future<GrpcOrGrpcWebClientChannel> $getCurrentChannel() async {
    await discover();
    return $getOrAddChannel(_leader!);
  }

  /// @nodoc
  @visibleForOverriding
  Future<ChannelCredentials> $getCurrentCredentials() async {
    await discover();
    return $getOrAddCredentials(_leader!);
  }

  /// @nodoc
  @visibleForOverriding
  ChannelCredentials $getOrAddCredentials(EndPoint endPoint) {
    return _credentials.putIfAbsent(
      endPoint,
      () => settings.useTls
          ? ChannelCredentials.secure(
              // If not provided, the default trust store is used.
              certificates: readHostCertificate(settings),
              onBadCertificate: (cert, host) {
                return settings.tlsSetup.onBadCertificate != null
                    // Use supplied bad cert callback if provided
                    ? settings.tlsSetup.onBadCertificate!(
                        cert,
                        host,
                        endPoint.port,
                      )
                    // else if verifyCert is true, bad certs are not allowed
                    : !settings.tlsSetup.verifyCert;
              },
            )
          : ChannelCredentials.insecure(),
    );
  }

  /// @nodoc
  @visibleForOverriding
  GrpcOrGrpcWebClientChannel $getOrAddChannel(EndPoint endPoint) {
    return _channels.update(
      endPoint,
      (_) => _,
      ifAbsent: () => _createChannel(endPoint),
    );
  }

  GrpcOrGrpcWebClientChannel _createChannel(EndPoint endPoint) {
    return GrpcOrGrpcWebClientChannel.grpc(
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
    );
  }

  /// @nodoc
  @visibleForOverriding
  List<ClientInterceptor> $toInterceptors(
    String connectionName, {
    List<ClientInterceptor> interceptors = const [],
  }) {
    return [
      ...interceptors,
      ..._interceptors,
      ConnectionNameInterceptor(connectionName),
    ];
  }

  /// Executes a single request against the server. The call is retried
  /// [EventStoreClientSettings.maxAttempt]s on
  /// IMPORTANT: Only ONE request against the node should be attempted in
  /// each [call] to ensure atomic operation against the server (the [call]
  /// should be pure - no side effects).
  /// @nodoc
  @visibleForOverriding
  Future<T> $runRequest<T>(
    Future<T> Function() call, {
    bool retry = true,
    EndPoint? endPoint,
  }) =>
      _run(
        call,
        retry: retry,
        attempt: 1,
        endPoint: endPoint,
        maxAttempt: settings.maxRetries,
      );

  Future<T> _run<T>(
    Future<T> Function() call, {
    required bool retry,
    EndPoint? endPoint,
    required int attempt,
    required int maxAttempt,
  }) async {
    try {
      return await call();
    } on Exception catch (error) {
      if (retry && await _canRetry(error, attempt, maxAttempt)) {
        return _run(
          call,
          retry: true,
          endPoint: endPoint,
          attempt: ++attempt,
          maxAttempt: maxAttempt,
        );
      }
      throw $toTypedException(error);
    }
  }

  /// Retry is allowed when attempt is less than maxAttempt and
  /// one of the following conditions are met:
  ///   1. gRPC error code UNAVAILABLE and NOT an handshake error
  ///   2. StreamException error from http2 StreamHandler
  /// Returns true of retry should be attempted, false otherwise
  FutureOr<bool> _canRetry(
    Exception error,
    int attempt, // 1-based
    int maxAttempt,
  ) {
    assert(attempt > 0, 'attempts is a 1-based counter');
    if (attempt < maxAttempt && error is GrpcError) {
      if (error.code == Code.UNAVAILABLE.value && !_isHandshakeError(error)) {
        // The service is currently unavailable. This is most likely a
        // transient condition, which can be corrected by retrying with
        // a backoff. Note that it is not always safe to retry
        // non-idempotent operations. HTTP Mapping: 503 Service Unavailable
        //
        // Backoff exponentially starting on first attempt
        return onBackoff<bool>(attempt, true);
      } else if (error.message?.startsWith('StreamException') == true) {
        // Sometimes a request throws
        //
        //   "gRPC Error (code: 2, codeName: UNKNOWN, message:
        //   StreamException(stream id: 9): Remote end was telling us to stop.
        //   This stream was not processed and can therefore be retried
        //   (on a new connection)., details: null, rawResponse: null,
        //   trailers: {})"
        //
        // It is thrown by the package:http2 StreamHandler that
        // multiplexes several individual streams on a single connection
        // to the server. There is probably something wrong with the way
        // grpc-dart handles these errors. This workaround is as indicated to
        // retry the request once more on a new client connection.
        //
        // This allows for a immediate retry the first time,
        // the with exponential backoff on the following
        return onBackoff<bool>(attempt - 1, true);
      }
    }
    return false;
  }

  /// @nodoc
  @visibleForOverriding
  Exception $toTypedException(Exception error) {
    if (error is GrpcError) {
      final key = error.trailers?[Exceptions.ExceptionKey];
      final callback = _exceptionMap[key ?? error.codeName];
      if (callback != null) {
        return _checkNewLeader(
          callback(error),
        );
      }

      switch (error.code) {
        case StatusCode.unavailable:
          if (_isHandshakeError(error)) {
            return CertificateVerifyFailed.fromCause(error);
          }
          if (_isDeadlineExceededError(error)) {
            return GrpcError.deadlineExceeded(
              error.message,
              error.details,
              error.rawResponse,
            );
          }
          break;
        case StatusCode.outOfRange:
          return ArgumentOutOfRangeException.fromCause(
            error,
          );
        case StatusCode.unauthenticated:
          return NotAuthenticatedException(
            error.message,
            cause: error,
          );
      }
    }
    return error;
  }

  bool _isDeadlineExceededError(GrpcError error) =>
      error.message?.toLowerCase() == 'deadline exceeded';

  bool _isHandshakeError(GrpcError error) {
    final msg = '${error.message}'.toUpperCase();
    return ['HANDSHAKE', 'CERTIFICATE_VERIFY_FAILED']
        .any((test) => msg.contains(test));
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
