import 'package:eventstore_client_dart/eventstore_client_dart.dart' as $a;

// Use the largest 64-bit signed integer as infinite value
const Infinite = 9223372036854775807;

class Defaults {
  static const GrpcPort = 2113;
  static const GossipPort = 2114;
  static const bool UseTls = true;

  static const int MaxDiscoverAttempts = 10;
  static const String PublicKeyPath = 'ca.crt';
  static const Duration GossipTimeout = Duration(seconds: 5);
  static const Duration OperationTimeout = Duration(seconds: 30);
  static const Duration KeepAliveTimeout = Duration(seconds: 10);
  static const Duration KeepAliveInterval = Duration(seconds: 10);
  static const Duration DiscoveryInterval = Duration(milliseconds: 100);
  static const $a.NodePreference NodePreference = $a.NodePreference.leader;

  static const Duration NoneDuration = Duration(milliseconds: -1);
  static const Duration InfiniteDuration = Duration(milliseconds: Infinite);

  // From grpc-dart/options.dart file
  static const Duration GrpcIdleTimeout = Duration(minutes: 5);
  static const Duration GrpcConnectionTimeout = Duration(minutes: 50);

  /// Supported from EventStoreDB v21.6 (as of Aug 2021, LTS is v20.10).
  static const BatchAppend = false;

  /// Supported from EventStoreDB v21.6 (as of Aug 2021, LTS is v20.10).
  static const int BatchAppendSize = 3 * 1024 * 1024;
}

class ImageTags {
  static const LTS = v20_10_4;
  static const v21_6_0 = '21.6.0-buster-slim';
  static const v20_10_4 = '20.10.4-buster-slim';
}

class Exceptions {
  static const String ExceptionKey = 'exception';

  static const String AccessDenied = 'access-denied';
  static const String InvalidTransaction = 'invalid-transaction';
  static const String StreamDeleted = 'stream-deleted';
  static const String WrongExpectedVersion = 'wrong-expected-version';
  static const String StreamNotFound = 'stream-not-found';
  static const String MaximumAppendSizeExceeded =
      'maximum-append-size-exceeded';
  static const String MissingRequiredMetadataProperty =
      'missing-required-metadata-property';
  static const String NotLeader = 'not-leader';

  static const String PersistentSubscriptionFailed =
      'persistent-subscription-failed';
  static const String PersistentSubscriptionDoesNotExist =
      'persistent-subscription-does-not-exist';
  static const String PersistentSubscriptionExists =
      'persistent-subscription-exists';
  static const String MaximumSubscribersReached = 'maximum-subscribers-reached';
  static const String PersistentSubscriptionDropped =
      'persistent-subscription-dropped';

  static const String UserNotFound = 'user-not-found';
  static const String UserConflict = 'user-conflict';

  static const String ScavengeNotFound = 'scavenge-not-found';

  static const String ExpectedVersion = 'expected-version';
  static const String ActualVersion = 'actual-version';
  static const String StreamName = 'stream-name';
  static const String GroupName = 'group-name';
  static const String Reason = 'reason';
  static const String MaximumAppendSize = 'maximum-append-size';
  static const String RequiredMetadataProperties =
      'required-metadata-properties';
  static const String ScavengeId = 'scavenge-id';
  static const String LeaderEndpointHost = 'leader-endpoint-host';
  static const String LeaderEndpointPort = 'leader-endpoint-port';

  static const String LoginName = 'login-name';
}

class Metadata {
  static const String Type = 'type';
  static const String Created = 'created';
  static const String ContentType = 'content-type';
  static const List<String> RequiredMetadata = [Type, ContentType];
}

class ContentTypes {
  static const String ApplicationJson = 'application/json';
  static const String ApplicationOctetStream = 'application/octet-stream';
}

class Headers {
  static const String BasicScheme = 'Basic';
  static const String BearerScheme = 'Bearer';

  static const String Authorization = 'authorization';
  static const String ConnectionName = 'connection-name';
  static const String RequiresLeader = 'requires-leader';
}

/// Constants for information in stream metadata
class SystemMetadata {
  /// List of [StringMetadata] fields
  static const List<String> fields = [
    Acl,
    MaxAge,
    MaxCount,
    CacheControl,
    TruncateBefore,
  ];

  /// The definition of the MaxAge value assigned to stream metadata
  /// Setting this allows all events older than the limit to be deleted
  static const String MaxAge = '\$maxAge';

  /// The definition of the MaxCount value assigned to stream metadata
  /// setting this allows all events with a sequence less than current -maxcount to be deleted
  static const String MaxCount = '\$maxCount';

  ///The definition of the Truncate Before value assigned to stream metadata
  ///setting this allows all events prior to the integer value to be deleted
  static const String TruncateBefore = '\$tb';

  /// Sets the cache control in seconds for the head of the stream.
  static const String CacheControl = '\$cacheControl';

  /// The acl definition in metadata
  static const String Acl = '\$acl';

  /// Permission to read from a stream
  static const String AclRead = '\$r';

  /// Permission to write to a stream
  static const String AclWrite = '\$w';

  /// Permission to delete a stream
  static const String AclDelete = '\$d';

  /// Permission to read metadata
  static const String AclMetaRead = '\$mr';

  /// Permission to write metadata
  static const String AclMetaWrite = '\$mw';

  /// The user default acl stream
  static const String UserStreamAcl = '\$userStreamAcl';

  /// She system stream defaults acl stream
  static const String SystemStreamAcl = '\$systemStreamAcl';
}

/// Constants for System event types
class SystemEventTypes {
  /// Event type for stream deleted
  static const String StreamDeleted = '\$streamDeleted';

  /// Event type for statistics
  static const String StatsCollection = '\$statsCollected';

  /// Event type for linkTo
  static const String LinkTo = '\$>';

  /// Event type for stream metadata
  static const String StreamMetadata = '\$metadata';

  /// Event type for the system settings
  static const String Settings = '\$settings';
}
