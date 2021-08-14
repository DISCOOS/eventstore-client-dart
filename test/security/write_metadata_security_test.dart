import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:test/test.dart';

import '../harness.dart';
import 'security_fixture.dart';
import 'test_credentials.dart';

void main() {
  group('When writing to a stream with tls, streams client', () {
    const AppendCount = 1;
    const NoCredentials = 'NoCredentials';
    const DefaultCredentials = 'DefaultCredentials';
    final harness = EventStoreDBClientHarness()
      ..withLogger()
      ..withStreamsClient(
        secure: true,
        connectionName: NoCredentials,
      )
      ..withStreamsClient(
        secure: true,
        connectionName: DefaultCredentials,
        defaultCredentials: EventStoreDBClientHarness.DefaultCredentials,
      )
      ..withStreamsClient(secure: true)
      ..install(secure: true);

    test('throws NotAuthenticatedException on bad user', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.setStreamMetadata(
        StreamState.any(StreamsSecurityFixture.MetaReadStream),
        userCredentials: TestCredentials.TestBadPass,
      );

      // Assert
      await expectLater(request, throwsA(isA<NotAuthenticatedException>()));
    });

    test('throws NotAuthenticatedException on bad password', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.setStreamMetadata(
        StreamState.any(StreamsSecurityFixture.MetaReadStream),
        userCredentials: TestCredentials.TestBadPass,
      );

      // Assert
      await expectLater(request, throwsA(isA<NotAuthenticatedException>()));
    });

    test('writes to no-acl stream with no credentials', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.setStreamMetadata(
        StreamState.any(StreamsSecurityFixture.NoAclStream),
      );

      // Assert
      expect(result, isA<WriteSuccessResult>());
    });

    test('writes to no-acl stream with default credentials', () async {
      // Arrange
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.setStreamMetadata(
        StreamState.any(StreamsSecurityFixture.NoAclStream),
      );

      // Assert
      expect(result, isA<WriteSuccessResult>());
    });

    test('writes to no-acl stream with empty operation credentials', () async {
      // Arrange
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.setStreamMetadata(
        StreamState.any(StreamsSecurityFixture.NoAclStream),
        // EventStoreClientSettings.credentials is used instead
        userCredentials: TestCredentials.Empty,
      );

      // Assert
      expect(result, isA<WriteSuccessResult>());
    });
  });
}
