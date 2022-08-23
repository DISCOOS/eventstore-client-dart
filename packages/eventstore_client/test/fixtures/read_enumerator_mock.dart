import 'dart:async';
import 'dart:convert';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/shared.pb.dart';
import 'package:eventstore_client/src/generated/streams.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/mockito.dart';

class ResponseStreamMock extends Fake implements ResponseStream<ReadResp> {
  final StreamController<ReadResp> _controller = StreamController();

  ReadResp addCheckpoint(LogPosition position) {
    final resp = ReadResp()
      ..checkpoint = ReadResp_Checkpoint(
        commitPosition: position.commitPosition,
        preparePosition: position.preparePosition,
      );
    add(resp);
    return resp;
  }

  List<ReadResp> addReadEvents(
    String streamId,
    Iterable<EventData> events, {
    LogPosition? from,
    Map<String, String> metadata = const {},
  }) {
    var position = from ?? LogPosition.start;
    final list = <ReadResp>[];
    for (var event in events) {
      list.add(addReadEvent(
        streamId,
        event,
        at: position,
      ));
      position = LogPosition.checked(
        position.commitPosition + 1,
        position.preparePosition + 1,
      );
    }
    return list;
  }

  ReadResp addReadEvent(
    String streamId,
    EventData event, {
    LogPosition? at,
    Map<String, String> metadata = const {},
  }) {
    final position = at ?? LogPosition.start;
    final resp = ReadResp()
      ..event = ReadResp_ReadEvent(
        commitPosition: position.commitPosition,
        event: ReadResp_ReadEvent_RecordedEvent()
          ..id = UUID(string: event.uuid.uuid)
          ..data = event.data
          ..streamIdentifier = (StreamIdentifier()
            ..streamId = utf8.encode(
              streamId,
            ))
          ..metadata.addAll(metadata)
          ..customMetadata = event.metadata
          ..commitPosition = position.commitPosition
          ..preparePosition = position.preparePosition,
      );
    add(resp);
    return resp;
  }

  ReadResp addConfirmation({String? subscriptionId}) {
    final resp = ReadResp()
      ..confirmation = ReadResp_SubscriptionConfirmation(
        subscriptionId: subscriptionId ?? UuidV4.newUuid().value.uuid,
      );
    add(resp);
    return resp;
  }

  void add(ReadResp resp) => _controller.add(resp);
  void addError(Object error) => _controller.addError(error);

  @override
  StreamSubscription<ReadResp> listen(
    void Function(ReadResp value)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _controller.stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  @override
  Future<void> cancel() => _controller.close();
}
