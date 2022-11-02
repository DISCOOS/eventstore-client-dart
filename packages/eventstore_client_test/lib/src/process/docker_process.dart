// Copyright 2018 @ isoos (István Soós). All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
// * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following
// disclaimer in the documentation and/or other materials provided
// with the distribution.
// * Neither the name of the project nor the names of its
// contributors may be used to endorse or promote products derived
// from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Copied from https://github.com/isoos/docker_process/blob/master/lib/docker_process.dart
//
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';

final _logger = Logger('docker_process');

/// Access wrapper to interact with a docker container as a process.
class DockerProcess {
  final String _dockerExecutable;
  final String _name;

  DockerProcess._(this._dockerExecutable, this._name);

  factory DockerProcess.fromName(
    String name, {
    String? dockerExecutable,
  }) =>
      DockerProcess._(dockerExecutable ??= 'docker', name);

  /// Starts a docker container.
  static Future<DockerProcess> start({
    required String image,
    required String name,
    String? dockerExecutable,
    String? dockerCommand,
    List<String>? dockerArgs,
    String? network,
    String? hostname,
    Map<String, String>? environment,
    List<String>? ports,
    List<String>? imageArgs,
    bool sudo = false,
    bool verbose = false,
    bool? cleanup,
    FutureOr<bool> Function(String line)? readySignal,
    Duration? timeout,
  }) async {
    dockerExecutable ??= 'docker';
    cleanup ??= false;
    var command = dockerExecutable;
    final args = <String>[];
    final lines = <String>[];

    if (sudo) {
      args.add(command);
      command = 'sudo';
    }
    dockerCommand ??= readySignal == null ? 'start' : 'run';

    args.add(dockerCommand);
    if (cleanup) {
      args.add('--rm');
    }

    args.addAll(<String>[
      '--name',
      name,
    ]);

    if (network != null) {
      args.add('--net');
      args.add(network);
    }
    if (hostname != null) {
      args.add('-h');
      args.add(hostname);
    }
    ports?.forEach((p) {
      args.add('-p');
      args.add(p);
    });
    environment?.forEach((k, v) {
      args.add('-e');
      args.add('$k=$v');
    });
    if (dockerArgs != null && dockerArgs.isNotEmpty) {
      args.addAll(dockerArgs);
    }
    args.add(image);
    if (imageArgs != null) {
      args.addAll(imageArgs);
    }

    _logger.info({
      'starting': {'name': name, 'command': command, 'args': args},
    });
    if (readySignal != null) {
      final process = await Process.start(command, args);

      final c = Completer<void>();
      final timer = Timer(timeout ?? const Duration(minutes: 1), () {
        if (c.isCompleted) return;
        stderr.writeAll(lines, '\n');
        c.completeError('timeout');
      });
      StreamSubscription<void>? subs1;
      StreamSubscription<void>? subs2;
      StreamSubscription<void> subs(Stream<List<int>> stream) {
        return stream
            .transform(utf8.decoder)
            .transform(LineSplitter())
            .listen((String line) async {
          if (verbose) {
            stdout.writeln(line);
          }
          lines.add(line);
          if (await readySignal(line)) {
            await subs1?.cancel();
            subs1 = null;
            await subs2?.cancel();
            subs2 = null;
            if (c.isCompleted) return;
            c.complete();
          }
        });
      }

      subs1 = subs(process.stdout);
      subs2 = subs(process.stderr);

      final dp = DockerProcess._(dockerExecutable, name);

      try {
        await c.future;
      } catch (_) {
        await dp.kill();
        rethrow;
      } finally {
        timer.cancel();
      }
      return dp;
    } else {
      final pr = await Process.run(command, args);
      if (pr.exitCode != 0) {
        stderr.writeAll(lines, '\n');
        throw Exception(
          'exitCode: ${pr.exitCode}\n\n'
          'stdout: ${pr.stdout}\n\n'
          'stderr: ${pr.stderr}',
        );
      }
      return DockerProcess._(dockerExecutable, name);
    }
  }

  /// Executes the command
  Future<ProcessResult> exec(
    List<String> args, {
    String? name,
  }) async {
    _logger.info({
      'executing': {'name': name ?? _name, 'args': args},
    });
    return Process.run(
      _dockerExecutable,
      <String>['exec', name ?? _name, ...args],
    );
  }

  /// Kill the docker container.
  Future<void> kill({
    String? name,
    ProcessSignal signal = ProcessSignal.sigkill,
  }) async {
    try {
      _logger.info({
        'killing': {'name': name ?? _name}
      });
      await Process.run(
        _dockerExecutable,
        ['kill', '--signal=$signal', name ?? _name],
      );
    } catch (e, st) {
      _logger.warning({
        'kill-error': {'name': name ?? _name},
      }, e, st);
    }
  }

  /// Stop the docker container.
  Future<void> stop({String? name}) async {
    try {
      _logger.info({
        'stopping': {'name': name ?? _name}
      });
      await Process.run(_dockerExecutable, ['stop', name ?? _name]);
    } catch (e, st) {
      _logger.warning({
        'stop-error': {'name': name ?? _name},
      }, e, st);
    }
  }

  /// Checks whether the container is running.
  Future<bool> isRunning({String? name}) async {
    final pr = await Process.run(
      _dockerExecutable,
      ['ps', '--format', '{{.Names}}'],
    );
    return pr.stdout
        .toString()
        .split('\n')
        .map((s) => s.trim())
        .contains(name ?? _name);
  }
}
