///
//  Generated code. Do not modify.
//  source: cluster.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'cluster.pb.dart' as $0;
import 'shared.pb.dart' as $1;
export 'cluster.pb.dart';

class GossipClient extends $grpc.Client {
  static final _$update = $grpc.ClientMethod<$0.GossipRequest, $0.ClusterInfo>(
      '/event_store.cluster.Gossip/Update',
      ($0.GossipRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ClusterInfo.fromBuffer(value));
  static final _$read = $grpc.ClientMethod<$1.Empty, $0.ClusterInfo>(
      '/event_store.cluster.Gossip/Read',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ClusterInfo.fromBuffer(value));

  GossipClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ClusterInfo> update($0.GossipRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$0.ClusterInfo> read($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$read, request, options: options);
  }
}

abstract class GossipServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.cluster.Gossip';

  GossipServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GossipRequest, $0.ClusterInfo>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GossipRequest.fromBuffer(value),
        ($0.ClusterInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ClusterInfo>(
        'Read',
        read_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ClusterInfo value) => value.writeToBuffer()));
  }

  $async.Future<$0.ClusterInfo> update_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GossipRequest> request) async {
    return update(call, await request);
  }

  $async.Future<$0.ClusterInfo> read_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return read(call, await request);
  }

  $async.Future<$0.ClusterInfo> update(
      $grpc.ServiceCall call, $0.GossipRequest request);
  $async.Future<$0.ClusterInfo> read($grpc.ServiceCall call, $1.Empty request);
}

class ElectionsClient extends $grpc.Client {
  static final _$viewChange =
      $grpc.ClientMethod<$0.ViewChangeRequest, $1.Empty>(
          '/event_store.cluster.Elections/ViewChange',
          ($0.ViewChangeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$viewChangeProof =
      $grpc.ClientMethod<$0.ViewChangeProofRequest, $1.Empty>(
          '/event_store.cluster.Elections/ViewChangeProof',
          ($0.ViewChangeProofRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$prepare = $grpc.ClientMethod<$0.PrepareRequest, $1.Empty>(
      '/event_store.cluster.Elections/Prepare',
      ($0.PrepareRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$prepareOk = $grpc.ClientMethod<$0.PrepareOkRequest, $1.Empty>(
      '/event_store.cluster.Elections/PrepareOk',
      ($0.PrepareOkRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$proposal = $grpc.ClientMethod<$0.ProposalRequest, $1.Empty>(
      '/event_store.cluster.Elections/Proposal',
      ($0.ProposalRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$accept = $grpc.ClientMethod<$0.AcceptRequest, $1.Empty>(
      '/event_store.cluster.Elections/Accept',
      ($0.AcceptRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$leaderIsResigning =
      $grpc.ClientMethod<$0.LeaderIsResigningRequest, $1.Empty>(
          '/event_store.cluster.Elections/LeaderIsResigning',
          ($0.LeaderIsResigningRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$leaderIsResigningOk =
      $grpc.ClientMethod<$0.LeaderIsResigningOkRequest, $1.Empty>(
          '/event_store.cluster.Elections/LeaderIsResigningOk',
          ($0.LeaderIsResigningOkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  ElectionsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Empty> viewChange($0.ViewChangeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$viewChange, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> viewChangeProof(
      $0.ViewChangeProofRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$viewChangeProof, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> prepare($0.PrepareRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$prepare, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> prepareOk($0.PrepareOkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$prepareOk, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> proposal($0.ProposalRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$proposal, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> accept($0.AcceptRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$accept, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> leaderIsResigning(
      $0.LeaderIsResigningRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaderIsResigning, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> leaderIsResigningOk(
      $0.LeaderIsResigningOkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaderIsResigningOk, request, options: options);
  }
}

abstract class ElectionsServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.cluster.Elections';

  ElectionsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ViewChangeRequest, $1.Empty>(
        'ViewChange',
        viewChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ViewChangeRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ViewChangeProofRequest, $1.Empty>(
        'ViewChangeProof',
        viewChangeProof_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ViewChangeProofRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PrepareRequest, $1.Empty>(
        'Prepare',
        prepare_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PrepareRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PrepareOkRequest, $1.Empty>(
        'PrepareOk',
        prepareOk_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PrepareOkRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProposalRequest, $1.Empty>(
        'Proposal',
        proposal_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProposalRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AcceptRequest, $1.Empty>(
        'Accept',
        accept_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AcceptRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LeaderIsResigningRequest, $1.Empty>(
        'LeaderIsResigning',
        leaderIsResigning_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.LeaderIsResigningRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LeaderIsResigningOkRequest, $1.Empty>(
        'LeaderIsResigningOk',
        leaderIsResigningOk_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.LeaderIsResigningOkRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> viewChange_Pre($grpc.ServiceCall call,
      $async.Future<$0.ViewChangeRequest> request) async {
    return viewChange(call, await request);
  }

  $async.Future<$1.Empty> viewChangeProof_Pre($grpc.ServiceCall call,
      $async.Future<$0.ViewChangeProofRequest> request) async {
    return viewChangeProof(call, await request);
  }

  $async.Future<$1.Empty> prepare_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PrepareRequest> request) async {
    return prepare(call, await request);
  }

  $async.Future<$1.Empty> prepareOk_Pre($grpc.ServiceCall call,
      $async.Future<$0.PrepareOkRequest> request) async {
    return prepareOk(call, await request);
  }

  $async.Future<$1.Empty> proposal_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ProposalRequest> request) async {
    return proposal(call, await request);
  }

  $async.Future<$1.Empty> accept_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AcceptRequest> request) async {
    return accept(call, await request);
  }

  $async.Future<$1.Empty> leaderIsResigning_Pre($grpc.ServiceCall call,
      $async.Future<$0.LeaderIsResigningRequest> request) async {
    return leaderIsResigning(call, await request);
  }

  $async.Future<$1.Empty> leaderIsResigningOk_Pre($grpc.ServiceCall call,
      $async.Future<$0.LeaderIsResigningOkRequest> request) async {
    return leaderIsResigningOk(call, await request);
  }

  $async.Future<$1.Empty> viewChange(
      $grpc.ServiceCall call, $0.ViewChangeRequest request);
  $async.Future<$1.Empty> viewChangeProof(
      $grpc.ServiceCall call, $0.ViewChangeProofRequest request);
  $async.Future<$1.Empty> prepare(
      $grpc.ServiceCall call, $0.PrepareRequest request);
  $async.Future<$1.Empty> prepareOk(
      $grpc.ServiceCall call, $0.PrepareOkRequest request);
  $async.Future<$1.Empty> proposal(
      $grpc.ServiceCall call, $0.ProposalRequest request);
  $async.Future<$1.Empty> accept(
      $grpc.ServiceCall call, $0.AcceptRequest request);
  $async.Future<$1.Empty> leaderIsResigning(
      $grpc.ServiceCall call, $0.LeaderIsResigningRequest request);
  $async.Future<$1.Empty> leaderIsResigningOk(
      $grpc.ServiceCall call, $0.LeaderIsResigningOkRequest request);
}
