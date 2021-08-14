import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

abstract class EventStoreServer {
  EventStoreServer({
    required this.secure,
    required this.grpcPort,
    required this.imageTag,
    required this.gossipPort,
    required this.withTestData,
    required this.hostCertificatePath,
  });

  final bool secure;
  final int grpcPort;
  final int gossipPort;
  final String imageTag;
  final bool withTestData;
  final String hostCertificatePath;

  Future<void> start();
  Future<void> stop();
  void verifyCertificatesExist() {
    if (secure) {
      final certificateFiles = [
        p.join(hostCertificatePath, 'ca', 'ca.crt'),
        p.join(hostCertificatePath, 'ca', 'ca.key'),
        p.join(hostCertificatePath, 'node', 'node.crt'),
        p.join(hostCertificatePath, 'node', 'node.key'),
      ];

      for (var path in certificateFiles) {
        final file = File(path);
        if (!file.existsSync()) {
          throw Exception(
            'Could not locate the certificates file ${file.absolute.path} needed '
            "to run EventStoreDB node. \nPlease run '. tools/gencert.sh test'"
            'from the repo root.',
          );
        }
      }
    }
  }
}
