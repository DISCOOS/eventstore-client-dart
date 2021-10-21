import 'package:eventstore_client/src/core/constants.dart';
import 'package:eventstore_client/src/core/exceptions/exceptions.dart';
import 'package:universal_io/io.dart';

/// A class representing an [EventStoreDB](https://eventstore.com) host
class EndPoint {
  /// Constructs a [EndPoint] instance
  const EndPoint(this.address, this.port);

  /// [EventStoreDB](https://eventstore.com) host address
  final String address;

  /// [EventStoreDB](https://eventstore.com) host port
  final int port;

  /// Get this [EndPoint] as a [Uri]
  Uri toUri([bool useTls = true]) {
    return Uri(scheme: useTls ? 'https' : 'http', host: address, port: port);
  }

  /// An [EndPoint] representing [InternetAddress.loopbackIPv4]
  static final loopbackIPv4 = EndPoint(
    InternetAddress.loopbackIPv4.address,
    Defaults.GrpcPort,
  );

  /// An [EndPoint] representing [InternetAddress.loopbackIPv6]
  static final loopbackIPv6 = EndPoint(
    InternetAddress.loopbackIPv6.address,
    Defaults.GrpcPort,
  );

  /// An [EndPoint] representing [InternetAddress.anyIPv4]
  static final anyIPv4 = EndPoint(
    InternetAddress.anyIPv4.address,
    Defaults.GrpcPort,
  );

  /// An [EndPoint] representing [InternetAddress.anyIPv6]
  static final anyIPv6 = EndPoint(
    InternetAddress.anyIPv6.address,
    Defaults.GrpcPort,
  );

  /// Construct an [EndPoint] from given [path]
  factory EndPoint.from(String path) {
    late int port;
    late String host;
    final parts = path.split(':');
    switch (parts.length) {
      case 1:
        host = parts[0];
        port = Defaults.GrpcPort;
        break;
      case 2:
        {
          host = parts[0];
          if (int.tryParse(parts[1]) == null) {
            throw InvalidHostException(path);
          }
          port = int.parse(parts[1]);
          break;
        }
      default:
        throw InvalidHostException(path);
    }
    final address = InternetAddress.tryParse(host);
    if (address != null) {
      return EndPoint(
        parts[0],
        port,
      );
    }
    final uri = Uri.tryParse(host);
    if (uri == null) {
      throw InvalidHostException(path);
    }
    return EndPoint(host, port);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EndPoint &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          port == other.port;

  @override
  int get hashCode => address.hashCode ^ port.hashCode;

  @override
  String toString() {
    return '$runtimeType{address: $address, port: $port}';
  }
}
