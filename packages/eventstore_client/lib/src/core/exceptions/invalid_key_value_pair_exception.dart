import 'connection_string_parse_exception.dart';

/// The exception that is thrown when an invalid key value pair is found
/// when parsing an [EventStoreClientConnectionString].
class InvalidKeyValuePairException extends ConnectionStringParseException {
  InvalidKeyValuePairException(String pair)
      : super(
          'Could not parse options from connection string',
          "Invalid key/value pair: '$pair'",
        );
}
