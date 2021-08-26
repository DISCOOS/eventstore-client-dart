import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/projections/projections.dart';
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
        await Projections.onStatus(
          ProjectionStatus.Stopped,
          SystemProjections.Names,
          projectionsClient,
        );
        init = false;
      }
      return Future<void>.value();
    });

    // ---------------------------------------
    // Test update operations
    // ---------------------------------------

    test('disable projections', () async {
      // Arrange
      await projectionsClient.createContinuous(
        '$ProjName-1',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );

      // Act
      await projectionsClient.disable(
        '$ProjName-1',
      );

      // Assert
      final result = await projectionsClient.getStatus(
        '$ProjName-1',
      );
      expect(result.name, '$ProjName-1');
      expect(result.status.contains('Stopped'), isTrue);
    });

    test('enable projections', () async {
      // Arrange
      await projectionsClient.createContinuous(
        '$ProjName-2',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );
      await projectionsClient.disable('$ProjName-2');

      // Act
      await projectionsClient.enable(
        '$ProjName-2',
      );
      // Assert
      final result = await projectionsClient.getStatus(
        '$ProjName-2',
      );
      expect(result.status.contains('Running'), isTrue);
    });

    test('abort projections', () async {
      // Arrange
      await projectionsClient.createContinuous(
        '$ProjName-3',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );

      // Act
      await projectionsClient.abort(
        '$ProjName-3',
      );

      // Assert
      final result = await projectionsClient.getStatus(
        '$ProjName-3',
      );
      expect(result.status.contains('Stopped'), isTrue);
    });

    test('reset projections', () async {
      // Arrange
      await projectionsClient.createContinuous(
        '$ProjName-4',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );
      final expected = await projectionsClient.getStatus(
        '$ProjName-4',
      );
      expect(expected.status, 'Running');

      // Act
      await projectionsClient.reset(
        '$ProjName-4',
      );

      // Assert
      final actual = await projectionsClient.getStatus(
        '$ProjName-4',
      );
      expect(actual.status.contains('Running'), isTrue);
    });

    test('restarts projections subsystem', () async {
      // Arrange
      await projectionsClient.createContinuous(
        '$ProjName-5',
        'fromAll().when({\$init: function (state, ev) {return {};}});',
      );
      final expected = await projectionsClient.getStatus(
        '$ProjName-5',
      );
      expect(expected.status.contains('Running'), isTrue);

      // Act
      await projectionsClient.restartSubsystem();
      await Projections.onStatus(
        ProjectionStatus.Running,
        ['$ProjName-5'],
        projectionsClient,
        timeoutAfter: const Duration(seconds: 1),
      );

      // Assert
      final actual = await projectionsClient.getStatus(
        '$ProjName-5',
      );
      expect(actual.status.contains('Running'), isTrue);
    });
  });
}
