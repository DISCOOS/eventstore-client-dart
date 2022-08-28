import 'connection_string_parse_exception.dart';

/// The exception that is thrown when a key in the
/// [EventStoreClientConnectionString] is duplicated.
class InvalidUserCredentialsParseException extends ConnectionStringParseException {
  InvalidUserCredentialsParseException(String userInfo)
      : super(
          'Could not parse user info from connection string',
          "Invalid user credentials: '$userInfo'. Username & password must be delimited by a colon",
        );
}
