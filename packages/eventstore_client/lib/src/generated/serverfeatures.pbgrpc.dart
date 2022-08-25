///
//  Generated code. Do not modify.
//  source: serverfeatures.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'shared.pb.dart' as $1;
import 'serverfeatures.pb.dart' as $7;
export 'serverfeatures.pb.dart';

class ServerFeaturesClient extends $grpc.Client {
  static final _$getSupportedMethods = $grpc.ClientMethod<$1.Empty,
          $7.SupportedMethods>(
      '/event_store.client.server_features.ServerFeatures/GetSupportedMethods',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.SupportedMethods.fromBuffer(value));

  ServerFeaturesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$7.SupportedMethods> getSupportedMethods(
      $1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSupportedMethods, request, options: options);
  }
}

abstract class ServerFeaturesServiceBase extends $grpc.Service {
  $core.String get $name => 'event_store.client.server_features.ServerFeatures';

  ServerFeaturesServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Empty, $7.SupportedMethods>(
        'GetSupportedMethods',
        getSupportedMethods_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($7.SupportedMethods value) => value.writeToBuffer()));
  }

  $async.Future<$7.SupportedMethods> getSupportedMethods_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getSupportedMethods(call, await request);
  }

  $async.Future<$7.SupportedMethods> getSupportedMethods(
      $grpc.ServiceCall call, $1.Empty request);
}
