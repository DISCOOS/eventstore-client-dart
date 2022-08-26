import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';

class StopEventStoreDBCommand extends Command<void> {
  StopEventStoreDBCommand() {
    argParser.addOption(
      'name',
      defaultsTo: 'eventstore-db',
      help: 'Name of docker container instance',
    );
  }

  @override
  String get name => 'stop';

  @override
  String get description =>
      'Stop a single EventStoreDB instance running in docker';

  @override
  FutureOr<void> run() async {
    stdout.writeln("Running esdbtcli $name...");
    final server = EventStoreServerSingleNode(EventStoreImage.LTS);
    server.stop(name: argResults!['name'] as String);
    stdout.writeln(
      "EventStoreDB in docker container '${argResults!['name']}' is stopped",
    );
  }
}
