/// Indicates the state of a stream
enum StreamStateType {
  /// Matches any state stream
  any,

  /// Matches no stream exists
  no_stream,

  /// Matches stream exists
  stream_exists,
}

/// Indicates the preferred EventStoreDB node type to connect to.
enum NodePreferenceType {
  /// When attempting connection, prefers leader node.
  leader,

  /// When attempting connection, prefers follower node.
  follower,

  /// When attempting connection, has no node preference.
  random,

  /// When attempting connection, prefers read only replicas.
  read_only_replica,
}
