/// The exception that is thrown when MemberInfo.[apiVersion]
/// does not support requested [EventStoreClientSettings.apiVersion].
class UnsupportedApiVersionException implements Exception {
  /// Constructs a new instance of [UnsupportedApiVersionException]
  UnsupportedApiVersionException(this.message);

  final dynamic message;

  @override
  String toString() {
    return '$runtimeType{message: $message}';
  }
}
