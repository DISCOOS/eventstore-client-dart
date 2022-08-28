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

    test('deletes an user', () async {
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
      await usersClient.delete(loginName: 'test');

      // Assert
      await expectLater(
        usersClient.getUser(loginName: 'test'),
        throwsA(isA<UserNotFoundException>()),
      );
    });

    test('throws when deleting second time', () async {
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
      await usersClient.delete(loginName: 'test');

      // Assert
      await expectLater(
        usersClient.delete(loginName: 'test'),
        throwsA(isA<UserNotFoundException>()),
      );
    });

    test('throws when deleting user with loginName not found', () async {
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
      await expectLater(
        usersClient.delete(loginName: 'unknown'),
        throwsA(isA<UserNotFoundException>()),
      );
    });
  });
}
