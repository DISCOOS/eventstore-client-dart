///
//  Generated code. Do not modify.
//  source: streams.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'streams.pb.dart' as $7;
export 'streams.pb.dart';

class StreamsClient extends $grpc.Client {
  static final _$read = $grpc.ClientMethod<$7.ReadReq, $7.ReadResp>(
      '/event_store.client.streams.Streams/Read',
      ($7.ReadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.ReadResp.fromBuffer(value));
  static final _$append = $grpc.ClientMethod<$7.AppendReq, $7.AppendResp>(
      '/event_store.client.streams.Streams/Append',
      ($7.AppendReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.AppendResp.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$7.DeleteReq, $7.DeleteResp>(
      '/event_store.client.streams.Streams/Delete',
      ($7.DeleteReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.DeleteResp.fromBuffer(value));
  static final _$tombstone =
      $grpc.ClientMethod<$7.TombstoneReq, $7.TombstoneResp>(
          '/event_store.client.streams.Streams/Tombstone',
          ($7.TombstoneReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $7.TombstoneResp.fromBuffer(value));

  StreamsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$7.ReadResp> read($7.ReadReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$read, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$7.AppendResp> append(
      $async.Stream<$7.AppendReq> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$append, request, options: options).single;
  }

  $grpc.ResponseFuture<$7.DeleteResp> delete($7.DeleteReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$7.TombstoneResp> tombstone($7.TombstoneReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$tombstone, request, options: options);
  }
}

abstract class StreamsServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.client.streams.Streams';

  StreamsServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.ReadReq, $7.ReadResp>(
        'Read',
        read_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $7.ReadReq.fromBuffer(value),
        ($7.ReadResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.AppendReq, $7.AppendResp>(
        'Append',
        append,
        true,
        false,
        ($core.List<$core.int> value) => $7.AppendReq.fromBuffer(value),
        ($7.AppendResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.DeleteReq, $7.DeleteResp>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.DeleteReq.fromBuffer(value),
        ($7.DeleteResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.TombstoneReq, $7.TombstoneResp>(
        'Tombstone',
        tombstone_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.TombstoneReq.fromBuffer(value),
        ($7.TombstoneResp value) => value.writeToBuffer()));
  }

  $async.Stream<$7.ReadResp> read_Pre(
      $grpc.ServiceCall call, $async.Future<$7.ReadReq> request) async* {
    yield* read(call, await request);
  }

  $async.Future<$7.DeleteResp> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$7.DeleteReq> request) async {
    return delete(call, await request);
  }

  $async.Future<$7.TombstoneResp> tombstone_Pre(
      $grpc.ServiceCall call, $async.Future<$7.TombstoneReq> request) async {
    return tombstone(call, await request);
  }

  $async.Stream<$7.ReadResp> read($grpc.ServiceCall call, $7.ReadReq request);
  $async.Future<$7.AppendResp> append(
      $grpc.ServiceCall call, $async.Stream<$7.AppendReq> request);
  $async.Future<$7.DeleteResp> delete(
      $grpc.ServiceCall call, $7.DeleteReq request);
  $async.Future<$7.TombstoneResp> tombstone(
      $grpc.ServiceCall call, $7.TombstoneReq request);
}
