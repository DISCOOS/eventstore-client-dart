import 'dart:math';

import 'package:eventstore_client_dart/eventstore_client_dart.dart'
    hide NodePreference;
import 'package:eventstore_client_dart/src/core/enums.dart' as $e;
import 'package:eventstore_client_dart/src/core/endpoint.dart';
import 'package:eventstore_client_dart/src/core/helpers.dart';
import 'package:eventstore_client_dart/src/core/uuid.dart';
import 'package:eventstore_client_dart/src/security/user_credentials.dart';
import 'package:fixnum/fixnum.dart';

import 'operation_options.dart';

class EventStoreClientSettings {
  EventStoreClientSettings({
    this.singleNode,
    this.useTls = true,
    String? connectionName,
    this.defaultCredentials,
    this.gossipSeeds = const [],
    this.batchAppend = Defaults.BatchAppend,
    this.publicKeyPath = Defaults.PublicKeyPath,
    this.gossipTimeout = Defaults.GossipTimeout,
    this.batchAppendSize = Defaults.BatchAppendSize,
    this.nodePreference = Defaults.NodePreference,
    this.operationTimeout = Defaults.OperationTimeout,
    this.keepAliveTimeout = Defaults.KeepAliveTimeout,
    this.keepAliveInterval = Defaults.KeepAliveInterval,
    this.discoveryInterval = Defaults.DiscoveryInterval,
    this.maxDiscoverAttempts = Defaults.MaxDiscoverAttempts,
    this.operationOptions = EventStoreClientOperationOptions.Default,
  }) : connectionName = connectionName ?? 'ES-${UuidV4.newUuid().value.uuid}';

  /// Get default settings for EventStoreDB LTS version
  static final EventStoreClientSettings LTS = v20_10_4;

  /// Get default settings for EventStoreDB v20.10.4
  static final EventStoreClientSettings v20_10_4 = EventStoreClientSettings();

  /// Get default settings for EventStoreDB v21.6
  static final EventStoreClientSettings v21_6_0 = v20_10_4.cloneWith(
    batchAppend: true,
  );

  /// Optional [UserCredentials] to use if none
  /// have been supplied to the operation.
  final UserCredentials? defaultCredentials;

  /// Path to the Certificate Authority (CA) signed certificate
  /// (public key) used by each EventStoreDB node for secure
  /// communication. This setting is only used if [useTls] is enabled.
  final String publicKeyPath;

  /// [EndPoint] to single node
  final EndPoint? singleNode;

  /// An array of [EndPoint]s used to seed gossip.
  final List<EndPoint> gossipSeeds;

  /// The [Duration] after which an attempt to discover gossip will fail.
  final Duration gossipTimeout;

  /// Get [NodePreference]
  final $e.NodePreference nodePreference;

  /// Connection name supplied as metadata to server
  final String connectionName;

  /// True if communicating over a secure channel; otherwise false.
  final bool useTls;

  /// After a duration of [keepAliveInterval] (in milliseconds), if the server
  /// doesn't see any activity, it pings the client to see if the transport is
  ///  still alive.
  final Duration keepAliveInterval;

  /// After having pinged for keepalive check, the server waits for a duration
  /// of [keepAliveTimeout] (in milliseconds). If the connection doesn't have
  /// any activity even after that, it gets closed.
  final Duration keepAliveTimeout;

  /// The polling interval used to discover the [EndPoint]
  final Duration discoveryInterval;

  /// The maximum number of times to attempt [EndPoint] discovery.
  final int maxDiscoverAttempts;

  /// Get operation timeout
  final Duration operationTimeout;

  /// If true, use batch append operation.
  /// Only available with version EventStoreDB 21.6 and above
  final bool batchAppend;

  /// Batch append size used when [batchAppend] is true.
  /// Only available with version EventStoreDB v21.6 and above
  final int batchAppendSize;

  /// The default [EventStoreClientOperationOptions] to use.
  final EventStoreClientOperationOptions operationOptions;

  /// Get address to single node
  Uri? get address => singleNode?.toUri();

  /// Check if connection is on a single node
  bool get isSingleNode => gossipSeeds.isEmpty;

  /// Check if basic authentication should be used
  bool get isBasicAuth => defaultCredentials?.isBasicAuth == true;

