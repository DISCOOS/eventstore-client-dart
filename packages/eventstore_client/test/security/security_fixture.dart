import 'package:eventstore_client/eventstore_client.dart';

import 'test_credentials.dart';

class StreamsSecurityFixture {
  StreamsSecurityFixture(this.client);

  static const String ReadStream = 'WriteStream';
  static const String NoAclStream = 'NoAclStream';
  static const String WriteStream = 'WriteStream';
  static const String MetaReadStream = 'MetaReadStream';
  static const String MetaWriteStream = 'MetaWriteStream';
  static const String AllStream = SystemStreams.AllStream;

  final EventStoreStreamsClient client;

  Future<void> given() async {
    await client.setStreamMetadata(
      StreamState.noStream(NoAclStream),
      StreamMetadata(),
      userCredentials: TestCredentials.Root,
    );

    await client.setStreamMetadata(
      StreamState.noStream(ReadStream),
      // TODO acl: StreamAcl(readRoles: [TestCredentials.TestUser1.Username]))
      StreamMetadata(),
      userCredentials: TestCredentials.Root,
    );
    await client.setStreamMetadata(
      StreamState.noStream(WriteStream),
      // TODO acl: StreamAcl(writeRoles: [TestCredentials.TestUser1.Username]))
      StreamMetadata(),
      userCredentials: TestCredentials.Root,
    );
    await client.setStreamMetadata(
      StreamState.noStream(MetaReadStream),
      // TODO acl: StreamAcl(readRoles: [TestCredentials.TestUser1.Username]))
      StreamMetadata(),
      userCredentials: TestCredentials.Root,
    );
    await client.setStreamMetadata(
      StreamState.noStream(MetaWriteStream),
      // TODO acl: StreamAcl(writeRoles: [TestCredentials.TestUser1.Username]))
      StreamMetadata(),
      userCredentials: TestCredentials.Root,
    );
  }

  Future<WriteResult> append(
    StreamState state,
    Stream<EventData> events, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return client.append(
      state,
      events,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }

  Future<WriteResult> setStreamMetadata(
    StreamState state, {
    StreamMetadata? metadata,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return client.setStreamMetadata(
      state,
      metadata ?? StreamMetadata(),
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }

  Future<ReadEventsResult> readFromAll({
    int? count,
    bool forward = true,
    bool resolveLinks = true,
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return client.readFromAll(
      maxCount: count,
      forward: forward,
      resolveLinks: resolveLinks,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }

  Future<ReadEventsResult> readFromStream(
    String name, {
    int? count = 1,
    bool forward = true,
    bool resolveLinks = false,
    EventStoreClientOperationOptions? operationOptions,
    UserCredentials? userCredentials = TestCredentials.Root,
  }) {
    return client.read(
      name,
      maxCount: count,
      forward: forward,
      resolveLinks: resolveLinks,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }

  Future<StreamMetadataResult> getStreamMetadata(
    String name, {
    UserCredentials? userCredentials,
    EventStoreClientOperationOptions? operationOptions,
  }) {
    return client.getStreamMetadata(
      name,
      userCredentials: userCredentials,
      operationOptions: operationOptions,
    );
  }
}
