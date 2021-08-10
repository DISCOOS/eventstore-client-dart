import 'connection_string_parse_exception.dart';

/// The exception that is thrown when no scheme was specified in an
/// [EventStoreClientConnectionString].
class NoSchemeException extends ConnectionStringParseException {
  NoSchemeException(Object cause)
      : super(
          'Could not parse scheme from connection string',
          cause,
        );
}
