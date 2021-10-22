import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
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
    stdout.writeln("Running esdbtcli $name...");
    final server = EventStoreServerSingleNode(
      secure: argResults!['secure'],
      hostCertificatePath: argResults!['certs'],
    );
    await server.start(name: argResults!['name']);
    stdout.writeln(
      "EventStoreDB in docker container '${argResults!['name']}' is running",
    );
    // HACK: Unsure why this hangs when starting with --secure
    exit(0);
  }
}
