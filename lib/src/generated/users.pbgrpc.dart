///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'users.pb.dart' as $8;
export 'users.pb.dart';

class UsersClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$8.CreateReq, $8.CreateResp>(
      '/event_store.client.users.Users/Create',
      ($8.CreateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.CreateResp.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$8.UpdateReq, $8.UpdateResp>(
      '/event_store.client.users.Users/Update',
      ($8.UpdateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.UpdateResp.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$8.DeleteReq, $8.DeleteResp>(
      '/event_store.client.users.Users/Delete',
      ($8.DeleteReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.DeleteResp.fromBuffer(value));
  static final _$disable = $grpc.ClientMethod<$8.DisableReq, $8.DisableResp>(
      '/event_store.client.users.Users/Disable',
      ($8.DisableReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.DisableResp.fromBuffer(value));
  static final _$enable = $grpc.ClientMethod<$8.EnableReq, $8.EnableResp>(
      '/event_store.client.users.Users/Enable',
      ($8.EnableReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.EnableResp.fromBuffer(value));
  static final _$details = $grpc.ClientMethod<$8.DetailsReq, $8.DetailsResp>(
      '/event_store.client.users.Users/Details',
      ($8.DetailsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.DetailsResp.fromBuffer(value));
  static final _$changePassword =
      $grpc.ClientMethod<$8.ChangePasswordReq, $8.ChangePasswordResp>(
          '/event_store.client.users.Users/ChangePassword',
          ($8.ChangePasswordReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $8.ChangePasswordResp.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$8.ResetPasswordReq, $8.ResetPasswordResp>(
          '/event_store.client.users.Users/ResetPassword',
          ($8.ResetPasswordReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $8.ResetPasswordResp.fromBuffer(value));

  UsersClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$8.CreateResp> create($8.CreateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$8.UpdateResp> update($8.UpdateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$8.DeleteResp> delete($8.DeleteReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$8.DisableResp> disable($8.DisableReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disable, request, options: options);
  }

  $grpc.ResponseFuture<$8.EnableResp> enable($8.EnableReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$enable, request, options: options);
  }

  $grpc.ResponseStream<$8.DetailsResp> details($8.DetailsReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$details, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$8.ChangePasswordResp> changePassword(
      $8.ChangePasswordReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePassword, request, options: options);
  }

  $grpc.ResponseFuture<$8.ResetPasswordResp> resetPassword(
      $8.ResetPasswordReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }
}

abstract class UsersServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.client.users.Users';

  UsersServiceBase() {
    $addMethod($grpc.ServiceMethod<$8.CreateReq, $8.CreateResp>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.CreateReq.fromBuffer(value),
        ($8.CreateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UpdateReq, $8.UpdateResp>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UpdateReq.fromBuffer(value),
        ($8.UpdateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.DeleteReq, $8.DeleteResp>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.DeleteReq.fromBuffer(value),
        ($8.DeleteResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.DisableReq, $8.DisableResp>(
        'Disable',
        disable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.DisableReq.fromBuffer(value),
        ($8.DisableResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.EnableReq, $8.EnableResp>(
        'Enable',
        enable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.EnableReq.fromBuffer(value),
        ($8.EnableResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.DetailsReq, $8.DetailsResp>(
        'Details',
        details_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $8.DetailsReq.fromBuffer(value),
        ($8.DetailsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChangePasswordReq, $8.ChangePasswordResp>(
        'ChangePassword',
        changePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChangePasswordReq.fromBuffer(value),
        ($8.ChangePasswordResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ResetPasswordReq, $8.ResetPasswordResp>(
        'ResetPassword',
        resetPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ResetPasswordReq.fromBuffer(value),
        ($8.ResetPasswordResp value) => value.writeToBuffer()));
  }

  $async.Future<$8.CreateResp> create_Pre(
      $grpc.ServiceCall call, $async.Future<$8.CreateReq> request) async {
    return create(call, await request);
  }

  $async.Future<$8.UpdateResp> update_Pre(
      $grpc.ServiceCall call, $async.Future<$8.UpdateReq> request) async {
    return update(call, await request);
  }

  $async.Future<$8.DeleteResp> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$8.DeleteReq> request) async {
    return delete(call, await request);
  }

  $async.Future<$8.DisableResp> disable_Pre(
      $grpc.ServiceCall call, $async.Future<$8.DisableReq> request) async {
    return disable(call, await request);
  }

  $async.Future<$8.EnableResp> enable_Pre(
      $grpc.ServiceCall call, $async.Future<$8.EnableReq> request) async {
    return enable(call, await request);
  }

  $async.Stream<$8.DetailsResp> details_Pre(
      $grpc.ServiceCall call, $async.Future<$8.DetailsReq> request) async* {
    yield* details(call, await request);
  }

  $async.Future<$8.ChangePasswordResp> changePassword_Pre(
      $grpc.ServiceCall call,
      $async.Future<$8.ChangePasswordReq> request) async {
    return changePassword(call, await request);
  }

  $async.Future<$8.ResetPasswordResp> resetPassword_Pre($grpc.ServiceCall call,
      $async.Future<$8.ResetPasswordReq> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$8.CreateResp> create(
      $grpc.ServiceCall call, $8.CreateReq request);
  $async.Future<$8.UpdateResp> update(
      $grpc.ServiceCall call, $8.UpdateReq request);
  $async.Future<$8.DeleteResp> delete(
      $grpc.ServiceCall call, $8.DeleteReq request);
  $async.Future<$8.DisableResp> disable(
      $grpc.ServiceCall call, $8.DisableReq request);
  $async.Future<$8.EnableResp> enable(
      $grpc.ServiceCall call, $8.EnableReq request);
  $async.Stream<$8.DetailsResp> details(
      $grpc.ServiceCall call, $8.DetailsReq request);
  $async.Future<$8.ChangePasswordResp> changePassword(
      $grpc.ServiceCall call, $8.ChangePasswordReq request);
  $async.Future<$8.ResetPasswordResp> resetPassword(
      $grpc.ServiceCall call, $8.ResetPasswordReq request);
}
