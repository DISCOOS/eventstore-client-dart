import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:universal_io/io.dart';

void main() async {
  // Create a grpc channel to EventStore
  final channel = ClientChannel(
    InternetAddress.loopbackIPv4,
    port: Defaults.GrpcPort,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  // Create client on streams
  final client = EventStoreStreamsClient(
    'some-channel-name',
    channel,
  );

  // Fetch all events in EventStore
  final result = await client.readFromAll(
    LogPosition.start,
    forward: true,
    resolveLinks: true,
  );
  if (result.isOK) {
    await for (var event in result.stream) {
      print(event);
    }
  }
}
