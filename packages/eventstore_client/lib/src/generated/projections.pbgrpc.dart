///
//  Generated code. Do not modify.
//  source: projections.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'projections.pb.dart' as $6;
import 'shared.pb.dart' as $1;
export 'projections.pb.dart';

class ProjectionsClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$6.CreateReq, $6.CreateResp>(
      '/event_store.client.projections.Projections/Create',
      ($6.CreateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.CreateResp.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$6.UpdateReq, $6.UpdateResp>(
      '/event_store.client.projections.Projections/Update',
      ($6.UpdateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.UpdateResp.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$6.DeleteReq, $6.DeleteResp>(
      '/event_store.client.projections.Projections/Delete',
      ($6.DeleteReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.DeleteResp.fromBuffer(value));
  static final _$statistics =
      $grpc.ClientMethod<$6.StatisticsReq, $6.StatisticsResp>(
          '/event_store.client.projections.Projections/Statistics',
          ($6.StatisticsReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $6.StatisticsResp.fromBuffer(value));
  static final _$disable = $grpc.ClientMethod<$6.DisableReq, $6.DisableResp>(
      '/event_store.client.projections.Projections/Disable',
      ($6.DisableReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.DisableResp.fromBuffer(value));
  static final _$enable = $grpc.ClientMethod<$6.EnableReq, $6.EnableResp>(
      '/event_store.client.projections.Projections/Enable',
      ($6.EnableReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.EnableResp.fromBuffer(value));
  static final _$reset = $grpc.ClientMethod<$6.ResetReq, $6.ResetResp>(
      '/event_store.client.projections.Projections/Reset',
      ($6.ResetReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.ResetResp.fromBuffer(value));
  static final _$state = $grpc.ClientMethod<$6.StateReq, $6.StateResp>(
      '/event_store.client.projections.Projections/State',
      ($6.StateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.StateResp.fromBuffer(value));
  static final _$result = $grpc.ClientMethod<$6.ResultReq, $6.ResultResp>(
      '/event_store.client.projections.Projections/Result',
      ($6.ResultReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.ResultResp.fromBuffer(value));
  static final _$restartSubsystem = $grpc.ClientMethod<$1.Empty, $1.Empty>(
      '/event_store.client.projections.Projections/RestartSubsystem',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  ProjectionsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$6.CreateResp> create($6.CreateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$6.UpdateResp> update($6.UpdateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$6.DeleteResp> delete($6.DeleteReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseStream<$6.StatisticsResp> statistics($6.StatisticsReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$statistics, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$6.DisableResp> disable($6.DisableReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disable, request, options: options);
  }

  $grpc.ResponseFuture<$6.EnableResp> enable($6.EnableReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$enable, request, options: options);
  }

  $grpc.ResponseFuture<$6.ResetResp> reset($6.ResetReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reset, request, options: options);
  }

  $grpc.ResponseFuture<$6.StateResp> state($6.StateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$state, request, options: options);
  }

  $grpc.ResponseFuture<$6.ResultResp> result($6.ResultReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$result, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> restartSubsystem($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$restartSubsystem, request, options: options);
  }
}

abstract class ProjectionsServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.client.projections.Projections';

  ProjectionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.CreateReq, $6.CreateResp>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.CreateReq.fromBuffer(value),
        ($6.CreateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UpdateReq, $6.UpdateResp>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.UpdateReq.fromBuffer(value),
        ($6.UpdateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.DeleteReq, $6.DeleteResp>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.DeleteReq.fromBuffer(value),
        ($6.DeleteResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.StatisticsReq, $6.StatisticsResp>(
        'Statistics',
        statistics_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $6.StatisticsReq.fromBuffer(value),
        ($6.StatisticsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.DisableReq, $6.DisableResp>(
        'Disable',
        disable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.DisableReq.fromBuffer(value),
        ($6.DisableResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.EnableReq, $6.EnableResp>(
        'Enable',
        enable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.EnableReq.fromBuffer(value),
        ($6.EnableResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ResetReq, $6.ResetResp>(
        'Reset',
        reset_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ResetReq.fromBuffer(value),
        ($6.ResetResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.StateReq, $6.StateResp>(
        'State',
        state_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.StateReq.fromBuffer(value),
        ($6.StateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.ResultReq, $6.ResultResp>(
        'Result',
        result_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.ResultReq.fromBuffer(value),
        ($6.ResultResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.Empty>(
        'RestartSubsystem',
        restartSubsystem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$6.CreateResp> create_Pre(
      $grpc.ServiceCall call, $async.Future<$6.CreateReq> request) async {
    return create(call, await request);
  }

  $async.Future<$6.UpdateResp> update_Pre(
      $grpc.ServiceCall call, $async.Future<$6.UpdateReq> request) async {
    return update(call, await request);
  }

  $async.Future<$6.DeleteResp> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$6.DeleteReq> request) async {
    return delete(call, await request);
  }

  $async.Stream<$6.StatisticsResp> statistics_Pre(
      $grpc.ServiceCall call, $async.Future<$6.StatisticsReq> request) async* {
    yield* statistics(call, await request);
  }

  $async.Future<$6.DisableResp> disable_Pre(
      $grpc.ServiceCall call, $async.Future<$6.DisableReq> request) async {
    return disable(call, await request);
  }

  $async.Future<$6.EnableResp> enable_Pre(
      $grpc.ServiceCall call, $async.Future<$6.EnableReq> request) async {
    return enable(call, await request);
  }

  $async.Future<$6.ResetResp> reset_Pre(
      $grpc.ServiceCall call, $async.Future<$6.ResetReq> request) async {
    return reset(call, await request);
  }

  $async.Future<$6.StateResp> state_Pre(
      $grpc.ServiceCall call, $async.Future<$6.StateReq> request) async {
    return state(call, await request);
  }

  $async.Future<$6.ResultResp> result_Pre(
      $grpc.ServiceCall call, $async.Future<$6.ResultReq> request) async {
    return result(call, await request);
  }

  $async.Future<$1.Empty> restartSubsystem_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return restartSubsystem(call, await request);
  }

  $async.Future<$6.CreateResp> create(
      $grpc.ServiceCall call, $6.CreateReq request);
  $async.Future<$6.UpdateResp> update(
      $grpc.ServiceCall call, $6.UpdateReq request);
  $async.Future<$6.DeleteResp> delete(
      $grpc.ServiceCall call, $6.DeleteReq request);
  $async.Stream<$6.StatisticsResp> statistics(
      $grpc.ServiceCall call, $6.StatisticsReq request);
  $async.Future<$6.DisableResp> disable(
      $grpc.ServiceCall call, $6.DisableReq request);
  $async.Future<$6.EnableResp> enable(
      $grpc.ServiceCall call, $6.EnableReq request);
  $async.Future<$6.ResetResp> reset(
      $grpc.ServiceCall call, $6.ResetReq request);
  $async.Future<$6.StateResp> state(
      $grpc.ServiceCall call, $6.StateReq request);
  $async.Future<$6.ResultResp> result(
      $grpc.ServiceCall call, $6.ResultReq request);
  $async.Future<$1.Empty> restartSubsystem(
      $grpc.ServiceCall call, $1.Empty request);
}
