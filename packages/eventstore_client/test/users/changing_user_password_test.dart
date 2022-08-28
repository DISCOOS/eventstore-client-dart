import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('Users client', () {
    int count = 0;
    String loginName() => 'test-$count';

    setUp(() => count++);

    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(
        secure: true,
        settings: EventStoreClientSettings.V20_LTS,
        defaultCredentials: EventStoreClientHarness.DefaultCredentials,
      )
      ..install(
        EventStoreImage.V20_LTS,
        secure: true,
      );

    late final EventStoreStreamsClient streamClient;

    setUpAll(() {
      streamClient = harness.client();
    });

    // ---------------------------------------
    // Test change password operation
    // ---------------------------------------

    test('changes password', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );
      await usersClient.create(
        loginName: loginName(),
        password: '123ABC',
        fullName: 'Tester',
        groups: ['foo', 'bar'],
      );

      // Act
      await usersClient.changePassword(
        loginName: loginName(),
        oldPassword: '123ABC',
        newPassword: 'new-pwd',
      );

      // Assert
    });

    test('changes own password', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Assert
      await usersClient.changePassword(
        loginName: streamClient.settings.defaultCredentials!.username,
        oldPassword: streamClient.settings.defaultCredentials!.password,
        newPassword: streamClient.settings.defaultCredentials!.password,
      );
    });

    test('throws on change password with empty inputs', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );
      await usersClient.create(
        loginName: loginName(),
        password: '123ABC',
        fullName: 'Tester',
        groups: ['foo', 'bar'],
      );

      // Assert
      expect(
        () => usersClient.changePassword(
          loginName: '',
          oldPassword: '123ABC',
          newPassword: 'new-pwd',
        ),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
      expect(
        () => usersClient.changePassword(
          loginName: loginName(),
          oldPassword: '',
          newPassword: 'new-pwd',
        ),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
      expect(
        () => usersClient.changePassword(
          loginName: loginName(),
          oldPassword: '123ABC',
          newPassword: '',
        ),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
    });

    test('throws on change password with wrong old password', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Act
      await usersClient.create(
        loginName: loginName(),
        password: '123ABC',
        fullName: 'Tester',
        groups: ['foo', 'bar'],
      );

      // Assert
      await expectLater(
        // Act
        usersClient.changePassword(
          loginName: loginName(),
          oldPassword: 'wrong-pwd',
          newPassword: 'new-pwd',
        ),
        throwsA(
          isA<AccessDeniedException>().having(
            (error) => error.message,
            "correct message",
            equals("Access Denied"),
          ),
        ),
      );
    });
  });
}
