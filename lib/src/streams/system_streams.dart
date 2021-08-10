/// A collection of constants and methods to identify streams.
class SystemStreams {
  /// A stream containing all events in the EventStoreDB transaction file.
  static const String AllStream = '\$all';

  /// A stream containing links pointing to each stream in the EventStoreDB.
  static const String StreamsStream = '\$streams';

  /// A stream containing system settings.
  static const String SettingsStream = '\$settings';

  /// A stream containing statistics.
  static const String StatsStreamPrefix = '\$stats';

  /// Returns True if the stream is a system stream.
  static bool isSystemStream(String streamId) =>
      streamId.isNotEmpty && streamId[0] == '\$';

  /// Returns the metadata stream of the stream.
  static String metaStreamOf(String streamId) => '\$\$$streamId';

  /// Returns true if the stream is a metadata stream.
  static bool isMetaStream(String streamId) =>
      streamId.substring(0, 2) == '\$\$';

  /// Returns the original stream of the metadata stream.
  static String originalStreamOf(String metaStreamId) =>
      metaStreamId.substring(2);
}
