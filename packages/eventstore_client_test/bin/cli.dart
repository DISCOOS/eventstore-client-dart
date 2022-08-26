import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:logging/logging.dart';

void main(List<String> args) async {
  final runner = CommandRunner<dynamic>(
      'esdbtcli', 'A command-line tool for testing EventStoreDB locally')
    ..argParser.addFlag('verbose', abbr: 'v', help: 'Prints more output.')
    ..addCommand(GenerateCertificatesCommand())
    ..addCommand(StartEventStoreDBCommand())
    ..addCommand(StopEventStoreDBCommand());

  final results = runner.parse(args);
  if (results['verbose'] as bool) {
    Logger.root.onRecord.listen((e) {
      stdout.writeln('$e');
    }, onError: (dynamic error) {
      stderr.writeln('[ERROR]: $error');
    });
  }

  if (results.command?.name != null) {
    runner.run(args);
  } else {
    runner.printUsage();
  }
}
