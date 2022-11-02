import 'package:eventstore_client/eventstore_client.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

class EventStoreImage {
  EventStoreImage(
    this.tag,
    this.isReady,
  );

  static final List<EventStoreImage> images = [
    EventStoreImage.LTS,
    EventStoreImage.V20_LTS,
    EventStoreImage.V21_LTS,
    EventStoreImage.V22,
    EventStoreImage.LATEST,
  ];

  static final EventStoreImage LTS = V20_LTS;
  static final EventStoreImage V20_LTS = EventStoreImage(
    ImageTags.V20_LTS,
    _v20_IsReady,
  );
  static final EventStoreImage V21_LTS = EventStoreImage(
    ImageTags.V21_LTS,
    _v21_IsReady,
  );

  static final EventStoreImage V22 = EventStoreImage(
    '${ApiVersions.V22}-buster-slim',
    _v22_IsReady,
  );

  static final EventStoreImage LATEST = V22;

  // ignore: prefer_function_declarations_over_variables
  static final bool Function(String) _v20_IsReady = (String line) {
    return line.contains('All components started for Instance');
  };

  // ignore: prefer_function_declarations_over_variables
  static final bool Function(String) _v21_IsReady = (String line) {
    return line.contains('Became Leader so now handling subscriptions');
  };

  // ignore: prefer_function_declarations_over_variables
  static final bool Function(String) _v22_IsReady = (String line) {
    return line.contains('Became Leader so now handling subscriptions');
  };

  final String tag;
  final bool Function(String) isReady;
}

abstract class EventStoreServer {
  EventStoreServer({
    required this.image,
    required this.secure,
    required this.grpcPort,
    required this.gossipPort,
    required this.withTestData,
    required this.hostCertificatePath,
  });

  final bool secure;
  final int grpcPort;
  final int gossipPort;
  final bool withTestData;
  final EventStoreImage image;
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
          print(
            '${file.parent} exists: ${file.parent.existsSync()}',
          );
          print(
            '${file.parent.path} exists: ${file.parent.parent.existsSync()}',
          );
          print(
            '${file.parent.parent.path} exists: ${file.parent.parent.parent.existsSync()}',
          );

          throw Exception(
            'Could not locate the certificates file ${file.absolute.path} needed '
            "to run EventStoreDB node. \nPlease run 'esdbtcli certs'.",
          );
        }
      }
    }
  }
}
