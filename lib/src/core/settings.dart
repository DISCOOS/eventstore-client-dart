import 'dart:math';

import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/constants.dart';
import 'package:eventstore_client_dart/src/core/endpoint.dart';
import 'package:eventstore_client_dart/src/security/user_credentials.dart';
import 'package:fixnum/fixnum.dart';
import 'package:uuid/uuid.dart';

import 'operation_options.dart';

class EventStoreClientSettings {
  EventStoreClientSettings({
    this.singleNode,
    this.useTls = true,
    String? connectionName,
    this.defaultCredentials,
    this.gossipSeeds = const [],
    this.publicKeyPath = Defaults.PublicKeyPath,
    this.nodePreference = Defaults.NodePreferenceType,
    this.operationTimeout = Defaults.OperationTimeout,
    this.keepAliveTimeout = Defaults.KeepAliveTimeout,
    this.keepAliveInterval = Defaults.KeepAliveInterval,
    this.discoveryInterval = Defaults.DiscoveryInterval,
    this.maxDiscoverAttempts = Defaults.MaxDiscoverAttempts,
  }) : connectionName = connectionName ?? 'ES-${Uuid().v4()}' {
    assert(
      singleNode != null || gossipSeeds.isNotEmpty,
      "'singleNode' or 'gossipSeeds' must be given",
    );
  }

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

  /// Get [NodePreferenceType]
  final NodePreferenceType nodePreference;

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

  /// Get address to single node
  Uri? get address => singleNode?.toUri();

  /// Check if connection is on a single node
  bool get isSingleNode => gossipSeeds.isEmpty;

  /// Check if basic authentication should be used
  bool get isBasicAuth => defaultCredentials?.isBasicAuth == true;

  /// The default [EventStoreClientOperationOptions] to use.
  EventStoreClientOperationOptions get operationOptions =>
      EventStoreClientOperationOptions.Default;

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
  static const TlsVerifyCert = 'tlsVerifyCert';
  static const OperationTimeout = 'operationTimeout';
  static const ThrowOnAppendFailure = 'throwOnAppendFailure';
  static const KeepAliveInterval = 'keepAliveInterval';
  static const KeepAliveTimeout = 'keepAliveTimeout';

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
        key: 'tls',
        defaultValue: true,
        map: (value) => value.toLowerCase() == 'true',
      ),
      connectionName: options[ConnectionName],
      keepAliveTimeout: _getOrDefault<Duration>(
        options,
        key: 'keepAliveTimeout',
        defaultValue: Defaults.DisableKeepAliveTimeout,
        map: (value) => Duration(milliseconds: int.parse(value)),
      ),
      keepAliveInterval: _getOrDefault<Duration>(
        options,
        key: 'keepAliveInterval',
        defaultValue: Defaults.DisableKeepAliveInterval,
        map: (value) => Duration(milliseconds: int.parse(value)),
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
        ? (value as T ?? defaultValue)!
        : value == null
            ? defaultValue!
            : map(value);
  }
}
