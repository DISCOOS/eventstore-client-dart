///
//  Generated code. Do not modify.
//  source: gossip.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'shared.pb.dart' as $1;
import 'gossip.pb.dart' as $2;
export 'gossip.pb.dart';

class GossipClient extends $grpc.Client {
  static final _$read = $grpc.ClientMethod<$1.Empty, $2.ClusterInfo>(
      '/event_store.client.gossip.Gossip/Read',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ClusterInfo.fromBuffer(value));

  GossipClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.ClusterInfo> read($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$read, request, options: options);
  }
}

abstract class GossipServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.client.gossip.Gossip';

  GossipServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Empty, $2.ClusterInfo>(
        'Read',
        read_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($2.ClusterInfo value) => value.writeToBuffer()));
  }

  $async.Future<$2.ClusterInfo> read_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return read(call, await request);
  }

  $async.Future<$2.ClusterInfo> read($grpc.ServiceCall call, $1.Empty request);
}
