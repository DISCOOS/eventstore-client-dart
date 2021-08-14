import 'package:eventstore_client_dart/eventstore_client_dart.dart';

class TestCredentials {
  static const UserCredentials Empty = UserCredentials.Empty;
  static const UserCredentials Root = UserCredentials('admin', 'changeit');
  static const UserCredentials TestBadPass = UserCredentials(
    'admin',
    'badpass',
  );
  static const UserCredentials TestBadUser = UserCredentials(
    'baduser',
    'badpass',
  );
}
