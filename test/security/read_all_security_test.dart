import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:test/test.dart';

import '../harness.dart';
import 'security_fixture.dart';
import 'test_credentials.dart';

void main() {
  group('When reading from \$all stream with tls, streams client', () {
    const NoCredentials = 'NoCredentials';
    const DefaultCredentials = 'DefaultCredentials';
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(
        secure: true,
        connectionName: NoCredentials,
      )
      ..withClient(
        secure: true,
        connectionName: DefaultCredentials,
        defaultCredentials: EventStoreClientHarness.DefaultCredentials,
      )
      ..withClient(secure: true)
      ..install(secure: true);

    test('throws NotAuthenticatedException on bad username', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.readFromAll(
        userCredentials: TestCredentials.TestBadUser,
      );

      // Assert
      await expectLater(request, throwsA(isA<NotAuthenticatedException>()));
    });

    test('throws NotAuthenticatedException on bad password', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.readFromAll(
        userCredentials: TestCredentials.TestBadPass,
      );

      // Assert
      await expectLater(request, throwsA(isA<NotAuthenticatedException>()));
    });

    test('throws AccessDeniedException on no credentials', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.readFromAll();

      // Assert
      await expectLater(request, throwsA(isA<AccessDeniedException>()));
    });

    test('throws AccessDeniedException on empty credentials', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.readFromAll(
        userCredentials: TestCredentials.Empty,
      );

      // Assert
      await expectLater(request, throwsA(isA<AccessDeniedException>()));
    });

    test('reads all with default credentials', () async {
      // Arrange
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final result = await fixture.readFromAll();

      // Assert
      expect(result, isA<ReadEventsResult>());
      expect(result.isOK, isTrue);
    });

    test('reads all with empty operation credentials', () async {
      // Arrange
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final result = await fixture.readFromAll(
        // EventStoreClientSettings.credentials is used instead
        userCredentials: TestCredentials.Empty,
      );

      // Assert
      expect(result, isA<ReadEventsResult>());
      expect(result.isOK, isTrue);
    });
  });
}
