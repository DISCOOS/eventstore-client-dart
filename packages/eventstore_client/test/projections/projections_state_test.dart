import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client_test/eventstore_client_test.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  const ProjName = 'some-continuous-proj';
  const StatefulProjectionQuery = '''
    fromStream("\$projections-some-continuous-proj").when({
      \$init: function() { return { Count: 0 }; },
      \$any: function(s, e) { s.Count++; return s; }
    });
  ''';

  group('When projections are running, projections client', () {
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        EventStoreImage.V20_LTS,
        timeoutAfter: null,
        runProjections: 'all',
      );

    var init = true;
    late final EventStoreStreamsClient streamsClient;
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
        await projectionsClient.createContinuous(
          ProjName,
          StatefulProjectionQuery,
        );
      }
      return Future<void>.value();
    });

    // ---------------------------------------
    // Test update operations
    // ---------------------------------------

    test('returns expected state', () async {
      // Assert
      await Projections.onState([ProjName], streamsClient);
      // Act
      final JsonDocument state = await projectionsClient.getState(
        ProjName,
      );
      // Assert
      expect(state, isA<Map<String, dynamic>>());
      expect(
        Map<String, dynamic>.from(state as Map),
        containsPair('Count', 1),
      );
    });

    test('returns expected result', () async {
      // Assert
      await Projections.onState([ProjName], streamsClient);
      // Act
      final JsonDocument result = await projectionsClient.getResult(
        ProjName,
      );
      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(
        Map<String, dynamic>.from(result as Map),
        containsPair('Count', 1),
      );
    });
  });
}
