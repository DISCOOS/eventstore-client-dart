import 'dart:async';
import 'dart:collection';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/generated/monitoring.pbgrpc.dart' as $a;
import 'package:fixnum/fixnum.dart';
import 'package:meta/meta.dart';

class EventStoreMonitoringClient extends EventStoreClient {
  EventStoreMonitoringClient(
    EventStoreClientSettings settings,
  ) : super(settings: settings);

  @visibleForOverriding
  Future<$a.MonitoringClient> $getClient() async {
    $verifyFeatureAllowed(ApiFeature.Monitoring);
    return $a.MonitoringClient(
      await $getCurrentChannel(),
      options: $getOptions(),
      interceptors: $toInterceptors(
        settings.connectionName,
      ),
    );
  }

  /// Check if [EventStoreMonitoringClient] is supported.
  bool isMonitoringSupported() => isFeatureSupported(ApiFeature.Monitoring);

  /// Get [Stats] from EventStore.
  Future<Stats> getStats({
    bool useMetadata = false,
    int refreshTimePeriodInMs = 60000,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();
      final request = $a.StatsReq()
        ..useMetadata = useMetadata
        ..refreshTimePeriodInMs = Int64(refreshTimePeriodInMs);
      final response = client.stats(request);
      final result = await response.first;
      final next = Stats._from(
        result,
        useMetadata,
        refreshTimePeriodInMs,
      );
      await response.cancel();
      return next;
    });
  }

  /// Subscribe to stream of [Stats] from EventStore as stream
  Future<Stream<Stats>> subscribe({
    bool useMetadata = false,
    bool asBroadcast = true,
    int refreshTimePeriodInMs = 60000,
  }) async {
    return $runRequest(() async {
      final client = await $getClient();
      final request = $a.StatsReq()
        ..useMetadata = useMetadata
        ..refreshTimePeriodInMs = Int64(refreshTimePeriodInMs);
      final response = client.stats(request);
      late StreamSubscription<$a.StatsResp> subscription;
      final controller = StreamController<Stats>.broadcast(
        onCancel: () => subscription.cancel(),
      );
      subscription = response.listen(
        (value) {
          controller.add(Stats._from(
            value,
            useMetadata,
            refreshTimePeriodInMs,
          ));
        },
      );
      return controller.stream;
    });
  }
}

/// [Map] of stats from server
class Stats with MapMixin<String, String> {
  Stats._(this._stats, this.useMetadata, this.refreshTimePeriodInMs);

  final bool useMetadata;
  final int refreshTimePeriodInMs;
  final Map<String, String> _stats;

  static Stats _from(
    $a.StatsResp result,
    bool useMetadata,
    int refreshTimePeriodInMs,
  ) {
    return Stats._(
      result.stats,
      useMetadata,
      refreshTimePeriodInMs,
    );
  }

  @override
  Iterable<String> get keys => _stats.keys;

  @override
  String? operator [](Object? key) => _stats[key];

  @override
  void operator []=(String key, String value) {
    _stats[key] = value;
  }

  @override
  void clear() {
    _stats.clear();
  }

  @override
  String? remove(Object? key) => _stats.remove(key);
}
