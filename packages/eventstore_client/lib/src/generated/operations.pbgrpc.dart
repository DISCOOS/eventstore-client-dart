///
//  Generated code. Do not modify.
//  source: operations.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'operations.pb.dart' as $4;
import 'shared.pb.dart' as $1;
export 'operations.pb.dart';

class OperationsClient extends $grpc.Client {
  static final _$startScavenge =
      $grpc.ClientMethod<$4.StartScavengeReq, $4.ScavengeResp>(
          '/event_store.client.operations.Operations/StartScavenge',
          ($4.StartScavengeReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.ScavengeResp.fromBuffer(value));
  static final _$stopScavenge =
      $grpc.ClientMethod<$4.StopScavengeReq, $4.ScavengeResp>(
          '/event_store.client.operations.Operations/StopScavenge',
          ($4.StopScavengeReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $4.ScavengeResp.fromBuffer(value));
  static final _$shutdown = $grpc.ClientMethod<$1.Empty, $1.Empty>(
      '/event_store.client.operations.Operations/Shutdown',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$mergeIndexes = $grpc.ClientMethod<$1.Empty, $1.Empty>(
      '/event_store.client.operations.Operations/MergeIndexes',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$resignNode = $grpc.ClientMethod<$1.Empty, $1.Empty>(
      '/event_store.client.operations.Operations/ResignNode',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$setNodePriority =
      $grpc.ClientMethod<$4.SetNodePriorityReq, $1.Empty>(
          '/event_store.client.operations.Operations/SetNodePriority',
          ($4.SetNodePriorityReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$restartPersistentSubscriptions = $grpc.ClientMethod<$1.Empty,
          $1.Empty>(
      '/event_store.client.operations.Operations/RestartPersistentSubscriptions',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  OperationsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$4.ScavengeResp> startScavenge(
      $4.StartScavengeReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startScavenge, request, options: options);
  }

  $grpc.ResponseFuture<$4.ScavengeResp> stopScavenge($4.StopScavengeReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$stopScavenge, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> shutdown($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$shutdown, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> mergeIndexes($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$mergeIndexes, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> resignNode($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resignNode, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> setNodePriority($4.SetNodePriorityReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setNodePriority, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> restartPersistentSubscriptions(
      $1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$restartPersistentSubscriptions, request,
        options: options);
  }
}

abstract class OperationsServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.client.operations.Operations';

  OperationsServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.StartScavengeReq, $4.ScavengeResp>(
        'StartScavenge',
        startScavenge_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.StartScavengeReq.fromBuffer(value),
        ($4.ScavengeResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.StopScavengeReq, $4.ScavengeResp>(
        'StopScavenge',
        stopScavenge_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.StopScavengeReq.fromBuffer(value),
        ($4.ScavengeResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.Empty>(
        'Shutdown',
        shutdown_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.Empty>(
        'MergeIndexes',
        mergeIndexes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.Empty>(
        'ResignNode',
        resignNode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.SetNodePriorityReq, $1.Empty>(
        'SetNodePriority',
        setNodePriority_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.SetNodePriorityReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.Empty>(
        'RestartPersistentSubscriptions',
        restartPersistentSubscriptions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$4.ScavengeResp> startScavenge_Pre($grpc.ServiceCall call,
      $async.Future<$4.StartScavengeReq> request) async {
    return startScavenge(call, await request);
  }

  $async.Future<$4.ScavengeResp> stopScavenge_Pre(
      $grpc.ServiceCall call, $async.Future<$4.StopScavengeReq> request) async {
    return stopScavenge(call, await request);
  }

  $async.Future<$1.Empty> shutdown_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return shutdown(call, await request);
  }

  $async.Future<$1.Empty> mergeIndexes_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return mergeIndexes(call, await request);
  }

  $async.Future<$1.Empty> resignNode_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return resignNode(call, await request);
  }

  $async.Future<$1.Empty> setNodePriority_Pre($grpc.ServiceCall call,
      $async.Future<$4.SetNodePriorityReq> request) async {
    return setNodePriority(call, await request);
  }

  $async.Future<$1.Empty> restartPersistentSubscriptions_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return restartPersistentSubscriptions(call, await request);
  }

  $async.Future<$4.ScavengeResp> startScavenge(
      $grpc.ServiceCall call, $4.StartScavengeReq request);
  $async.Future<$4.ScavengeResp> stopScavenge(
      $grpc.ServiceCall call, $4.StopScavengeReq request);
  $async.Future<$1.Empty> shutdown($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$1.Empty> mergeIndexes(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$1.Empty> resignNode($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$1.Empty> setNodePriority(
      $grpc.ServiceCall call, $4.SetNodePriorityReq request);
  $async.Future<$1.Empty> restartPersistentSubscriptions(
      $grpc.ServiceCall call, $1.Empty request);
}
