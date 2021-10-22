import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as p;
import 'package:shell/shell.dart';
import 'package:universal_io/io.dart';

class GenerateCertificatesCommand extends Command<void> {
  GenerateCertificatesCommand() {
    argParser
      ..addOption(
        'out',
        help: 'Root for output directory. Defaults to working directory',
      )
      ..addFlag(
        'secure',
        defaultsTo: false,
        help: 'Limits access to read and write fo certificates to current user',
      );
  }

  @override
  String get name => 'certs';

  @override
  String get description =>
      'Generates self-signed certificates for EventStoreDB';

  @override
  FutureOr<void> run() async {
    stdout.writeln("Running esdbtcli $name...");
    final root = Directory(
      argResults!['out'] ?? Directory.current,
    ).absolute.path;
    final certs = Directory('$root/certs');
    final shell = Shell(workingDirectory: root, runInShell: true);
    if (certs.existsSync()) {
      stdout.writeln("Deleting ${certs.path}/...");
      await chmod(shell, '0755', certs);
      await rmdir(shell, certs);
    }
    await mkdir(shell, certs);

    await pull(shell);
    await createCa(shell, certs);
    await createNode(shell, certs);
    await pem(shell, certs);

    stdout.writeln(
      "Created Certificate Authority certificate at ${certs.path}/ca",
    );
    await ls(shell, Directory(p.join(certs.path, 'ca')));

    stdout.writeln("Created Node certificate at ${certs.path}/node");
    await ls(shell, Directory(p.join(certs.path, 'node')));

    if (argResults!['secure']) {
      stdout.writeln(
        "Limit access to read and write for ${shell.username} only with chmod 0600",
      );
      await chmod(shell, '0600', certs);
    } else {
      stdout.writeln(
        "Limit access to read and write for ${shell.username} only with chmod 0755",
      );
      await chmod(shell, '0755', certs);
    }

    stdout.writeln("Certificates creation finished!");
  }

  Future<void> pull(Shell shell) async {
    final docker = await shell.start('docker', arguments: [
      'pull',
      'eventstore/es-gencert-cli:1.0.1',
    ]);
    await docker.expectZeroExit();
  }

  Future<void> createCa(Shell shell, Directory certs) async {
    final docker = await shell.start('docker', arguments: [
      'run',
      '--rm',
      '--volume',
      '${certs.path}/:/tmp',
      // '--user',
      // '\$(id -u):\$(id -g)',
      'eventstore/es-gencert-cli:1.0.1',
      'create-ca',
      '-out',
      '/tmp/ca',
    ]);
    await docker.expectZeroExit();
  }

  Future<void> createNode(Shell shell, Directory certs) async {
    final docker = await shell.start('docker', arguments: [
      'run',
      '--rm',
      '--volume',
      '${certs.path}/:/tmp',
      // '--user',
      // '\$(id -u):\$(id -g)',
      'eventstore/es-gencert-cli:1.0.1',
      'create-node',
      '-ca-certificate',
      '/tmp/ca/ca.crt',
      '-ca-key',
      '/tmp/ca/ca.key',
      '-out',
      '/tmp/node',
      '-ip-addresses',
      '127.0.0.1',
      '-dns-names',
      'localhost',
    ]);
    await docker.expectZeroExit();
  }

  Future<void> ls(Shell shell, Directory dir) async {
    final ls = await shell.start('ls', arguments: ['-al', dir.path]);
    await ls.expectZeroExit();
  }

  Future<void> rmdir(Shell shell, Directory dir) async {
    final rm = await shell.start('rm', arguments: ['-rf', dir.path]);
    await rm.expectZeroExit();
  }

  Future<void> mkdir(Shell shell, Directory dir) async {
    final rm = await shell.start('mkdir', arguments: ['-p', dir.path]);
    await rm.expectZeroExit();
  }

  Future<void> chmod(Shell shell, String mode, Directory dir) async {
    final chmod = await shell.start('chmod', arguments: ['-R', mode, dir.path]);
    await chmod.expectZeroExit();
  }

  Future<void> pem(Shell shell, Directory certs) async {
    const fs = LocalFileSystem();
    final cat = await shell.start('cat', arguments: [
      '${certs.path}/ca/ca.key',
      '${certs.path}/ca/ca.crt',
    ]);
    await cat.stdout.writeToFile(fs.file("${certs.path}/ca/ca.pem"));
    await cat.stderr.drain();
  }
}
