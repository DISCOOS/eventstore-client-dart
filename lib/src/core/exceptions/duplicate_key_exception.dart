import 'connection_string_parse_exception.dart';

/// The exception that is thrown when a key in the
/// [EventStoreClientConnectionString] is duplicated.
class DuplicateKeyException extends ConnectionStringParseException {
  DuplicateKeyException(String key)
      : super(
          'Could not parse options from connection string',
          "Duplicate key: '$key'",
        );
}
