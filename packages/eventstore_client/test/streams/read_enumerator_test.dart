import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/read_enumerator.dart';
import 'package:eventstore_client/src/generated/streams.pb.dart';
import 'package:eventstore_client/src/streams/helpers.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:test/test.dart';

import '../fixtures/read_enumerator_mock.dart';

void main() {
  group('Read enumerator', () {
    test('calls subscription dropped on server error', () async {
      // Arrange
      final cause = GrpcError.unknown();
      final responseStream = ResponseStreamMock();
      responseStream.addConfirmation();
      final enumerator = await _toEnumerator(responseStream);
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
      final enumerator = await _toEnumerator(responseStream);
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

Future<ReadEnumerator<ReadResp>> _toEnumerator(
    ResponseStreamMock responseStream) {
  return ReadEnumerator.from<ReadResp>(
    expected: StreamState.any('test'),
    stream: responseStream,
    toTypedException: (e) => e,
    toReadResp: (resp) {
      switch (resp.whichContent()) {
        case ReadResp_Content.event:
          return ReadResponse.event;
        case ReadResp_Content.confirmation:
          return ReadResponse.confirmation;
        case ReadResp_Content.checkpoint:
          return ReadResponse.checkpoint;
        case ReadResp_Content.streamNotFound:
          return ReadResponse.streamNotFound;
        case ReadResp_Content.firstStreamPosition:
          return ReadResponse.firstStreamPosition;
        case ReadResp_Content.lastStreamPosition:
          return ReadResponse.lastStreamPosition;
        case ReadResp_Content.lastAllStreamPosition:
          return ReadResponse.lastAllStreamPosition;
        case ReadResp_Content.notSet:
          return ReadResponse.notSet;
      }
    },
    toResolvedEvent: (resp) => convertToResolvedEvent(resp.event),
    toCheckpoint: (ReadResp resp) => LogPosition.checked(
      resp.checkpoint.commitPosition,
      resp.checkpoint.preparePosition,
    ),
    toSubscriptionId: (resp) => resp.confirmation.subscriptionId,
  );
}
