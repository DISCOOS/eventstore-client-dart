///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'users.pb.dart' as $9;
export 'users.pb.dart';

class UsersClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$9.CreateReq, $9.CreateResp>(
      '/event_store.client.users.Users/Create',
      ($9.CreateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.CreateResp.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$9.UpdateReq, $9.UpdateResp>(
      '/event_store.client.users.Users/Update',
      ($9.UpdateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.UpdateResp.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$9.DeleteReq, $9.DeleteResp>(
      '/event_store.client.users.Users/Delete',
      ($9.DeleteReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.DeleteResp.fromBuffer(value));
  static final _$disable = $grpc.ClientMethod<$9.DisableReq, $9.DisableResp>(
      '/event_store.client.users.Users/Disable',
      ($9.DisableReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.DisableResp.fromBuffer(value));
  static final _$enable = $grpc.ClientMethod<$9.EnableReq, $9.EnableResp>(
      '/event_store.client.users.Users/Enable',
      ($9.EnableReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.EnableResp.fromBuffer(value));
  static final _$details = $grpc.ClientMethod<$9.DetailsReq, $9.DetailsResp>(
      '/event_store.client.users.Users/Details',
      ($9.DetailsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.DetailsResp.fromBuffer(value));
  static final _$changePassword =
      $grpc.ClientMethod<$9.ChangePasswordReq, $9.ChangePasswordResp>(
          '/event_store.client.users.Users/ChangePassword',
          ($9.ChangePasswordReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $9.ChangePasswordResp.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$9.ResetPasswordReq, $9.ResetPasswordResp>(
          '/event_store.client.users.Users/ResetPassword',
          ($9.ResetPasswordReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $9.ResetPasswordResp.fromBuffer(value));

  UsersClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$9.CreateResp> create($9.CreateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$9.UpdateResp> update($9.UpdateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$9.DeleteResp> delete($9.DeleteReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$9.DisableResp> disable($9.DisableReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disable, request, options: options);
  }

  $grpc.ResponseFuture<$9.EnableResp> enable($9.EnableReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$enable, request, options: options);
  }

  $grpc.ResponseStream<$9.DetailsResp> details($9.DetailsReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$details, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$9.ChangePasswordResp> changePassword(
      $9.ChangePasswordReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePassword, request, options: options);
  }

  $grpc.ResponseFuture<$9.ResetPasswordResp> resetPassword(
      $9.ResetPasswordReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }
}

abstract class UsersServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.client.users.Users';

  UsersServiceBase() {
    $addMethod($grpc.ServiceMethod<$9.CreateReq, $9.CreateResp>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.CreateReq.fromBuffer(value),
        ($9.CreateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UpdateReq, $9.UpdateResp>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.UpdateReq.fromBuffer(value),
        ($9.UpdateResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.DeleteReq, $9.DeleteResp>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.DeleteReq.fromBuffer(value),
        ($9.DeleteResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.DisableReq, $9.DisableResp>(
        'Disable',
        disable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.DisableReq.fromBuffer(value),
        ($9.DisableResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.EnableReq, $9.EnableResp>(
        'Enable',
        enable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.EnableReq.fromBuffer(value),
        ($9.EnableResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.DetailsReq, $9.DetailsResp>(
        'Details',
        details_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $9.DetailsReq.fromBuffer(value),
        ($9.DetailsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.ChangePasswordReq, $9.ChangePasswordResp>(
        'ChangePassword',
        changePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.ChangePasswordReq.fromBuffer(value),
        ($9.ChangePasswordResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.ResetPasswordReq, $9.ResetPasswordResp>(
        'ResetPassword',
        resetPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.ResetPasswordReq.fromBuffer(value),
        ($9.ResetPasswordResp value) => value.writeToBuffer()));
  }

  $async.Future<$9.CreateResp> create_Pre(
      $grpc.ServiceCall call, $async.Future<$9.CreateReq> request) async {
    return create(call, await request);
  }

  $async.Future<$9.UpdateResp> update_Pre(
      $grpc.ServiceCall call, $async.Future<$9.UpdateReq> request) async {
    return update(call, await request);
  }

  $async.Future<$9.DeleteResp> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$9.DeleteReq> request) async {
    return delete(call, await request);
  }

  $async.Future<$9.DisableResp> disable_Pre(
      $grpc.ServiceCall call, $async.Future<$9.DisableReq> request) async {
    return disable(call, await request);
  }

  $async.Future<$9.EnableResp> enable_Pre(
      $grpc.ServiceCall call, $async.Future<$9.EnableReq> request) async {
    return enable(call, await request);
  }

  $async.Stream<$9.DetailsResp> details_Pre(
      $grpc.ServiceCall call, $async.Future<$9.DetailsReq> request) async* {
    yield* details(call, await request);
  }

  $async.Future<$9.ChangePasswordResp> changePassword_Pre(
      $grpc.ServiceCall call,
      $async.Future<$9.ChangePasswordReq> request) async {
    return changePassword(call, await request);
  }

  $async.Future<$9.ResetPasswordResp> resetPassword_Pre($grpc.ServiceCall call,
      $async.Future<$9.ResetPasswordReq> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$9.CreateResp> create(
      $grpc.ServiceCall call, $9.CreateReq request);
  $async.Future<$9.UpdateResp> update(
      $grpc.ServiceCall call, $9.UpdateReq request);
  $async.Future<$9.DeleteResp> delete(
      $grpc.ServiceCall call, $9.DeleteReq request);
  $async.Future<$9.DisableResp> disable(
      $grpc.ServiceCall call, $9.DisableReq request);
  $async.Future<$9.EnableResp> enable(
      $grpc.ServiceCall call, $9.EnableReq request);
  $async.Stream<$9.DetailsResp> details(
      $grpc.ServiceCall call, $9.DetailsReq request);
  $async.Future<$9.ChangePasswordResp> changePassword(
      $grpc.ServiceCall call, $9.ChangePasswordReq request);
  $async.Future<$9.ResetPasswordResp> resetPassword(
      $grpc.ServiceCall call, $9.ResetPasswordReq request);
}
