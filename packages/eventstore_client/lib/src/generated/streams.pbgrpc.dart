///
//  Generated code. Do not modify.
//  source: streams.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'streams.pb.dart' as $8;
export 'streams.pb.dart';

class StreamsClient extends $grpc.Client {
  static final _$read = $grpc.ClientMethod<$8.ReadReq, $8.ReadResp>(
      '/event_store.client.streams.Streams/Read',
      ($8.ReadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.ReadResp.fromBuffer(value));
  static final _$append = $grpc.ClientMethod<$8.AppendReq, $8.AppendResp>(
      '/event_store.client.streams.Streams/Append',
      ($8.AppendReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.AppendResp.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$8.DeleteReq, $8.DeleteResp>(
      '/event_store.client.streams.Streams/Delete',
      ($8.DeleteReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.DeleteResp.fromBuffer(value));
  static final _$tombstone =
      $grpc.ClientMethod<$8.TombstoneReq, $8.TombstoneResp>(
          '/event_store.client.streams.Streams/Tombstone',
          ($8.TombstoneReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $8.TombstoneResp.fromBuffer(value));
  static final _$batchAppend =
      $grpc.ClientMethod<$8.BatchAppendReq, $8.BatchAppendResp>(
          '/event_store.client.streams.Streams/BatchAppend',
          ($8.BatchAppendReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $8.BatchAppendResp.fromBuffer(value));

  StreamsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$8.ReadResp> read($8.ReadReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$read, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$8.AppendResp> append(
      $async.Stream<$8.AppendReq> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$append, request, options: options).single;
  }

  $grpc.ResponseFuture<$8.DeleteResp> delete($8.DeleteReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$8.TombstoneResp> tombstone($8.TombstoneReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$tombstone, request, options: options);
  }

  $grpc.ResponseStream<$8.BatchAppendResp> batchAppend(
      $async.Stream<$8.BatchAppendReq> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$batchAppend, request, options: options);
  }
}

abstract class StreamsServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.client.streams.Streams';

  StreamsServiceBase() {
    $addMethod($grpc.ServiceMethod<$8.ReadReq, $8.ReadResp>(
        'Read',
        read_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $8.ReadReq.fromBuffer(value),
        ($8.ReadResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.AppendReq, $8.AppendResp>(
        'Append',
        append,
        true,
        false,
        ($core.List<$core.int> value) => $8.AppendReq.fromBuffer(value),
        ($8.AppendResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.DeleteReq, $8.DeleteResp>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.DeleteReq.fromBuffer(value),
        ($8.DeleteResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.TombstoneReq, $8.TombstoneResp>(
        'Tombstone',
        tombstone_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.TombstoneReq.fromBuffer(value),
        ($8.TombstoneResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.BatchAppendReq, $8.BatchAppendResp>(
        'BatchAppend',
        batchAppend,
        true,
        true,
        ($core.List<$core.int> value) => $8.BatchAppendReq.fromBuffer(value),
        ($8.BatchAppendResp value) => value.writeToBuffer()));
  }

  $async.Stream<$8.ReadResp> read_Pre(
      $grpc.ServiceCall call, $async.Future<$8.ReadReq> request) async* {
    yield* read(call, await request);
  }

  $async.Future<$8.DeleteResp> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$8.DeleteReq> request) async {
    return delete(call, await request);
  }

  $async.Future<$8.TombstoneResp> tombstone_Pre(
      $grpc.ServiceCall call, $async.Future<$8.TombstoneReq> request) async {
    return tombstone(call, await request);
  }

  $async.Stream<$8.ReadResp> read($grpc.ServiceCall call, $8.ReadReq request);
  $async.Future<$8.AppendResp> append(
      $grpc.ServiceCall call, $async.Stream<$8.AppendReq> request);
  $async.Future<$8.DeleteResp> delete(
      $grpc.ServiceCall call, $8.DeleteReq request);
  $async.Future<$8.TombstoneResp> tombstone(
      $grpc.ServiceCall call, $8.TombstoneReq request);
  $async.Stream<$8.BatchAppendResp> batchAppend(
      $grpc.ServiceCall call, $async.Stream<$8.BatchAppendReq> request);
}
