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
    // Test update operation
    // ---------------------------------------

    test('updates user details', () async {
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
      await usersClient.update(
        loginName: loginName(),
        fullName: 'New Name',
        groups: ['baz'],
      );

      // Assert
      final result = await usersClient.getUser(loginName: loginName());
      expect(result.loginName, loginName());
      expect(result.fullName, 'New Name');
      expect(result.groups, ['baz']);
      expect(result.isDisabled, false);
      expect(result.lastUpdated.isBefore(DateTime.now()), true);
    });

    test('throws when update on empty loginName', () async {
      // Arrange
      final usersClient = EventStoreUsersClient(
        streamClient.settings,
      );

      // Assert
      await expectLater(
        () => usersClient.update(loginName: ''),
        throwsA(isA<ArgumentOutOfRangeException>()),
      );
    });

    test('throws when update on loginName not found', () async {
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
        usersClient.update(loginName: 'unknown'),
        throwsA(isA<UserNotFoundException>()),
      );
    });
  });
}
