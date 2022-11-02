import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';

class StartEventStoreDBCommand extends Command<void> {
  StartEventStoreDBCommand() {
    argParser
      ..addOption(
        'name',
        defaultsTo: 'eventstore-db',
        help: 'Name of docker container instance',
      )
      ..addFlag(
        'secure',
        defaultsTo: false,
        help: 'Starts EventStoreDB with TLS (requires certs)',
      )
      ..addOption(
        'tag',
        defaultsTo: ImageTags.LTS,
        help: 'EventStore Image tag',
      )
      ..addOption(
        'certs',
        defaultsTo: 'certs',
        help:
            'Path to certificate root directory relative to working directory',
      );
  }

  @override
  String get name => 'start';

  @override
  String get description => 'Start a single EventStoreDB instance in docker';

  @override
  FutureOr<void> run() async {
    final tag = (argResults!['tag'] as String).toLowerCase();
    final image = EventStoreImage.images.firstWhere(
      (e) => tag == e.tag.toLowerCase(),
      orElse: () => EventStoreImage.LTS,
    );
    stdout.writeln("Running esdbtcli $name on ${image.tag}...");
    final server = EventStoreServerSingleNode(
      image,
      secure: argResults!['secure'] as bool,
      hostCertificatePath: argResults!['certs'] as String,
    );
    await server.start(name: argResults!['name'] as String);
    stdout.writeln(
      "EventStoreDB in docker container '${argResults!['name']}' is running",
    );
    // HACK: Unsure why this hangs when starting with --secure
    exit(0);
  }
}
