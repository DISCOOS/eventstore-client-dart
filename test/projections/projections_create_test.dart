import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/constants.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  const StatefulProjectionQuery = '''
    fromStream("\$projections-some-stateful-proj").when({
      \$init: function() { return { Count: 0 }; },
      \$any: function(s, e) { s.Count++; return s; }
    }).outputState();
  ''';

  group('When projections are running, projections client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        timeoutAfter: null,
        runProjections: 'all',
        startSystemProjections: true,
      );

    late final EventStoreClient streamsClient;
    late final EventStoreProjectionsClient projectionsClient;

    setUpAll(() {
      streamsClient = harness.client();
      projectionsClient = EventStoreProjectionsClient(
        streamsClient.settings,
      );
    });

    // ---------------------------------------
    // Test create operations
    // ---------------------------------------

    test('creates an one-time projection', () async {
      // Act
      await projectionsClient.createOneTime(
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );
    });

    test('creates a continuous projection', () async {
      // Act
      await projectionsClient.createContinuous(
        'some-continuous-proj',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
        trackEmittedStreams: false,
      );

      // Assert
      final result = await projectionsClient.getStatus(
        'some-continuous-proj',
      );
      expect(result.name, 'some-continuous-proj');
    });

    test('creates a transient projection', () async {
      // Act
      await projectionsClient.createTransient(
        'some-transient-proj',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );

      // Assert
      final result = await projectionsClient.getStatus(
        'some-transient-proj',
      );
      expect(result.name, 'some-transient-proj');
    });

    test('creates a stateful continuous projection', () async {
      // Act
      await projectionsClient.createContinuous(
        'some-stateful-proj',
        StatefulProjectionQuery,
      );

      // Assert
      final result = await streamsClient.readFromStream(
        Projections.resultStreamId(
          'some-stateful-proj',
        ),
      );
      // final result = await streamsClient.readFromAll();
      expect(result.isOK, isTrue);
      final events = await result.events;
      expect(events, isNotEmpty);
      expect(
        events.first.originalEventType,
        SystemEvents.Result,
      );
    });
  });
}
