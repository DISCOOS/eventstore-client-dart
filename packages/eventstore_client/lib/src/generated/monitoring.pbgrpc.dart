///
//  Generated code. Do not modify.
//  source: monitoring.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'monitoring.pb.dart' as $3;
export 'monitoring.pb.dart';

class MonitoringClient extends $grpc.Client {
  static final _$stats = $grpc.ClientMethod<$3.StatsReq, $3.StatsResp>(
      '/event_store.client.monitoring.Monitoring/Stats',
      ($3.StatsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.StatsResp.fromBuffer(value));

  MonitoringClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$3.StatsResp> stats($3.StatsReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$stats, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class MonitoringServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.client.monitoring.Monitoring';

  MonitoringServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.StatsReq, $3.StatsResp>(
        'Stats',
        stats_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.StatsReq.fromBuffer(value),
        ($3.StatsResp value) => value.writeToBuffer()));
  }

  $async.Stream<$3.StatsResp> stats_Pre(
      $grpc.ServiceCall call, $async.Future<$3.StatsReq> request) async* {
    yield* stats(call, await request);
  }

  $async.Stream<$3.StatsResp> stats(
      $grpc.ServiceCall call, $3.StatsReq request);
}
