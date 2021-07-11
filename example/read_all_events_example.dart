import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/log_position.dart';
import 'package:eventstore_client_dart/src/streams/read_results.dart';
import 'package:grpc/grpc.dart';
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
  final client = EventStoreDBStreamsClient(
    'some-channel-name',
    channel,
  );

  // Fetch all events in EventStore
  final result = await client.readFromAll(
    LogPosition.start,
    forward: true,
    resolveLinks: true,
  );
  if (result is ReadEventsSuccessResult) {
    await for (var event in result.events) {
      print(event);
    }
  }
}
