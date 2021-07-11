class Defaults {
  static const GrpcPort = 2113;
  static const GossipPort = 2114;
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
  static const String Authorization = 'authorization';
  static const String BasicScheme = 'Basic';
  static const String BearerScheme = 'Bearer';

  static const String ConnectionName = 'connection-name';
  static const String RequiresLeader = 'requires-leader';
}
