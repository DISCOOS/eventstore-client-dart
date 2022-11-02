part of '../streams_client.dart';

mixin EventStoreStreamsMixin on EventStoreClient {
  @visibleForOverriding
  Future<StreamsClient> $getClient() async {
    return StreamsClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }

  @visibleForOverriding
  Future<ReadEnumerator<ReadResp>> $toEnumerator(
    ResponseStream<ReadResp> stream,
    StreamState expected,
  ) async {
    return ReadEnumerator.from<ReadResp>(
      stream: stream,
      expected: expected,
      toTypedException: $toTypedException,
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
}
