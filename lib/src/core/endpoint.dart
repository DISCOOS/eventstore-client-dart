import 'package:eventstore_client_dart/src/core/constants.dart';
import 'package:eventstore_client_dart/src/core/exceptions/exceptions.dart';
import 'package:universal_io/io.dart';

class EndPoint {
  const EndPoint(this.address, this.port);
  final String address;
  final int port;

  static final loopbackIPv4 = EndPoint(
    InternetAddress.loopbackIPv4.address,
    Defaults.GrpcPort,
  );

  static final loopbackIPv6 = EndPoint(
    InternetAddress.loopbackIPv6.address,
    Defaults.GrpcPort,
  );

  static final anyIPv4 = EndPoint(
    InternetAddress.anyIPv4.address,
    Defaults.GrpcPort,
  );

  static final anyIPv6 = EndPoint(
    InternetAddress.anyIPv6.address,
    Defaults.GrpcPort,
  );

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
}
