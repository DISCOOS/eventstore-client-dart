import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

class EventStoreClientSettings {
  EventStoreClientSettings(
    this.address,
    this.port, {
    String? connectionName,
  }) : connectionName = connectionName ?? 'ES-${Uuid().v4()}';

  final int port;
  final String connectionName;
  final InternetAddress address;
}
