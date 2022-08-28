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
    // Test create operation
    // ---------------------------------------

    test('creates a new user', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Act
      await usersClient.create(
        loginName: 'test',
        password: '123ABC',
        fullName: 'Tester',
        groups: ['foo', 'bar'],
      );

      // Assert
      final result = await usersClient.getUser(loginName: 'test');
      expect(result.loginName, 'test');
      expect(result.fullName, 'Tester');
      expect(result.groups, ['foo', 'bar']);
      expect(result.isDisabled, false);
      expect(result.lastUpdated.isBefore(DateTime.now()), true);
    });

    test('throws on create with empty inputs', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Assert
      expect(() => usersClient.create(
        loginName: '',
        password: '123ABC',
        fullName: 'Tester',
        groups: ['foo', 'bar'],
      ), throwsA(isA<ArgumentOutOfRangeException>()));
      expect(() => usersClient.create(
        loginName: 'test',
        password: '',
        fullName: 'Tester',
        groups: ['foo', 'bar'],
      ), throwsA(isA<ArgumentOutOfRangeException>()));
      expect(() => usersClient.create(
        loginName: 'test',
        password: '123ABC',
        fullName: '',
        groups: ['foo', 'bar'],
      ), throwsA(isA<ArgumentOutOfRangeException>()));

    });

    test('throws on create when loginName already exists', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Act
      await usersClient.create(
        loginName: 'duplicate',
        password: '123ABC',
        fullName: 'Tester',
        groups: ['foo', 'bar'],
      );

      // Assert
      await expectLater(
        // Act
        usersClient.create(
          loginName: 'duplicate',
          password: 'new-pwd',
          fullName: 'Tester',
          groups: ['foo', 'bar'],
        ),
        throwsA(
          isA<UserConflictException>().having(
                (error) => error.message,
            "correct message",
            equals("Conflict."),
          ),
        ),
      );
    });

  });
}
