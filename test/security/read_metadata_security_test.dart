import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:test/test.dart';

import '../harness.dart';
import 'security_fixture.dart';
import 'test_credentials.dart';

void main() {
  group('When reading from metadata stream with tls, streams client', () {
    const NoCredentials = 'NoCredentials';
    const DefaultCredentials = 'DefaultCredentials';
    final harness = EventStoreDBClientHarness()
      ..withLogger()
      ..withClient(
        secure: true,
        connectionName: NoCredentials,
      )
      ..withClient(
        secure: true,
        connectionName: DefaultCredentials,
        defaultCredentials: EventStoreDBClientHarness.DefaultCredentials,
      )
      ..withClient(secure: true)
      ..install(secure: true);

    test('throws NotAuthenticatedException on bad username', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.getStreamMetadata(
        StreamsSecurityFixture.MetaReadStream,
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
      final request = fixture.getStreamMetadata(
        StreamsSecurityFixture.MetaReadStream,
        userCredentials: TestCredentials.TestBadPass,
      );

      // Assert
      await expectLater(request, throwsA(isA<NotAuthenticatedException>()));
    });

    /* TODO Enable when UserClient is implemented - see given() in security fixture
    test('throws AccessDeniedException on no credentials', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final request = fixture.getStreamMetadata(
        StreamsSecurityFixture.MetaReadStream,
      );

      // Assert
      await expectLater(request, throwsA(isA<AccessDeniedException>()));
    });

    test('throws AccessDeniedException on empty credentials', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final request = fixture.getStreamMetadata(
        StreamsSecurityFixture.MetaReadStream,
        userCredentials: TestCredentials.Empty,
      );

      // Assert
      await expectLater(request, throwsA(isA<AccessDeniedException>()));
    });
    */

    test('reads all with default credentials', () async {
      // Arrange
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.getStreamMetadata(
        StreamsSecurityFixture.NoAclStream,
      );

      // Assert
      expect(result, isA<StreamMetadataResult>());
      expect(result.isOK, isTrue);
    });

    test('reads all with empty operation credentials', () async {
      // Arrange
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.getStreamMetadata(
        StreamsSecurityFixture.NoAclStream,
        // EventStoreClientSettings.credentials is used instead
        userCredentials: TestCredentials.Empty,
      );

      // Assert
      expect(result, isA<StreamMetadataResult>());
      expect(result.isOK, isTrue);
    });
  });
}
