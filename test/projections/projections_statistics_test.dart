import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('When projections are running, projections client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        runProjections: 'all',
      );

    late var init = true;
    late final EventStoreClient streamsClient;
    late final EventStoreProjectionsClient projectionsClient;

    setUpAll(() async {
      streamsClient = harness.client();
      projectionsClient = EventStoreProjectionsClient(
        streamsClient.settings,
      );
    });

    setUp(() async {
      if (init) {
        init = false;
        await Projections.onStatus(
          ProjectionStatus.Stopped,
          SystemProjections.Names,
          projectionsClient,
        );
        await projectionsClient.createOneTime(
          'fromStream("\$projections-some-transient-proj").when({'
          '\$init: function() { return { Count: 0 }; },'
          '\$any: function(s, e) { s.Count++; return s; }'
          '}).outputState();',
        );
        await projectionsClient.createTransient(
          'some-transient-proj',
          'fromStream("\$projections-some-transient-proj").when({'
              '\$init: function() { return { Count: 0 }; },'
              '\$any: function(s, e) { s.Count++; return s; }'
              '}).outputState();',
        );
        await projectionsClient.createContinuous(
          'some-continuous-proj',
          'fromStream("\$projections-some-continuous-proj").when({'
              '\$init: function() { return { Count: 0 }; },'
              '\$any: function(s, e) { s.Count++; return s; }'
              '}).outputState();',
        );
      }
      return Future<void>.value();
    });

    // ---------------------------------------
    // Test statistics operations
    // ---------------------------------------

    test('get status for system projection', () async {
      // Act
      final result = await projectionsClient.getStatus(
        SystemProjections.Streams,
      );
      // Assert
      expect(result.name, SystemProjections.Streams);
      expect(result.status.contains('Stopped'), isTrue);
    });

    test('list one-time projections', () async {
      // Act
      final result = await projectionsClient.listOneTime();

      // Assert
      expect(result.length, 1);
      expect(result.first.mode, 'OneTime');
    });

    test('list transient projections', () async {
      // Act
      final result = await projectionsClient.listTransient();

      // Assert
      expect(result.length, 1);
      expect(result.first.name, 'some-transient-proj');
    });

    test('list continuous projections', () async {
      // Act
      final result = await projectionsClient.listContinuous();

      // Assert
      expect(result.length, SystemProjections.Names.length + 1);
      expect(
        result.map((result) => result.name).toList()..sort(),
        [...SystemProjections.Names, 'some-continuous-proj'].toList()..sort(),
      );
    });

    test('list all projections', () async {
      // Act
      final result = await projectionsClient.listAll();

      // Assert
      expect(result.length, SystemProjections.Names.length + 3);
      expect(
        result
            .map((result) => result.name)
            .where((name) => name.startsWith('\$') || name.startsWith('some'))
            .toList()
              ..sort(),
        [
          ...SystemProjections.Names,
          'some-transient-proj',
          'some-continuous-proj'
        ].toList()
          ..sort(),
      );
    });
  });
}