  EventStoreClientSettings cloneWith({
    bool? useTls,
    bool? batchAppend,
    EndPoint? singleNode,
    int? batchAppendSize,
    String? publicKeyPath,
    String? connectionName,
    Duration? gossipTimeout,
    int? maxDiscoverAttempts,
    List<EndPoint>? gossipSeeds,
    $e.NodePreference? nodePreference,
    UserCredentials? defaultCredentials,
    EventStoreClientOperationOptions? operationOptions,
    Duration? operationTimeout = Defaults.OperationTimeout,
    Duration? keepAliveTimeout = Defaults.KeepAliveTimeout,
    Duration? keepAliveInterval = Defaults.KeepAliveInterval,
    Duration? discoveryInterval = Defaults.DiscoveryInterval,
  }) =>
      EventStoreClientSettings(
        useTls: useTls ?? this.useTls,
        singleNode: singleNode ?? this.singleNode,
        batchAppend: batchAppend ?? this.batchAppend,
        gossipSeeds: gossipSeeds ?? this.gossipSeeds,
        gossipTimeout: gossipTimeout ?? this.gossipTimeout,
        publicKeyPath: publicKeyPath ?? this.publicKeyPath,
        connectionName: connectionName ?? this.connectionName,
        nodePreference: nodePreference ?? this.nodePreference,
        batchAppendSize: batchAppendSize ?? this.batchAppendSize,
        operationOptions: operationOptions ?? this.operationOptions,
        operationTimeout: operationTimeout ?? this.operationTimeout,
        keepAliveTimeout: keepAliveTimeout ?? this.keepAliveTimeout,
        keepAliveInterval: keepAliveInterval ?? this.keepAliveTimeout,
        discoveryInterval: discoveryInterval ?? this.discoveryInterval,
        defaultCredentials: defaultCredentials ?? this.defaultCredentials,
        maxDiscoverAttempts: maxDiscoverAttempts ?? this.maxDiscoverAttempts,
      );

  /// Parse [connectionString] into [EventStoreClientSettings].
  /// If the connectionString string is not valid as a [Uri],
  /// a [FormatException] is thrown.
  static EventStoreClientSettings parse(String connectionString) =>
      EventStoreClientConnectionString.parse(connectionString);
}

class EventStoreClientConnectionString {
  static const _SchemeSeparator = '://';
  static const _UserInfoSeparator = '@';
  static const _Colon = ':';
  static const _Slash = '/';
  static const _Comma = ',';
  static const _Ampersand = '&';
  static const _Equal = '=';
  static const _QuestionMark = '?';

  static const _Username = 'username';
  static const _Password = 'password';

  static final _MaxValue = Int64.MAX_VALUE.toInt();

  static const String UriSchemeDiscover = 'esdb+discover';
  static const List<String> Schemes = ['esdb', UriSchemeDiscover];

  static const Tls = 'tls';
  static const ConnectionName = 'connectionName';
  static const MaxDiscoverAttempts = 'maxDiscoverAttempts';
  static const DiscoveryInterval = 'discoveryInterval';
  static const GossipTimeout = 'gossipTimeout';
  static const NodePreference = 'nodePreference';
  static const OperationTimeout = 'operationTimeout';
  static const ThrowOnAppendFailure = 'throwOnAppendFailure';
  static const KeepAliveInterval = 'keepAliveInterval';
  static const KeepAliveTimeout = 'keepAliveTimeout';
  static const PublicKeyPath = 'publicKeyPath';
  static const BatchAppend = 'batchAppend';
  static const BatchAppendSize = 'batchAppendSize';

