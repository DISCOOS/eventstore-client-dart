import 'connection_string_parse_exception.dart';

/// The exception that is thrown when no scheme was specified in an
/// [EventStoreClientConnectionString].
class InvalidSchemeException extends ConnectionStringParseException {
  InvalidSchemeException(String scheme, List<String> supportedSchemes)
      : super(
          'Could not parse scheme from connection string',
          "Invalid scheme: '$scheme'. Supported values are: '${supportedSchemes.join("','")}'",
        );
}
