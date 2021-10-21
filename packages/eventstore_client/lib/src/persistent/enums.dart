/// Actions to be taken by server in the case of a client NAK of [ResolvedEvent]
enum PersistentSubscriptionNackEventAction {
  /// Client unknown on action. Let server decide
  unknown,

  /// Park message do not resend. Put on poison queue
  park,

  /// Explicitly retry the message.
  retry,

  /// Skip this message do not resend do not put in poison queue
  skip,
}

///  System supported consumer strategies for use with persistent subscriptions.
enum SystemConsumerStrategies {
  /// Distributes events to a single client until it is full,
  /// then round robin to the next client.
  dispatchToSingle,

  /// Distribute events to each client in a round robin fashion.
  roundRobin,

  /// Distribute events of the same streamId to the same client until
  /// it disconnects on a best efforts basis. Designed to be used with
  /// indexes such as the category projection.
  pinned,
}
