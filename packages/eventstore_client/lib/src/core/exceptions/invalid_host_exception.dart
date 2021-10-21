import 'connection_string_parse_exception.dart';

/// The exception that is thrown when an invalid key value pair is found
/// when parsing an [EventStoreClientConnectionString].
class InvalidHostException extends ConnectionStringParseException {
  InvalidHostException(String host)
      : super(
          'Could not parse host from connection string',
          "Invalid host: '$host'",
        );
}
