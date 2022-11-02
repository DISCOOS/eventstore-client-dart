import 'package:eventstore_client/eventstore_client.dart';
import 'package:grpc/grpc.dart' show ChannelCredentials;
import 'package:universal_io/io.dart';

/// Create HttpClient on platforms that supports dart:io
HttpClient toHttpClient(
  EventStoreClientSettings settings,
  ChannelCredentials channelCredentials,
) {
  return settings.useTls
      ? HttpClient(context: SecurityContext(withTrustedRoots: true))
      : HttpClient();
}
