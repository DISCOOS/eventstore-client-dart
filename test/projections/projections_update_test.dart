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
        timeoutAfter: null,
        runProjections: 'all',
      );

    late var init = false;
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
      }
      return Future<void>.value();
    });

    // ---------------------------------------
    // Test update operations
    // ---------------------------------------

    test('updates projection with not emits given', () async {
      // Arrange
      await projectionsClient.createContinuous(
        '$ProjName-1',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );

      // Act
      try {
        await projectionsClient.update(
          '$ProjName-1',
          'fromAll().when({\$init: function (s, e) {return {};}});',
        );
        // Assert
        final result = await projectionsClient.getStatus(
          '$ProjName-1',
        );
        expect(result.name, '$ProjName-1');
      } on Exception catch (e) {
        print(e);
      }
    });

    test('updates projection with emits enabled', () async {
      // Arrange
      await projectionsClient.createContinuous(
        '$ProjName-2',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );

      // Act
      await projectionsClient.update(
        '$ProjName-2',
        'fromAll().when({\$init: function (s, e) {return {};}});',
        emitEnabled: true,
      );
      // Assert
      final result = await projectionsClient.getStatus(
        '$ProjName-2',
      );
      expect(result.name, '$ProjName-2');
    });

    test('updates projection with emits disabled', () async {
      // Arrange
      await projectionsClient.createContinuous(
        '$ProjName-3',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );

      // Act
      await projectionsClient.update(
        '$ProjName-3',
        'fromAll().when({\$init: function (s, e) {return {};}});',
        emitEnabled: false,
      );
      // Assert
      final result = await projectionsClient.getStatus(
        '$ProjName-3',
      );
      expect(result.name, '$ProjName-3');
    });
  });
}
