import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('Users client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(
        secure: true,
        settings: EventStoreClientSettings.v20_LTS,
        defaultCredentials: EventStoreClientHarness.DefaultCredentials,
      )
      ..install(
        EventStoreImage.v20_LTS,
        secure: true,
      );

    late final EventStoreStreamsClient streamClient;

    setUpAll(() {
      streamClient = harness.client();
    });

    // ---------------------------------------
    // Test read operations
    // ---------------------------------------

    test('gets current user', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Act
      final result = await usersClient.getCurrentUser();

      // Assert
      expect(
        result.loginName,
        streamClient.settings.defaultCredentials?.username,
      );
      expect(result.fullName, isNotEmpty);
      expect(result.isDisabled, false);
    });

    test('gets all users', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Act
      final result = await usersClient.getAllUsers();

      // Assert
      expect(result.isNotEmpty, true);
    });

    test('throws on get when loginName is empty', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Assert
      expect(
        () => usersClient.getUser(loginName: ''),
        throwsA(
          isA<ArgumentOutOfRangeException>().having(
            (error) => error.message,
            "correct message",
            equals("'loginName' is empty"),
          ),
        ),
      );
    });

    test('throws on get when loginName not found', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Assert
      await expectLater(
        usersClient.getUser(loginName: 'unknown'),
        throwsA(
          isA<UserNotFoundException>().having(
            (error) => error.message,
            "correct message",
            equals("User 'unknown' is not found."),
          ),
        ),
      );
    });
  });
}
