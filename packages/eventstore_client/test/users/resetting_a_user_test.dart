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
    // Test change password operation
    // ---------------------------------------

    test('resets password', () async {
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
      await usersClient.resetPassword(
        loginName: loginName(),
        newPassword: 'new-pwd',
      );

      // Assert
    });

    test('resets own password', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Assert
      await usersClient.resetPassword(
        loginName: streamClient.settings.defaultCredentials!.username,
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
        () => usersClient.resetPassword(
          loginName: '',
          newPassword: 'new-pwd',
        ),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
      expect(
        () => usersClient.resetPassword(
          loginName: loginName(),
          newPassword: '',
        ),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
    });

  });
}
