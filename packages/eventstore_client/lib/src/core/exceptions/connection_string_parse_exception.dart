class ConnectionStringParseException implements Exception {
  ConnectionStringParseException(this.message, this.cause);
  final String message;
  final Object? cause;

  @override
  String toString() {
    return '$runtimeType{message: $message, cause: $cause}';
  }
}
