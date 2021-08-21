/// The exception that is thrown when an attempt
/// is made to read or write to a stream that does not exist.
class StreamNotFoundException implements Exception {
  /// Constructs a new instance of [StreamNotFoundException].
  StreamNotFoundException(this.streamId, {this.cause});

  /// The name of the stream.
  final String streamId;

  /// If available, the [Exception] that caused this exception.
  final Exception? cause;
}
