import 'package:eventstore_client/eventstore_client.dart';
import 'package:test/test.dart';

import '../harness.dart';

void main() {
  group('When projections are running, projections client', () {
    const ProjName = 'some-continuous-proj';
    final harness = EventStoreClientHarness()
      ..withLogger()
      ..withClient()
      ..install(
        runProjections: 'all',
        startSystemProjection: false,
      );

    var init = true;
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
        await projectionsClient.createContinuous(
          ProjName,
          'fromAll().when({\$init: function (state, ev) {return {};}});',
        );
        init = false;
      }
    });

    // ---------------------------------------
    // Test update operations
    // ---------------------------------------

    test('updates projection with not emits given', () async {
      // Act
      await projectionsClient.update(
        ProjName,
        'fromAll().when({\$init: function (s, e) {return {};}});',
      );
      // Assert
      final result = await projectionsClient.getStatus(ProjName);
      expect(result.name, ProjName);
    });

    test('updates projection with emits enabled', () async {
      // Act
      await projectionsClient.update(
        ProjName,
        'fromAll().when({\$init: function (s, e) {return {};}});',
        emitEnabled: true,
      );
      // Assert
      final result = await projectionsClient.getStatus(ProjName);
      expect(result.name, ProjName);
    });

    test('updates projection with emits disabled', () async {
      // Act
      await projectionsClient.update(
        ProjName,
        'fromAll().when({\$init: function (s, e) {return {};}});',
        emitEnabled: false,
      );
      // Assert
      final result = await projectionsClient.getStatus(ProjName);
      expect(result.name, ProjName);
    });
  });
}
