/// Indicates the preferred EventStoreDB node type to connect to.
enum NodePreference {
  /// When attempting connection, prefers leader node.
  leader,

  /// When attempting connection, prefers follower node.
  follower,

  /// When attempting connection, has no node preference.
  random,

  /// When attempting connection, prefers read only replicas.
  read_only_replica,
}

/// Member node states
enum VNodeState {
  initializing,
  discover_leader,
  unknown,
  pre_replica,
  catching_up,
  clone,
  follower,
  pre_leader,
  leader,
  manager,
  shutting_down,
  shutdown,
  read_only_leaderless,
  pre_read_only_replica,
  read_only_replica,
  resigning_leader
}
