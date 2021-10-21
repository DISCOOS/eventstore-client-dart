/// The exception that is thrown when [EndPoint] discovery fails.
class DiscoveryException implements Exception {
  DiscoveryException(
    this.maxDiscoverAttempts,
  ) : message = 'Failed to discover candidate '
            'in $maxDiscoverAttempts attempts.';

  /// Error message
  final String message;

  /// The configured number of discovery attempts.
  final int maxDiscoverAttempts;

  @override
  String toString() {
    return '$runtimeType{message: $message}';
  }
}
