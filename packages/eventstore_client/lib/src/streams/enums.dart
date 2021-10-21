/// Indicates the state of a stream
enum StreamStateType {
  /// Matches any state stream
  any,

  /// Matches no stream exists
  no_stream,

  /// Matches stream exists
  stream_exists,
}

enum ReadState {
  /// Requested read operation succeeded
  ok,

  /// Read operation because stream was not found
  stream_not_found,
}

enum SubscriptionDroppedReason {
  /// Subscription was dropped because the subscription was disposed.
  disposed,

  /// Subscription was dropped because of an error in user code.
  subscriberError,

  /// Subscription was dropped because of a server error.
  serverError
}
