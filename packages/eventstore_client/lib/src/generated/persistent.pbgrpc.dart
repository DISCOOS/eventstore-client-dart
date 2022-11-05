///
//  Generated code. Do not modify.
//  source: persistent.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'persistent.pb.dart' as $5;
import 'shared.pb.dart' as $1;
export 'persistent.pb.dart';

class PersistentSubscriptionsClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$5.CreateReq, $5.CreateResp>(
      '/event_store.client.persistent_subscriptions.PersistentSubscriptions/Create',
      ($5.CreateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.CreateResp.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$5.UpdateReq, $5.UpdateResp>(
      '/event_store.client.persistent_subscriptions.PersistentSubscriptions/Update',
      ($5.UpdateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.UpdateResp.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$5.DeleteReq, $5.DeleteResp>(
      '/event_store.client.persistent_subscriptions.PersistentSubscriptions/Delete',
      ($5.DeleteReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.DeleteResp.fromBuffer(value));
  static final _$read = $grpc.ClientMethod<$5.ReadReq, $5.ReadResp>(
      '/event_store.client.persistent_subscriptions.PersistentSubscriptions/Read',
      ($5.ReadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ReadResp.fromBuffer(value));
  static final _$getInfo = $grpc.ClientMethod<$5.GetInfoReq, $5.GetInfoResp>(
      '/event_store.client.persistent_subscriptions.PersistentSubscriptions/GetInfo',
      ($5.GetInfoReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.GetInfoResp.fromBuffer(value));
  static final _$replayParked = $grpc.ClientMethod<$5.ReplayParkedReq,
          $5.ReplayParkedResp>(
      '/event_store.client.persistent_subscriptions.PersistentSubscriptions/ReplayParked',
      ($5.ReplayParkedReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ReplayParkedResp.fromBuffer(value));
  static final _$list = $grpc.ClientMethod<$5.ListReq, $5.ListResp>(
      '/event_store.client.persistent_subscriptions.PersistentSubscriptions/List',
      ($5.ListReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ListResp.fromBuffer(value));
  static final _$restartSubsystem = $grpc.ClientMethod<$1.Empty, $1.Empty>(
      '/event_store.client.persistent_subscriptions.PersistentSubscriptions/RestartSubsystem',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  PersistentSubscriptionsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$5.CreateResp> create($5.CreateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$5.UpdateResp> update($5.UpdateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$5.DeleteResp> delete($5.DeleteReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseStream<$5.ReadResp> read($async.Stream<$5.ReadReq> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$read, request, options: options);
  }

  $grpc.ResponseFuture<$5.GetInfoResp> getInfo($5.GetInfoReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInfo, request, options: options);
  }

  $grpc.ResponseFuture<$5.ReplayParkedResp> replayParked(
      $5.ReplayParkedReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$replayParked, request, options: options);
  }

  $grpc.ResponseFuture<$5.ListResp> list($5.ListReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$list, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> restartSubsystem($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$restartSubsystem, request, options: options);
  }
}

abstract class PersistentSubscriptionsServiceBase extends $grpc.Service {
  $core.String get $name =>
      'event_store.client.persistent_subscriptions.PersistentSubscriptions';

  PersistentSubscriptionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.CreateReq, $5.CreateResp>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.CreateReq.fromBuffer(value),
        ($5.CreateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.UpdateReq, $5.UpdateResp>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.UpdateReq.fromBuffer(value),
        ($5.UpdateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.DeleteReq, $5.DeleteResp>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.DeleteReq.fromBuffer(value),
        ($5.DeleteResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ReadReq, $5.ReadResp>(
        'Read',
        read,
        true,
        true,
        ($core.List<$core.int> value) => $5.ReadReq.fromBuffer(value),
        ($5.ReadResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GetInfoReq, $5.GetInfoResp>(
        'GetInfo',
        getInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.GetInfoReq.fromBuffer(value),
        ($5.GetInfoResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ReplayParkedReq, $5.ReplayParkedResp>(
        'ReplayParked',
        replayParked_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ReplayParkedReq.fromBuffer(value),
        ($5.ReplayParkedResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ListReq, $5.ListResp>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ListReq.fromBuffer(value),
        ($5.ListResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.Empty>(
        'RestartSubsystem',
        restartSubsystem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$5.CreateResp> create_Pre(
      $grpc.ServiceCall call, $async.Future<$5.CreateReq> request) async {
    return create(call, await request);
  }

  $async.Future<$5.UpdateResp> update_Pre(
      $grpc.ServiceCall call, $async.Future<$5.UpdateReq> request) async {
    return update(call, await request);
  }

  $async.Future<$5.DeleteResp> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$5.DeleteReq> request) async {
    return delete(call, await request);
  }

  $async.Future<$5.GetInfoResp> getInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$5.GetInfoReq> request) async {
    return getInfo(call, await request);
  }

  $async.Future<$5.ReplayParkedResp> replayParked_Pre(
      $grpc.ServiceCall call, $async.Future<$5.ReplayParkedReq> request) async {
    return replayParked(call, await request);
  }

  $async.Future<$5.ListResp> list_Pre(
      $grpc.ServiceCall call, $async.Future<$5.ListReq> request) async {
    return list(call, await request);
  }

  $async.Future<$1.Empty> restartSubsystem_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return restartSubsystem(call, await request);
  }

  $async.Future<$5.CreateResp> create(
      $grpc.ServiceCall call, $5.CreateReq request);
  $async.Future<$5.UpdateResp> update(
      $grpc.ServiceCall call, $5.UpdateReq request);
  $async.Future<$5.DeleteResp> delete(
      $grpc.ServiceCall call, $5.DeleteReq request);
  $async.Stream<$5.ReadResp> read(
      $grpc.ServiceCall call, $async.Stream<$5.ReadReq> request);
  $async.Future<$5.GetInfoResp> getInfo(
      $grpc.ServiceCall call, $5.GetInfoReq request);
  $async.Future<$5.ReplayParkedResp> replayParked(
      $grpc.ServiceCall call, $5.ReplayParkedReq request);
  $async.Future<$5.ListResp> list($grpc.ServiceCall call, $5.ListReq request);
  $async.Future<$1.Empty> restartSubsystem(
      $grpc.ServiceCall call, $1.Empty request);
}
