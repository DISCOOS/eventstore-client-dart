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
    // Test disable operation
    // ---------------------------------------

    test('enabled a disabled user', () async {
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
      await usersClient.disable(loginName: loginName());
      await usersClient.enable(loginName: loginName());

      // Assert
      final result = await usersClient.getUser(loginName: loginName());
      expect(result.isDisabled, false);
      expect(result.loginName, loginName());
      expect(result.fullName, 'Tester');
      expect(result.groups, ['foo', 'bar']);
      expect(result.lastUpdated.isBefore(DateTime.now()), true);
    });

    test('enables an enabled user', () async {
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
      await usersClient.enable(loginName: loginName());

      // Assert
      final result = await usersClient.getUser(loginName: loginName());
      expect(result.isDisabled, false);
      expect(result.loginName, loginName());
      expect(result.fullName, 'Tester');
      expect(result.groups, ['foo', 'bar']);
      expect(result.lastUpdated.isBefore(DateTime.now()), true);
    });

    test('throws when enable on empty loginName', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Assert
      await expectLater(
        () => usersClient.enable(loginName: ''),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
    });

    test('throws when enable on loginName not found', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Assert
      await expectLater(
        () => usersClient.enable(loginName: 'unknown'),
        throwsA(isA<UserNotFoundException>()),
      );
    });
  });
}
