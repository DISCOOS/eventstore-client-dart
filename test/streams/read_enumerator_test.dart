import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/streams/read_enumerator.dart';
import 'package:test/test.dart';

import '../fixtures/read_enumerator_mock.dart';

void main() {
  group('Read enumerator', () {
    test('calls subscription dropped on server error', () async {
      // Arrange
      final cause = GrpcError.unknown();
      final responseStream = ResponseStreamMock();
      responseStream.addConfirmation();
      final enumerator = await ReadEnumerator.from(
        StreamState.any('test'),
        responseStream,
        (e) => e,
      );
      final subscription = EventStreamSubscription(enumerator);

      // Act
      responseStream.addError(cause);

      // Assert
      expect(subscription.isOK, isTrue);
      final dropped = await subscription.onDropped;
      expect(subscription.isCompleted, isTrue);
      expect(dropped.cause, cause);
      expect(dropped.reason, SubscriptionDroppedReason.serverError);
    });

    test('calls subscription dropped on subscription error', () async {
      // Arrange
      final cause = Exception('');
      final responseStream = ResponseStreamMock();
      responseStream.addConfirmation();
      final enumerator = await ReadEnumerator.from(
        StreamState.any('test'),
        responseStream,
        (e) => e,
      );
      final subscription = EventStreamSubscription(enumerator);

      // Act
      responseStream.addError(cause);

      // Assert
      expect(subscription.isOK, isTrue);
      final dropped = await subscription.onDropped;
      expect(subscription.isCompleted, isTrue);
      expect(dropped.cause, cause);
      expect(dropped.reason, SubscriptionDroppedReason.subscriberError);
    });
  });
}
