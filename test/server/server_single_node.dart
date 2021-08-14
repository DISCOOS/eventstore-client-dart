import 'dart:io';

import 'package:docker_process/docker_process.dart';
import 'package:logging/logging.dart';

import 'eventstore_server.dart';

class EventStoreServerSingleNode extends EventStoreServer {
  EventStoreServerSingleNode({
    required bool secure,
    required String imageTag,
    required int grpcPort,
    required int gossipPort,
    required bool withTestData,
    required String hostCertificatePath,
  }) : super(
          secure: secure,
          grpcPort: grpcPort,
          imageTag: imageTag,
          gossipPort: gossipPort,
          withTestData: withTestData,
          hostCertificatePath: hostCertificatePath,
        );

  final Logger logger = Logger('$EventStoreServerSingleNode');

  late DockerProcess _server;

  @override
  Future<void> start() async {
    verifyCertificatesExist();
    final failures = <String>[];
    _server = await DockerProcess.start(
      dockerExecutable: 'docker',
      name: 'eventstore-client-dart-test',
      image: withTestData
          ? 'docker.pkg.github.com/eventstore/'
              'eventstore-client-grpc-testdata/'
              'eventstore-client-grpc-testdata:$imageTag'
          : 'docker.pkg.github.com/eventstore/eventstore/eventstore:$imageTag',
      ports: [
        '1113:1113/tcp',
        '1114:1114/tcp',
        '$grpcPort:2113/tcp',
        '$gossipPort:2114/tcp',
      ],
      environment: {
        'EVENTSTORE_LOG_LEVEL': 'Verbose',
        'EVENTSTORE_INSECURE': secure ? 'False' : 'True',
        if (withTestData)
          'EVENTSTORE_DB': '/data/integration-tests'
        else
          'EVENTSTORE_MEM_DB': 'True',
        if (secure) ...{
          'EVENTSTORE_CERTIFICATE_FILE': '/etc/eventstore/certs/node/node.crt',
          'EVENTSTORE_CERTIFICATE_PRIVATE_KEY_FILE':
              '/etc/eventstore/certs/node/node.key',
          'EVENTSTORE_TRUSTED_ROOT_CERTIFICATES_PATH':
              '/etc/eventstore/certs/ca',
        },
      },
      dockerArgs: secure
          ? [
              '--mount',
              'type=bind,source=${File(hostCertificatePath).absolute.path},target=/etc/eventstore/certs',
            ]
          : [],
      cleanup: true,
      readySignal: (line) {
        logger.info(line);
        if (line.contains('Error response from daemon')) {
          failures.add(line);
        }
        return failures.isNotEmpty ||
            line.contains(
              'All components started for Instance',
            );
      },
    );
    if (failures.isNotEmpty) {
      throw Exception(failures.join('\n'));
    }
  }

  @override
  Future<void> stop() => _server.stop();
}