  /// Parse [connectionString] into [EventStoreClientSettings].
  static EventStoreClientSettings parse(String connectionString) {
    var currentIndex = 0;
    final schemeIndex = connectionString.indexOf(_SchemeSeparator);
    if (schemeIndex == -1) {
      throw NoSchemeException(
        "Scheme '$_SchemeSeparator' is missing",
      );
    }
    final scheme = _parseScheme(connectionString.substring(0, schemeIndex));
    currentIndex = schemeIndex + _SchemeSeparator.length;

    final userInfoIndex = connectionString.indexOf(_UserInfoSeparator);
    var userInfo = <String, String>{};
    if (userInfoIndex != -1) {
      userInfo = _parseUserInfo(
        connectionString.substring(currentIndex, userInfoIndex),
      );
      currentIndex = userInfoIndex + _UserInfoSeparator.length;
    }

    var slashIndex = connectionString.indexOf(_Slash, currentIndex);
    var questionMarkIndex = connectionString.indexOf(
      _QuestionMark,
      max(currentIndex, slashIndex),
    );
    var endIndex = connectionString.length;

    if (slashIndex == -1) slashIndex = _MaxValue;
    if (questionMarkIndex == -1) questionMarkIndex = _MaxValue;

    final hostSeparatorIndex = min(
      min(slashIndex, questionMarkIndex),
      endIndex,
    );
    final hosts = _parseHosts(connectionString.substring(
      currentIndex,
      hostSeparatorIndex,
    ));
    currentIndex = hostSeparatorIndex;

    var path = '';
    if (slashIndex != _MaxValue) {
      path = connectionString.substring(
        currentIndex,
        min(questionMarkIndex, endIndex),
      );
    }

    if (path != '' && path != '/') {
      throw ConnectionStringParseException(
        'The specified path must be either an empty string or a forward slash (/)',
        "the following path was found instead: '$path'",
      );
    }

    var options = <String, String>{};
    if (questionMarkIndex != _MaxValue) {
      currentIndex = questionMarkIndex + _QuestionMark.length;
      options = _parseOptions(connectionString.substring(currentIndex));
    }

    final isSingleNode = hosts.length == 1 && scheme != UriSchemeDiscover;
    return EventStoreClientSettings(
      gossipSeeds: isSingleNode ? [] : hosts,
      defaultCredentials: UserCredentials.from(userInfo),
      singleNode: isSingleNode ? hosts.first : null,
      useTls: _getOrDefault<bool>(
        options,
        key: Tls,
        defaultValue: Defaults.UseTls,
        map: (value) => value.toLowerCase() == 'true',
      ),
      connectionName: options[ConnectionName],
      keepAliveTimeout: _getOrDefault<Duration>(
        options,
        key: KeepAliveTimeout,
        defaultValue: Defaults.NoneDuration,
        map: (value) => Duration(milliseconds: int.parse(value)),
      ),
      keepAliveInterval: _getOrDefault<Duration>(
        options,
        key: KeepAliveInterval,
        defaultValue: Defaults.NoneDuration,
        map: (value) => Duration(milliseconds: int.parse(value)),
      ),
      gossipTimeout: _getOrDefault<Duration>(
        options,
        key: GossipTimeout,
        defaultValue: Defaults.GossipTimeout,
        map: (value) => Duration(milliseconds: int.parse(value)),
      ),
      discoveryInterval: _getOrDefault<Duration>(
        options,
        key: DiscoveryInterval,
        defaultValue: Defaults.DiscoveryInterval,
        map: (value) => Duration(milliseconds: int.parse(value)),
      ),
      maxDiscoverAttempts: _getOrDefault<int>(
        options,
        key: MaxDiscoverAttempts,
        defaultValue: Defaults.MaxDiscoverAttempts,
        map: (value) => int.parse(value),
      ),
      publicKeyPath: _getOrDefault<String>(
        options,
        key: PublicKeyPath,
        defaultValue: Defaults.PublicKeyPath,
      ),
      operationTimeout: _getOrDefault<Duration>(
        options,
        key: OperationTimeout,
        defaultValue: Defaults.OperationTimeout,
        map: (value) => Duration(milliseconds: int.parse(value)),
      ),
      nodePreference: _getOrDefault<$e.NodePreference>(
        options,
        key: NodePreference,
        defaultValue: Defaults.NodePreference,
        map: (value) => $e.NodePreference.values.firstWhere(
          (e) => enumName(e).toLowerCase() == value.toLowerCase(),
          orElse: () => Defaults.NodePreference,
        ),
      ),
      batchAppend: _getOrDefault<bool>(
        options,
        key: BatchAppend,
        defaultValue: Defaults.BatchAppend,
        map: (value) => value.toLowerCase() == 'true',
      ),
      batchAppendSize: _getOrDefault<int>(
        options,
        key: BatchAppendSize,
        defaultValue: Defaults.BatchAppendSize,
        map: (value) => int.parse(value),
      ),
    );
  }

  static String _parseScheme(String scheme) {
    if (!Schemes.contains(scheme.toLowerCase())) {
      throw InvalidSchemeException(scheme, Schemes);
    }
    return scheme;
  }

  static Map<String, String> _parseUserInfo(String userInfo) {
    final parts = userInfo.split(_Colon);
    if (parts.length != 2) {
      throw InvalidUserCredentialsException(userInfo);
    }
    return {
      _Username: parts[0],
      _Password: parts[1],
    };
  }

  static List<EndPoint> _parseHosts(String paths) {
    final points = <EndPoint>[];
    for (var path in paths.split(_Comma)) {
      points.add(EndPoint.from(path));
    }
    return points;
  }

  static Map<String, String> _parseOptions(String pairs) {
    final options = <String, String>{};
    for (var pair in pairs.split(_Ampersand)) {
      final parts = pair.split(_Equal);
      if (parts.length != 2) {
        throw InvalidKeyValuePairException(pair);
      }
      if (options.containsKey(parts[0])) {
        throw DuplicateKeyException(parts[0]);
      }
      options[parts[0]] = parts[1];
    }
    return options;
  }

  static T _getOrDefault<T>(
    Map<String, String> options, {
    required String key,
    required T defaultValue,
    T Function(String)? map,
  }) {
    final value = options[key];
    return map == null
        ? (value ?? defaultValue)! as T
        : value == null
            ? defaultValue!
            : map(value);
  }
}
