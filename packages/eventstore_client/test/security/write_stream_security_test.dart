import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../harness.dart';
import 'security_fixture.dart';
import 'test_credentials.dart';

void main() {
  group('When reading from a stream with tls, streams client', () {
    const AppendCount = 1;
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
      ..install(EventStoreImage.V20_LTS, secure: true);

    test(
        'throws AccessDeniedException on write to all-stream with no credentials',
        () async {
      // Arrange
      final events = harness.createTestEvents(count: AppendCount);
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final request = fixture.append(
        StreamState.any(StreamsSecurityFixture.AllStream),
        Stream.fromIterable(events),
      );

      // Assert
      await expectLater(request, throwsA(isA<AccessDeniedException>()));
    });

    test(
        'throws AccessDeniedException on write to all-stream with default credentials',
        () async {
      // Arrange
      final events = harness.createTestEvents(count: AppendCount);
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final request = fixture.append(
        StreamState.any(StreamsSecurityFixture.AllStream),
        Stream.fromIterable(events),
      );

      // Assert
      await expectLater(request, throwsA(isA<AccessDeniedException>()));
    });

    test(
        'throws AccessDeniedException on write to all-stream with operation credentials',
        () async {
      // Arrange
      final events = harness.createTestEvents(count: AppendCount);
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final request = fixture.append(
        StreamState.any(StreamsSecurityFixture.AllStream),
        Stream.fromIterable(events),
        userCredentials: TestCredentials.Root,
      );

      // Assert
      await expectLater(request, throwsA(isA<AccessDeniedException>()));
    });

    test('throws NotAuthenticatedException on bad user', () async {
      // Arrange
      final events = harness.createTestEvents(count: AppendCount);
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.append(
        StreamState.any(StreamsSecurityFixture.WriteStream),
        Stream.fromIterable(events),
        userCredentials: TestCredentials.TestBadPass,
      );

      // Assert
      await expectLater(request, throwsA(isA<NotAuthenticatedException>()));
    });

    test('throws NotAuthenticatedException on bad password', () async {
      // Arrange
      final events = harness.createTestEvents(count: AppendCount);
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);

      // Act
      final request = fixture.append(
        StreamState.any(StreamsSecurityFixture.WriteStream),
        Stream.fromIterable(events),
        userCredentials: TestCredentials.TestBadPass,
      );

      // Assert
      await expectLater(request, throwsA(isA<NotAuthenticatedException>()));
    });

    test('writes to no-acl stream with no credentials', () async {
      // Arrange
      final events = harness.createTestEvents(count: AppendCount);
      final client = harness.client(connectionName: NoCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.append(
        StreamState.any(StreamsSecurityFixture.NoAclStream),
        Stream.fromIterable(events),
      );

      // Assert
      expect(result, isA<WriteSuccessResult>());
    });

    test('writes to no-acl stream with default credentials', () async {
      // Arrange
      final events = harness.createTestEvents(count: AppendCount);
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.append(
        StreamState.any(StreamsSecurityFixture.NoAclStream),
        Stream.fromIterable(events),
      );

      // Assert
      expect(result, isA<WriteSuccessResult>());
    });

    test('writes to no-acl stream with empty operation credentials', () async {
      // Arrange
      final events = harness.createTestEvents(count: AppendCount);
      final client = harness.client(connectionName: DefaultCredentials);
      final fixture = StreamsSecurityFixture(client);
      await fixture.given();

      // Act
      final result = await fixture.append(
        StreamState.any(StreamsSecurityFixture.NoAclStream),
        Stream.fromIterable(events),
        // EventStoreClientSettings.credentials is used instead
        userCredentials: TestCredentials.Empty,
      );

      // Assert
      expect(result, isA<WriteSuccessResult>());
    });
  });
}
