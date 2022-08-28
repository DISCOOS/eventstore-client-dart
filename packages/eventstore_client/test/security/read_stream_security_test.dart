import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../harness.dart';
import 'security_fixture.dart';
import 'test_credentials.dart';

void main() {
  group('When reading from a stream with tls, streams client', () {
    const ExistingCount = 1;
    const NoCredentials = 'NoCredentials';
    const DefaultCredentials = 'DefaultCredentials';
    const DefaultTrustStoreVerified = 'DefaultTrustStoreVerified';
    const DefaultTrustStoreUnverified = 'DefaultTrustStoreUnverified';
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient(secure: true)
      ..withClient(
        secure: true,
        connectionName: NoCredentials,
      )
      ..withClient(
        secure: true,
        verifyCert: true,
        publicKeyPath: null,
        connectionName: DefaultTrustStoreVerified,
      )
      ..withClient(
        secure: true,
        verifyCert: false,
        publicKeyPath: null,
        connectionName: DefaultTrustStoreUnverified,
      )
      ..withClient(
        secure: true,
        connectionName: DefaultCredentials,
        defaultCredentials: EventStoreClientHarness.DefaultCredentials,
      )
      ..install(EventStoreImage.V20_LTS, secure: true);

    late Iterable<EventData> exists;

    setUpAll(() async {
      exists = harness.createTestEvents(count: ExistingCount);
      Future<void> _writeTo(
        String streamId,
        Iterable<EventData> exists,
      ) async {
        final client = harness.client();
        final state = StreamState.any(
          streamId,
        );
        final result = await client.append(state, Stream.fromIterable(exists));
        expect(result, isA<WriteSuccessResult>());
        expect(result.actualType, equals(StreamStateType.stream_exists));
      }

      await _writeTo(StreamsSecurityFixture.NoAclStream, exists);
      await _writeTo(StreamsSecurityFixture.ReadStream, exists);
    });

    test('fails to connect with default trust store', () async {
      // Arrange
      final client = harness.client(connectionName: DefaultTrustStoreVerified);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.readFromStream(
        StreamsSecurityFixture.ReadStream,
        userCredentials: TestCredentials.TestBadUser,
      );

      // Assert
      await expectLater(request, throwsA(isA<CertificateVerifyFailed>()));
    });

    test('able to connect with default trust store with verifyCert=false',
        () async {
      // Arrange
      final client =
          harness.client(connectionName: DefaultTrustStoreUnverified);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.readFromStream(
        StreamsSecurityFixture.ReadStream,
        userCredentials: TestCredentials.TestBadUser,
      );

      // Assert
      await expectLater(request, throwsA(isA<NotAuthenticatedException>()));
    });

    test('throws NotAuthenticatedException on bad username', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.readFromStream(
        StreamsSecurityFixture.ReadStream,
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
      final request = fixture.readFromStream(
        StreamsSecurityFixture.ReadStream,
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

      // Act
      final request = fixture.readFromStream(
        StreamsSecurityFixture.ReadStream,
      );

      // Assert
      await expectLater(request, throwsA(isA<AccessDeniedException>()));
    });

    test('throws AccessDeniedException on empty credentials', () async {
      // Arrange
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.readFromStream(
        StreamsSecurityFixture.ReadStream,
        userCredentials: TestCredentials.Empty,
      );

      // Assert
      await expectLater(request, throwsA(isA<AccessDeniedException>()));
    });
    */

    test('reads from no-acl stream with default credentials', () async {
      // Arrange
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.readFromStream(
        StreamsSecurityFixture.NoAclStream,
      );

      // Assert
      expect(result, isA<ReadEventsResult>());
      expect(result.isOK, isTrue);
    });

    test('reads from no-acl stream with empty operation credentials', () async {
      // Arrange
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.readFromStream(
        StreamsSecurityFixture.NoAclStream,
        // EventStoreClientSettings.credentials is used instead
        userCredentials: TestCredentials.Empty,
      );

      // Assert
      expect(result, isA<ReadEventsResult>());
      expect(result.isOK, isTrue);
    });
  });
}
