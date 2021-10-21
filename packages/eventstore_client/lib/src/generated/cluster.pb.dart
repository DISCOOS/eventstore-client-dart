///
//  Generated code. Do not modify.
//  source: cluster.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'shared.pb.dart' as $1;

import 'cluster.pbenum.dart';

export 'cluster.pbenum.dart';

class GossipRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GossipRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aOM<ClusterInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info',
        subBuilder: ClusterInfo.create)
    ..aOM<EndPoint>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'server',
        subBuilder: EndPoint.create)
    ..hasRequiredFields = false;

  GossipRequest._() : super();
  factory GossipRequest({
    ClusterInfo? info,
    EndPoint? server,
  }) {
    final _result = create();
    if (info != null) {
      _result.info = info;
    }
    if (server != null) {
      _result.server = server;
    }
    return _result;
  }
  factory GossipRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GossipRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GossipRequest clone() => GossipRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GossipRequest copyWith(void Function(GossipRequest) updates) =>
      super.copyWith((message) => updates(message as GossipRequest))
          as GossipRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GossipRequest create() => GossipRequest._();
  GossipRequest createEmptyInstance() => create();
  static $pb.PbList<GossipRequest> createRepeated() =>
      $pb.PbList<GossipRequest>();
  @$core.pragma('dart2js:noInline')
  static GossipRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GossipRequest>(create);
  static GossipRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ClusterInfo get info => $_getN(0);
  @$pb.TagNumber(1)
  set info(ClusterInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
  @$pb.TagNumber(1)
  ClusterInfo ensureInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  EndPoint get server => $_getN(1);
  @$pb.TagNumber(2)
  set server(EndPoint v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServer() => $_has(1);
  @$pb.TagNumber(2)
  void clearServer() => clearField(2);
  @$pb.TagNumber(2)
  EndPoint ensureServer() => $_ensure(1);
}

class ViewChangeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViewChangeRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverHttp',
        subBuilder: EndPoint.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'attemptedView',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ViewChangeRequest._() : super();
  factory ViewChangeRequest({
    $1.UUID? serverId,
    EndPoint? serverHttp,
    $core.int? attemptedView,
  }) {
    final _result = create();
    if (serverId != null) {
      _result.serverId = serverId;
    }
    if (serverHttp != null) {
      _result.serverHttp = serverHttp;
    }
    if (attemptedView != null) {
      _result.attemptedView = attemptedView;
    }
    return _result;
  }
  factory ViewChangeRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViewChangeRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViewChangeRequest clone() => ViewChangeRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViewChangeRequest copyWith(void Function(ViewChangeRequest) updates) =>
      super.copyWith((message) => updates(message as ViewChangeRequest))
          as ViewChangeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViewChangeRequest create() => ViewChangeRequest._();
  ViewChangeRequest createEmptyInstance() => create();
  static $pb.PbList<ViewChangeRequest> createRepeated() =>
      $pb.PbList<ViewChangeRequest>();
  @$core.pragma('dart2js:noInline')
  static ViewChangeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViewChangeRequest>(create);
  static ViewChangeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get serverId => $_getN(0);
  @$pb.TagNumber(1)
  set serverId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureServerId() => $_ensure(0);

  @$pb.TagNumber(2)
  EndPoint get serverHttp => $_getN(1);
  @$pb.TagNumber(2)
  set serverHttp(EndPoint v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServerHttp() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerHttp() => clearField(2);
  @$pb.TagNumber(2)
  EndPoint ensureServerHttp() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get attemptedView => $_getIZ(2);
  @$pb.TagNumber(3)
  set attemptedView($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAttemptedView() => $_has(2);
  @$pb.TagNumber(3)
  void clearAttemptedView() => clearField(3);
}

class ViewChangeProofRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ViewChangeProofRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverHttp',
        subBuilder: EndPoint.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'installedView',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ViewChangeProofRequest._() : super();
  factory ViewChangeProofRequest({
    $1.UUID? serverId,
    EndPoint? serverHttp,
    $core.int? installedView,
  }) {
    final _result = create();
    if (serverId != null) {
      _result.serverId = serverId;
    }
    if (serverHttp != null) {
      _result.serverHttp = serverHttp;
    }
    if (installedView != null) {
      _result.installedView = installedView;
    }
    return _result;
  }
  factory ViewChangeProofRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ViewChangeProofRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ViewChangeProofRequest clone() =>
      ViewChangeProofRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ViewChangeProofRequest copyWith(
          void Function(ViewChangeProofRequest) updates) =>
      super.copyWith((message) => updates(message as ViewChangeProofRequest))
          as ViewChangeProofRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViewChangeProofRequest create() => ViewChangeProofRequest._();
  ViewChangeProofRequest createEmptyInstance() => create();
  static $pb.PbList<ViewChangeProofRequest> createRepeated() =>
      $pb.PbList<ViewChangeProofRequest>();
  @$core.pragma('dart2js:noInline')
  static ViewChangeProofRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViewChangeProofRequest>(create);
  static ViewChangeProofRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get serverId => $_getN(0);
  @$pb.TagNumber(1)
  set serverId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureServerId() => $_ensure(0);

  @$pb.TagNumber(2)
  EndPoint get serverHttp => $_getN(1);
  @$pb.TagNumber(2)
  set serverHttp(EndPoint v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServerHttp() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerHttp() => clearField(2);
  @$pb.TagNumber(2)
  EndPoint ensureServerHttp() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get installedView => $_getIZ(2);
  @$pb.TagNumber(3)
  set installedView($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInstalledView() => $_has(2);
  @$pb.TagNumber(3)
  void clearInstalledView() => clearField(3);
}

class PrepareRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrepareRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverHttp',
        subBuilder: EndPoint.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'view',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  PrepareRequest._() : super();
  factory PrepareRequest({
    $1.UUID? serverId,
    EndPoint? serverHttp,
    $core.int? view,
  }) {
    final _result = create();
    if (serverId != null) {
      _result.serverId = serverId;
    }
    if (serverHttp != null) {
      _result.serverHttp = serverHttp;
    }
    if (view != null) {
      _result.view = view;
    }
    return _result;
  }
  factory PrepareRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrepareRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrepareRequest clone() => PrepareRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrepareRequest copyWith(void Function(PrepareRequest) updates) =>
      super.copyWith((message) => updates(message as PrepareRequest))
          as PrepareRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrepareRequest create() => PrepareRequest._();
  PrepareRequest createEmptyInstance() => create();
  static $pb.PbList<PrepareRequest> createRepeated() =>
      $pb.PbList<PrepareRequest>();
  @$core.pragma('dart2js:noInline')
  static PrepareRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareRequest>(create);
  static PrepareRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get serverId => $_getN(0);
  @$pb.TagNumber(1)
  set serverId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureServerId() => $_ensure(0);

  @$pb.TagNumber(2)
  EndPoint get serverHttp => $_getN(1);
  @$pb.TagNumber(2)
  set serverHttp(EndPoint v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServerHttp() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerHttp() => clearField(2);
  @$pb.TagNumber(2)
  EndPoint ensureServerHttp() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get view => $_getIZ(2);
  @$pb.TagNumber(3)
  set view($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasView() => $_has(2);
  @$pb.TagNumber(3)
  void clearView() => clearField(3);
}

class PrepareOkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PrepareOkRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'view',
        $pb.PbFieldType.O3)
    ..aOM<$1.UUID>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverHttp',
        subBuilder: EndPoint.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochNumber',
        $pb.PbFieldType.O3)
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochPosition')
    ..aOM<$1.UUID>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochId',
        subBuilder: $1.UUID.create)
    ..aOM<$1.UUID>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochLeaderInstanceId',
        subBuilder: $1.UUID.create)
    ..aInt64(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastCommitPosition')
    ..aInt64(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'writerCheckpoint')
    ..aInt64(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chaserCheckpoint')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nodePriority',
        $pb.PbFieldType.O3)
    ..aOM<ClusterInfo>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clusterInfo',
        subBuilder: ClusterInfo.create)
    ..hasRequiredFields = false;

  PrepareOkRequest._() : super();
  factory PrepareOkRequest({
    $core.int? view,
    $1.UUID? serverId,
    EndPoint? serverHttp,
    $core.int? epochNumber,
    $fixnum.Int64? epochPosition,
    $1.UUID? epochId,
    $1.UUID? epochLeaderInstanceId,
    $fixnum.Int64? lastCommitPosition,
    $fixnum.Int64? writerCheckpoint,
    $fixnum.Int64? chaserCheckpoint,
    $core.int? nodePriority,
    ClusterInfo? clusterInfo,
  }) {
    final _result = create();
    if (view != null) {
      _result.view = view;
    }
    if (serverId != null) {
      _result.serverId = serverId;
    }
    if (serverHttp != null) {
      _result.serverHttp = serverHttp;
    }
    if (epochNumber != null) {
      _result.epochNumber = epochNumber;
    }
    if (epochPosition != null) {
      _result.epochPosition = epochPosition;
    }
    if (epochId != null) {
      _result.epochId = epochId;
    }
    if (epochLeaderInstanceId != null) {
      _result.epochLeaderInstanceId = epochLeaderInstanceId;
    }
    if (lastCommitPosition != null) {
      _result.lastCommitPosition = lastCommitPosition;
    }
    if (writerCheckpoint != null) {
      _result.writerCheckpoint = writerCheckpoint;
    }
    if (chaserCheckpoint != null) {
      _result.chaserCheckpoint = chaserCheckpoint;
    }
    if (nodePriority != null) {
      _result.nodePriority = nodePriority;
    }
    if (clusterInfo != null) {
      _result.clusterInfo = clusterInfo;
    }
    return _result;
  }
  factory PrepareOkRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PrepareOkRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PrepareOkRequest clone() => PrepareOkRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PrepareOkRequest copyWith(void Function(PrepareOkRequest) updates) =>
      super.copyWith((message) => updates(message as PrepareOkRequest))
          as PrepareOkRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PrepareOkRequest create() => PrepareOkRequest._();
  PrepareOkRequest createEmptyInstance() => create();
  static $pb.PbList<PrepareOkRequest> createRepeated() =>
      $pb.PbList<PrepareOkRequest>();
  @$core.pragma('dart2js:noInline')
  static PrepareOkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrepareOkRequest>(create);
  static PrepareOkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get view => $_getIZ(0);
  @$pb.TagNumber(1)
  set view($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasView() => $_has(0);
  @$pb.TagNumber(1)
  void clearView() => clearField(1);

  @$pb.TagNumber(2)
  $1.UUID get serverId => $_getN(1);
  @$pb.TagNumber(2)
  set serverId($1.UUID v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerId() => clearField(2);
  @$pb.TagNumber(2)
  $1.UUID ensureServerId() => $_ensure(1);

  @$pb.TagNumber(3)
  EndPoint get serverHttp => $_getN(2);
  @$pb.TagNumber(3)
  set serverHttp(EndPoint v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasServerHttp() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerHttp() => clearField(3);
  @$pb.TagNumber(3)
  EndPoint ensureServerHttp() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get epochNumber => $_getIZ(3);
  @$pb.TagNumber(4)
  set epochNumber($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEpochNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearEpochNumber() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get epochPosition => $_getI64(4);
  @$pb.TagNumber(5)
  set epochPosition($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEpochPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearEpochPosition() => clearField(5);

  @$pb.TagNumber(6)
  $1.UUID get epochId => $_getN(5);
  @$pb.TagNumber(6)
  set epochId($1.UUID v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEpochId() => $_has(5);
  @$pb.TagNumber(6)
  void clearEpochId() => clearField(6);
  @$pb.TagNumber(6)
  $1.UUID ensureEpochId() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.UUID get epochLeaderInstanceId => $_getN(6);
  @$pb.TagNumber(7)
  set epochLeaderInstanceId($1.UUID v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEpochLeaderInstanceId() => $_has(6);
  @$pb.TagNumber(7)
  void clearEpochLeaderInstanceId() => clearField(7);
  @$pb.TagNumber(7)
  $1.UUID ensureEpochLeaderInstanceId() => $_ensure(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get lastCommitPosition => $_getI64(7);
  @$pb.TagNumber(8)
  set lastCommitPosition($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLastCommitPosition() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastCommitPosition() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get writerCheckpoint => $_getI64(8);
  @$pb.TagNumber(9)
  set writerCheckpoint($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasWriterCheckpoint() => $_has(8);
  @$pb.TagNumber(9)
  void clearWriterCheckpoint() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get chaserCheckpoint => $_getI64(9);
  @$pb.TagNumber(10)
  set chaserCheckpoint($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasChaserCheckpoint() => $_has(9);
  @$pb.TagNumber(10)
  void clearChaserCheckpoint() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get nodePriority => $_getIZ(10);
  @$pb.TagNumber(11)
  set nodePriority($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasNodePriority() => $_has(10);
  @$pb.TagNumber(11)
  void clearNodePriority() => clearField(11);

  @$pb.TagNumber(12)
  ClusterInfo get clusterInfo => $_getN(11);
  @$pb.TagNumber(12)
  set clusterInfo(ClusterInfo v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasClusterInfo() => $_has(11);
  @$pb.TagNumber(12)
  void clearClusterInfo() => clearField(12);
  @$pb.TagNumber(12)
  ClusterInfo ensureClusterInfo() => $_ensure(11);
}

class ProposalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ProposalRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverHttp',
        subBuilder: EndPoint.create)
    ..aOM<$1.UUID>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderHttp',
        subBuilder: EndPoint.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'view',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochNumber',
        $pb.PbFieldType.O3)
    ..aInt64(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochPosition')
    ..aOM<$1.UUID>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochId',
        subBuilder: $1.UUID.create)
    ..aOM<$1.UUID>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochLeaderInstanceId',
        subBuilder: $1.UUID.create)
    ..aInt64(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastCommitPosition')
    ..aInt64(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'writerCheckpoint')
    ..aInt64(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chaserCheckpoint')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nodePriority',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ProposalRequest._() : super();
  factory ProposalRequest({
    $1.UUID? serverId,
    EndPoint? serverHttp,
    $1.UUID? leaderId,
    EndPoint? leaderHttp,
    $core.int? view,
    $core.int? epochNumber,
    $fixnum.Int64? epochPosition,
    $1.UUID? epochId,
    $1.UUID? epochLeaderInstanceId,
    $fixnum.Int64? lastCommitPosition,
    $fixnum.Int64? writerCheckpoint,
    $fixnum.Int64? chaserCheckpoint,
    $core.int? nodePriority,
  }) {
    final _result = create();
    if (serverId != null) {
      _result.serverId = serverId;
    }
    if (serverHttp != null) {
      _result.serverHttp = serverHttp;
    }
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (leaderHttp != null) {
      _result.leaderHttp = leaderHttp;
    }
    if (view != null) {
      _result.view = view;
    }
    if (epochNumber != null) {
      _result.epochNumber = epochNumber;
    }
    if (epochPosition != null) {
      _result.epochPosition = epochPosition;
    }
    if (epochId != null) {
      _result.epochId = epochId;
    }
    if (epochLeaderInstanceId != null) {
      _result.epochLeaderInstanceId = epochLeaderInstanceId;
    }
    if (lastCommitPosition != null) {
      _result.lastCommitPosition = lastCommitPosition;
    }
    if (writerCheckpoint != null) {
      _result.writerCheckpoint = writerCheckpoint;
    }
    if (chaserCheckpoint != null) {
      _result.chaserCheckpoint = chaserCheckpoint;
    }
    if (nodePriority != null) {
      _result.nodePriority = nodePriority;
    }
    return _result;
  }
  factory ProposalRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProposalRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ProposalRequest clone() => ProposalRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ProposalRequest copyWith(void Function(ProposalRequest) updates) =>
      super.copyWith((message) => updates(message as ProposalRequest))
          as ProposalRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProposalRequest create() => ProposalRequest._();
  ProposalRequest createEmptyInstance() => create();
  static $pb.PbList<ProposalRequest> createRepeated() =>
      $pb.PbList<ProposalRequest>();
  @$core.pragma('dart2js:noInline')
  static ProposalRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProposalRequest>(create);
  static ProposalRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get serverId => $_getN(0);
  @$pb.TagNumber(1)
  set serverId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureServerId() => $_ensure(0);

  @$pb.TagNumber(2)
  EndPoint get serverHttp => $_getN(1);
  @$pb.TagNumber(2)
  set serverHttp(EndPoint v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServerHttp() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerHttp() => clearField(2);
  @$pb.TagNumber(2)
  EndPoint ensureServerHttp() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.UUID get leaderId => $_getN(2);
  @$pb.TagNumber(3)
  set leaderId($1.UUID v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeaderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaderId() => clearField(3);
  @$pb.TagNumber(3)
  $1.UUID ensureLeaderId() => $_ensure(2);

  @$pb.TagNumber(4)
  EndPoint get leaderHttp => $_getN(3);
  @$pb.TagNumber(4)
  set leaderHttp(EndPoint v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLeaderHttp() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeaderHttp() => clearField(4);
  @$pb.TagNumber(4)
  EndPoint ensureLeaderHttp() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get view => $_getIZ(4);
  @$pb.TagNumber(5)
  set view($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasView() => $_has(4);
  @$pb.TagNumber(5)
  void clearView() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get epochNumber => $_getIZ(5);
  @$pb.TagNumber(6)
  set epochNumber($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEpochNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearEpochNumber() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get epochPosition => $_getI64(6);
  @$pb.TagNumber(7)
  set epochPosition($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEpochPosition() => $_has(6);
  @$pb.TagNumber(7)
  void clearEpochPosition() => clearField(7);

  @$pb.TagNumber(8)
  $1.UUID get epochId => $_getN(7);
  @$pb.TagNumber(8)
  set epochId($1.UUID v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasEpochId() => $_has(7);
  @$pb.TagNumber(8)
  void clearEpochId() => clearField(8);
  @$pb.TagNumber(8)
  $1.UUID ensureEpochId() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.UUID get epochLeaderInstanceId => $_getN(8);
  @$pb.TagNumber(9)
  set epochLeaderInstanceId($1.UUID v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasEpochLeaderInstanceId() => $_has(8);
  @$pb.TagNumber(9)
  void clearEpochLeaderInstanceId() => clearField(9);
  @$pb.TagNumber(9)
  $1.UUID ensureEpochLeaderInstanceId() => $_ensure(8);

  @$pb.TagNumber(10)
  $fixnum.Int64 get lastCommitPosition => $_getI64(9);
  @$pb.TagNumber(10)
  set lastCommitPosition($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLastCommitPosition() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastCommitPosition() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get writerCheckpoint => $_getI64(10);
  @$pb.TagNumber(11)
  set writerCheckpoint($fixnum.Int64 v) {
    $_setInt64(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasWriterCheckpoint() => $_has(10);
  @$pb.TagNumber(11)
  void clearWriterCheckpoint() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get chaserCheckpoint => $_getI64(11);
  @$pb.TagNumber(12)
  set chaserCheckpoint($fixnum.Int64 v) {
    $_setInt64(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasChaserCheckpoint() => $_has(11);
  @$pb.TagNumber(12)
  void clearChaserCheckpoint() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get nodePriority => $_getIZ(12);
  @$pb.TagNumber(13)
  set nodePriority($core.int v) {
    $_setSignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasNodePriority() => $_has(12);
  @$pb.TagNumber(13)
  void clearNodePriority() => clearField(13);
}

class AcceptRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AcceptRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverHttp',
        subBuilder: EndPoint.create)
    ..aOM<$1.UUID>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderHttp',
        subBuilder: EndPoint.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'view',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  AcceptRequest._() : super();
  factory AcceptRequest({
    $1.UUID? serverId,
    EndPoint? serverHttp,
    $1.UUID? leaderId,
    EndPoint? leaderHttp,
    $core.int? view,
  }) {
    final _result = create();
    if (serverId != null) {
      _result.serverId = serverId;
    }
    if (serverHttp != null) {
      _result.serverHttp = serverHttp;
    }
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (leaderHttp != null) {
      _result.leaderHttp = leaderHttp;
    }
    if (view != null) {
      _result.view = view;
    }
    return _result;
  }
  factory AcceptRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AcceptRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AcceptRequest clone() => AcceptRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AcceptRequest copyWith(void Function(AcceptRequest) updates) =>
      super.copyWith((message) => updates(message as AcceptRequest))
          as AcceptRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AcceptRequest create() => AcceptRequest._();
  AcceptRequest createEmptyInstance() => create();
  static $pb.PbList<AcceptRequest> createRepeated() =>
      $pb.PbList<AcceptRequest>();
  @$core.pragma('dart2js:noInline')
  static AcceptRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AcceptRequest>(create);
  static AcceptRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get serverId => $_getN(0);
  @$pb.TagNumber(1)
  set serverId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasServerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureServerId() => $_ensure(0);

  @$pb.TagNumber(2)
  EndPoint get serverHttp => $_getN(1);
  @$pb.TagNumber(2)
  set serverHttp(EndPoint v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServerHttp() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerHttp() => clearField(2);
  @$pb.TagNumber(2)
  EndPoint ensureServerHttp() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.UUID get leaderId => $_getN(2);
  @$pb.TagNumber(3)
  set leaderId($1.UUID v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeaderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaderId() => clearField(3);
  @$pb.TagNumber(3)
  $1.UUID ensureLeaderId() => $_ensure(2);

  @$pb.TagNumber(4)
  EndPoint get leaderHttp => $_getN(3);
  @$pb.TagNumber(4)
  set leaderHttp(EndPoint v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLeaderHttp() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeaderHttp() => clearField(4);
  @$pb.TagNumber(4)
  EndPoint ensureLeaderHttp() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get view => $_getIZ(4);
  @$pb.TagNumber(5)
  set view($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasView() => $_has(4);
  @$pb.TagNumber(5)
  void clearView() => clearField(5);
}

class LeaderIsResigningRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeaderIsResigningRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderHttp',
        subBuilder: EndPoint.create)
    ..hasRequiredFields = false;

  LeaderIsResigningRequest._() : super();
  factory LeaderIsResigningRequest({
    $1.UUID? leaderId,
    EndPoint? leaderHttp,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (leaderHttp != null) {
      _result.leaderHttp = leaderHttp;
    }
    return _result;
  }
  factory LeaderIsResigningRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeaderIsResigningRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeaderIsResigningRequest clone() =>
      LeaderIsResigningRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeaderIsResigningRequest copyWith(
          void Function(LeaderIsResigningRequest) updates) =>
      super.copyWith((message) => updates(message as LeaderIsResigningRequest))
          as LeaderIsResigningRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeaderIsResigningRequest create() => LeaderIsResigningRequest._();
  LeaderIsResigningRequest createEmptyInstance() => create();
  static $pb.PbList<LeaderIsResigningRequest> createRepeated() =>
      $pb.PbList<LeaderIsResigningRequest>();
  @$core.pragma('dart2js:noInline')
  static LeaderIsResigningRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeaderIsResigningRequest>(create);
  static LeaderIsResigningRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureLeaderId() => $_ensure(0);

  @$pb.TagNumber(2)
  EndPoint get leaderHttp => $_getN(1);
  @$pb.TagNumber(2)
  set leaderHttp(EndPoint v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeaderHttp() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeaderHttp() => clearField(2);
  @$pb.TagNumber(2)
  EndPoint ensureLeaderHttp() => $_ensure(1);
}

class LeaderIsResigningOkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeaderIsResigningOkRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderHttp',
        subBuilder: EndPoint.create)
    ..aOM<$1.UUID>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverId',
        subBuilder: $1.UUID.create)
    ..aOM<EndPoint>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serverHttp',
        subBuilder: EndPoint.create)
    ..hasRequiredFields = false;

  LeaderIsResigningOkRequest._() : super();
  factory LeaderIsResigningOkRequest({
    $1.UUID? leaderId,
    EndPoint? leaderHttp,
    $1.UUID? serverId,
    EndPoint? serverHttp,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (leaderHttp != null) {
      _result.leaderHttp = leaderHttp;
    }
    if (serverId != null) {
      _result.serverId = serverId;
    }
    if (serverHttp != null) {
      _result.serverHttp = serverHttp;
    }
    return _result;
  }
  factory LeaderIsResigningOkRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeaderIsResigningOkRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeaderIsResigningOkRequest clone() =>
      LeaderIsResigningOkRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeaderIsResigningOkRequest copyWith(
          void Function(LeaderIsResigningOkRequest) updates) =>
      super.copyWith(
              (message) => updates(message as LeaderIsResigningOkRequest))
          as LeaderIsResigningOkRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeaderIsResigningOkRequest create() => LeaderIsResigningOkRequest._();
  LeaderIsResigningOkRequest createEmptyInstance() => create();
  static $pb.PbList<LeaderIsResigningOkRequest> createRepeated() =>
      $pb.PbList<LeaderIsResigningOkRequest>();
  @$core.pragma('dart2js:noInline')
  static LeaderIsResigningOkRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeaderIsResigningOkRequest>(create);
  static LeaderIsResigningOkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureLeaderId() => $_ensure(0);

  @$pb.TagNumber(2)
  EndPoint get leaderHttp => $_getN(1);
  @$pb.TagNumber(2)
  set leaderHttp(EndPoint v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeaderHttp() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeaderHttp() => clearField(2);
  @$pb.TagNumber(2)
  EndPoint ensureLeaderHttp() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.UUID get serverId => $_getN(2);
  @$pb.TagNumber(3)
  set serverId($1.UUID v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasServerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerId() => clearField(3);
  @$pb.TagNumber(3)
  $1.UUID ensureServerId() => $_ensure(2);

  @$pb.TagNumber(4)
  EndPoint get serverHttp => $_getN(3);
  @$pb.TagNumber(4)
  set serverHttp(EndPoint v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasServerHttp() => $_has(3);
  @$pb.TagNumber(4)
  void clearServerHttp() => clearField(4);
  @$pb.TagNumber(4)
  EndPoint ensureServerHttp() => $_ensure(3);
}

class ClusterInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ClusterInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
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
              : 'event_store.cluster'),
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
              : 'event_store.cluster'),
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
    ..aOM<EndPoint>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'internalTcp',
        subBuilder: EndPoint.create)
    ..aOM<EndPoint>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'externalTcp',
        subBuilder: EndPoint.create)
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'internalTcpUsesTls')
    ..aOB(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'externalTcpUsesTls')
    ..aInt64(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastCommitPosition')
    ..aInt64(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'writerCheckpoint')
    ..aInt64(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chaserCheckpoint')
    ..aInt64(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochPosition')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochNumber',
        $pb.PbFieldType.O3)
    ..aOM<$1.UUID>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochId',
        subBuilder: $1.UUID.create)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nodePriority',
        $pb.PbFieldType.O3)
    ..aOB(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isReadOnlyReplica')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'advertiseHostToClientAs')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'advertiseHttpPortToClientAs',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'advertiseTcpPortToClientAs',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MemberInfo._() : super();
  factory MemberInfo({
    $1.UUID? instanceId,
    $fixnum.Int64? timeStamp,
    MemberInfo_VNodeState? state,
    $core.bool? isAlive,
    EndPoint? httpEndPoint,
    EndPoint? internalTcp,
    EndPoint? externalTcp,
    $core.bool? internalTcpUsesTls,
    $core.bool? externalTcpUsesTls,
    $fixnum.Int64? lastCommitPosition,
    $fixnum.Int64? writerCheckpoint,
    $fixnum.Int64? chaserCheckpoint,
    $fixnum.Int64? epochPosition,
    $core.int? epochNumber,
    $1.UUID? epochId,
    $core.int? nodePriority,
    $core.bool? isReadOnlyReplica,
    $core.String? advertiseHostToClientAs,
    $core.int? advertiseHttpPortToClientAs,
    $core.int? advertiseTcpPortToClientAs,
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
    if (internalTcp != null) {
      _result.internalTcp = internalTcp;
    }
    if (externalTcp != null) {
      _result.externalTcp = externalTcp;
    }
    if (internalTcpUsesTls != null) {
      _result.internalTcpUsesTls = internalTcpUsesTls;
    }
    if (externalTcpUsesTls != null) {
      _result.externalTcpUsesTls = externalTcpUsesTls;
    }
    if (lastCommitPosition != null) {
      _result.lastCommitPosition = lastCommitPosition;
    }
    if (writerCheckpoint != null) {
      _result.writerCheckpoint = writerCheckpoint;
    }
    if (chaserCheckpoint != null) {
      _result.chaserCheckpoint = chaserCheckpoint;
    }
    if (epochPosition != null) {
      _result.epochPosition = epochPosition;
    }
    if (epochNumber != null) {
      _result.epochNumber = epochNumber;
    }
    if (epochId != null) {
      _result.epochId = epochId;
    }
    if (nodePriority != null) {
      _result.nodePriority = nodePriority;
    }
    if (isReadOnlyReplica != null) {
      _result.isReadOnlyReplica = isReadOnlyReplica;
    }
    if (advertiseHostToClientAs != null) {
      _result.advertiseHostToClientAs = advertiseHostToClientAs;
    }
    if (advertiseHttpPortToClientAs != null) {
      _result.advertiseHttpPortToClientAs = advertiseHttpPortToClientAs;
    }
    if (advertiseTcpPortToClientAs != null) {
      _result.advertiseTcpPortToClientAs = advertiseTcpPortToClientAs;
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

  @$pb.TagNumber(6)
  EndPoint get internalTcp => $_getN(5);
  @$pb.TagNumber(6)
  set internalTcp(EndPoint v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasInternalTcp() => $_has(5);
  @$pb.TagNumber(6)
  void clearInternalTcp() => clearField(6);
  @$pb.TagNumber(6)
  EndPoint ensureInternalTcp() => $_ensure(5);

  @$pb.TagNumber(7)
  EndPoint get externalTcp => $_getN(6);
  @$pb.TagNumber(7)
  set externalTcp(EndPoint v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasExternalTcp() => $_has(6);
  @$pb.TagNumber(7)
  void clearExternalTcp() => clearField(7);
  @$pb.TagNumber(7)
  EndPoint ensureExternalTcp() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get internalTcpUsesTls => $_getBF(7);
  @$pb.TagNumber(8)
  set internalTcpUsesTls($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasInternalTcpUsesTls() => $_has(7);
  @$pb.TagNumber(8)
  void clearInternalTcpUsesTls() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get externalTcpUsesTls => $_getBF(8);
  @$pb.TagNumber(9)
  set externalTcpUsesTls($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasExternalTcpUsesTls() => $_has(8);
  @$pb.TagNumber(9)
  void clearExternalTcpUsesTls() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get lastCommitPosition => $_getI64(9);
  @$pb.TagNumber(10)
  set lastCommitPosition($fixnum.Int64 v) {
    $_setInt64(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLastCommitPosition() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastCommitPosition() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get writerCheckpoint => $_getI64(10);
  @$pb.TagNumber(11)
  set writerCheckpoint($fixnum.Int64 v) {
    $_setInt64(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasWriterCheckpoint() => $_has(10);
  @$pb.TagNumber(11)
  void clearWriterCheckpoint() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get chaserCheckpoint => $_getI64(11);
  @$pb.TagNumber(12)
  set chaserCheckpoint($fixnum.Int64 v) {
    $_setInt64(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasChaserCheckpoint() => $_has(11);
  @$pb.TagNumber(12)
  void clearChaserCheckpoint() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get epochPosition => $_getI64(12);
  @$pb.TagNumber(13)
  set epochPosition($fixnum.Int64 v) {
    $_setInt64(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasEpochPosition() => $_has(12);
  @$pb.TagNumber(13)
  void clearEpochPosition() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get epochNumber => $_getIZ(13);
  @$pb.TagNumber(14)
  set epochNumber($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasEpochNumber() => $_has(13);
  @$pb.TagNumber(14)
  void clearEpochNumber() => clearField(14);

  @$pb.TagNumber(15)
  $1.UUID get epochId => $_getN(14);
  @$pb.TagNumber(15)
  set epochId($1.UUID v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasEpochId() => $_has(14);
  @$pb.TagNumber(15)
  void clearEpochId() => clearField(15);
  @$pb.TagNumber(15)
  $1.UUID ensureEpochId() => $_ensure(14);

  @$pb.TagNumber(16)
  $core.int get nodePriority => $_getIZ(15);
  @$pb.TagNumber(16)
  set nodePriority($core.int v) {
    $_setSignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasNodePriority() => $_has(15);
  @$pb.TagNumber(16)
  void clearNodePriority() => clearField(16);

  @$pb.TagNumber(17)
  $core.bool get isReadOnlyReplica => $_getBF(16);
  @$pb.TagNumber(17)
  set isReadOnlyReplica($core.bool v) {
    $_setBool(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasIsReadOnlyReplica() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsReadOnlyReplica() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get advertiseHostToClientAs => $_getSZ(17);
  @$pb.TagNumber(18)
  set advertiseHostToClientAs($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasAdvertiseHostToClientAs() => $_has(17);
  @$pb.TagNumber(18)
  void clearAdvertiseHostToClientAs() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get advertiseHttpPortToClientAs => $_getIZ(18);
  @$pb.TagNumber(19)
  set advertiseHttpPortToClientAs($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasAdvertiseHttpPortToClientAs() => $_has(18);
  @$pb.TagNumber(19)
  void clearAdvertiseHttpPortToClientAs() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get advertiseTcpPortToClientAs => $_getIZ(19);
  @$pb.TagNumber(20)
  set advertiseTcpPortToClientAs($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasAdvertiseTcpPortToClientAs() => $_has(19);
  @$pb.TagNumber(20)
  void clearAdvertiseTcpPortToClientAs() => clearField(20);
}
