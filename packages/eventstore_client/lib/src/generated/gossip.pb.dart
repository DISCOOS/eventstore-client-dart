///
//  Generated code. Do not modify.
//  source: gossip.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'shared.pb.dart' as $1;

import 'gossip.pbenum.dart';

export 'gossip.pbenum.dart';

class ClusterInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ClusterInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.gossip'),
      createEmptyInstance: create)
    ..pc<MemberInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: MemberInfo.create)
    ..hasRequiredFields = false;

  ClusterInfo._() : super();
  factory ClusterInfo({
    $core.Iterable<MemberInfo>? members,
  }) {
    final _result = create();
    if (members != null) {
      _result.members.addAll(members);
    }
    return _result;
  }
  factory ClusterInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClusterInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClusterInfo clone() => ClusterInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClusterInfo copyWith(void Function(ClusterInfo) updates) =>
      super.copyWith((message) => updates(message as ClusterInfo))
          as ClusterInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClusterInfo create() => ClusterInfo._();
  ClusterInfo createEmptyInstance() => create();
  static $pb.PbList<ClusterInfo> createRepeated() => $pb.PbList<ClusterInfo>();
  @$core.pragma('dart2js:noInline')
  static ClusterInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClusterInfo>(create);
  static ClusterInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MemberInfo> get members => $_getList(0);
}

class EndPoint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EndPoint',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.gossip'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'address')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'port',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  EndPoint._() : super();
  factory EndPoint({
    $core.String? address,
    $core.int? port,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (port != null) {
      _result.port = port;
    }
    return _result;
  }
  factory EndPoint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EndPoint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EndPoint clone() => EndPoint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EndPoint copyWith(void Function(EndPoint) updates) =>
      super.copyWith((message) => updates(message as EndPoint))
          as EndPoint; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EndPoint create() => EndPoint._();
  EndPoint createEmptyInstance() => create();
  static $pb.PbList<EndPoint> createRepeated() => $pb.PbList<EndPoint>();
  @$core.pragma('dart2js:noInline')
  static EndPoint getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EndPoint>(create);
  static EndPoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => clearField(2);
}

class MemberInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MemberInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.gossip'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'instanceId',
        subBuilder: $1.UUID.create)
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'timeStamp')
    ..e<MemberInfo_VNodeState>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OE,
        defaultOrMaker: MemberInfo_VNodeState.Initializing,
        valueOf: MemberInfo_VNodeState.valueOf,
        enumValues: MemberInfo_VNodeState.values)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isAlive')
    ..aOM<EndPoint>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'httpEndPoint',
        subBuilder: EndPoint.create)
    ..hasRequiredFields = false;

  MemberInfo._() : super();
  factory MemberInfo({
    $1.UUID? instanceId,
    $fixnum.Int64? timeStamp,
    MemberInfo_VNodeState? state,
    $core.bool? isAlive,
    EndPoint? httpEndPoint,
  }) {
    final _result = create();
    if (instanceId != null) {
      _result.instanceId = instanceId;
    }
    if (timeStamp != null) {
      _result.timeStamp = timeStamp;
    }
    if (state != null) {
      _result.state = state;
    }
    if (isAlive != null) {
      _result.isAlive = isAlive;
    }
    if (httpEndPoint != null) {
      _result.httpEndPoint = httpEndPoint;
    }
    return _result;
  }
  factory MemberInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MemberInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MemberInfo clone() => MemberInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MemberInfo copyWith(void Function(MemberInfo) updates) =>
      super.copyWith((message) => updates(message as MemberInfo))
          as MemberInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MemberInfo create() => MemberInfo._();
  MemberInfo createEmptyInstance() => create();
  static $pb.PbList<MemberInfo> createRepeated() => $pb.PbList<MemberInfo>();
  @$core.pragma('dart2js:noInline')
  static MemberInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MemberInfo>(create);
  static MemberInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get instanceId => $_getN(0);
  @$pb.TagNumber(1)
  set instanceId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInstanceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstanceId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureInstanceId() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timeStamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timeStamp($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTimeStamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeStamp() => clearField(2);

  @$pb.TagNumber(3)
  MemberInfo_VNodeState get state => $_getN(2);
  @$pb.TagNumber(3)
  set state(MemberInfo_VNodeState v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isAlive => $_getBF(3);
  @$pb.TagNumber(4)
  set isAlive($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsAlive() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsAlive() => clearField(4);

  @$pb.TagNumber(5)
  EndPoint get httpEndPoint => $_getN(4);
  @$pb.TagNumber(5)
  set httpEndPoint(EndPoint v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHttpEndPoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearHttpEndPoint() => clearField(5);
  @$pb.TagNumber(5)
  EndPoint ensureHttpEndPoint() => $_ensure(4);
}
