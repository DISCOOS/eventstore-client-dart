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

class ReplicaLogWrite extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReplicaLogWrite',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logPosition')
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replicaId',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  ReplicaLogWrite._() : super();
  factory ReplicaLogWrite({
    $fixnum.Int64? logPosition,
    $core.List<$core.int>? replicaId,
  }) {
    final _result = create();
    if (logPosition != null) {
      _result.logPosition = logPosition;
    }
    if (replicaId != null) {
      _result.replicaId = replicaId;
    }
    return _result;
  }
  factory ReplicaLogWrite.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReplicaLogWrite.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReplicaLogWrite clone() => ReplicaLogWrite()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReplicaLogWrite copyWith(void Function(ReplicaLogWrite) updates) =>
      super.copyWith((message) => updates(message as ReplicaLogWrite))
          as ReplicaLogWrite; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReplicaLogWrite create() => ReplicaLogWrite._();
  ReplicaLogWrite createEmptyInstance() => create();
  static $pb.PbList<ReplicaLogWrite> createRepeated() =>
      $pb.PbList<ReplicaLogWrite>();
  @$core.pragma('dart2js:noInline')
  static ReplicaLogWrite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplicaLogWrite>(create);
  static ReplicaLogWrite? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get logPosition => $_getI64(0);
  @$pb.TagNumber(1)
  set logPosition($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLogPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get replicaId => $_getN(1);
  @$pb.TagNumber(2)
  set replicaId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReplicaId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplicaId() => clearField(2);
}

class ReplicatedTo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReplicatedTo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logPosition')
    ..hasRequiredFields = false;

  ReplicatedTo._() : super();
  factory ReplicatedTo({
    $fixnum.Int64? logPosition,
  }) {
    final _result = create();
    if (logPosition != null) {
      _result.logPosition = logPosition;
    }
    return _result;
  }
  factory ReplicatedTo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReplicatedTo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReplicatedTo clone() => ReplicatedTo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReplicatedTo copyWith(void Function(ReplicatedTo) updates) =>
      super.copyWith((message) => updates(message as ReplicatedTo))
          as ReplicatedTo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReplicatedTo create() => ReplicatedTo._();
  ReplicatedTo createEmptyInstance() => create();
  static $pb.PbList<ReplicatedTo> createRepeated() =>
      $pb.PbList<ReplicatedTo>();
  @$core.pragma('dart2js:noInline')
  static ReplicatedTo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplicatedTo>(create);
  static ReplicatedTo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get logPosition => $_getI64(0);
  @$pb.TagNumber(1)
  set logPosition($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLogPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogPosition() => clearField(1);
}

class Epoch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Epoch',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochPosition')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochNumber',
        $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'epochId',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  Epoch._() : super();
  factory Epoch({
    $fixnum.Int64? epochPosition,
    $core.int? epochNumber,
    $core.List<$core.int>? epochId,
  }) {
    final _result = create();
    if (epochPosition != null) {
      _result.epochPosition = epochPosition;
    }
    if (epochNumber != null) {
      _result.epochNumber = epochNumber;
    }
    if (epochId != null) {
      _result.epochId = epochId;
    }
    return _result;
  }
  factory Epoch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Epoch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Epoch clone() => Epoch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Epoch copyWith(void Function(Epoch) updates) =>
      super.copyWith((message) => updates(message as Epoch))
          as Epoch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Epoch create() => Epoch._();
  Epoch createEmptyInstance() => create();
  static $pb.PbList<Epoch> createRepeated() => $pb.PbList<Epoch>();
  @$core.pragma('dart2js:noInline')
  static Epoch getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Epoch>(create);
  static Epoch? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get epochPosition => $_getI64(0);
  @$pb.TagNumber(1)
  set epochPosition($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEpochPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearEpochPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get epochNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set epochNumber($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEpochNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearEpochNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get epochId => $_getN(2);
  @$pb.TagNumber(3)
  set epochId($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEpochId() => $_has(2);
  @$pb.TagNumber(3)
  void clearEpochId() => clearField(3);
}

class SubscribeReplica extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SubscribeReplica',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logPosition')
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chunkId',
        $pb.PbFieldType.OY)
    ..pc<Epoch>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'LastEpochs',
        $pb.PbFieldType.PM,
        protoName: 'LastEpochs',
        subBuilder: Epoch.create)
    ..a<$core.List<$core.int>>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ip',
        $pb.PbFieldType.OY)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'port',
        $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isPromotable')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  SubscribeReplica._() : super();
  factory SubscribeReplica({
    $fixnum.Int64? logPosition,
    $core.List<$core.int>? chunkId,
    $core.Iterable<Epoch>? lastEpochs,
    $core.List<$core.int>? ip,
    $core.int? port,
    $core.List<$core.int>? leaderId,
    $core.List<$core.int>? subscriptionId,
    $core.bool? isPromotable,
    $core.int? version,
  }) {
    final _result = create();
    if (logPosition != null) {
      _result.logPosition = logPosition;
    }
    if (chunkId != null) {
      _result.chunkId = chunkId;
    }
    if (lastEpochs != null) {
      _result.lastEpochs.addAll(lastEpochs);
    }
    if (ip != null) {
      _result.ip = ip;
    }
    if (port != null) {
      _result.port = port;
    }
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    if (isPromotable != null) {
      _result.isPromotable = isPromotable;
    }
    if (version != null) {
      _result.version = version;
    }
    return _result;
  }
  factory SubscribeReplica.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscribeReplica.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscribeReplica clone() => SubscribeReplica()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscribeReplica copyWith(void Function(SubscribeReplica) updates) =>
      super.copyWith((message) => updates(message as SubscribeReplica))
          as SubscribeReplica; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscribeReplica create() => SubscribeReplica._();
  SubscribeReplica createEmptyInstance() => create();
  static $pb.PbList<SubscribeReplica> createRepeated() =>
      $pb.PbList<SubscribeReplica>();
  @$core.pragma('dart2js:noInline')
  static SubscribeReplica getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscribeReplica>(create);
  static SubscribeReplica? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get logPosition => $_getI64(0);
  @$pb.TagNumber(1)
  set logPosition($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLogPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get chunkId => $_getN(1);
  @$pb.TagNumber(2)
  set chunkId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasChunkId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Epoch> get lastEpochs => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get ip => $_getN(3);
  @$pb.TagNumber(4)
  set ip($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIp() => $_has(3);
  @$pb.TagNumber(4)
  void clearIp() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get port => $_getIZ(4);
  @$pb.TagNumber(5)
  set port($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPort() => $_has(4);
  @$pb.TagNumber(5)
  void clearPort() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get leaderId => $_getN(5);
  @$pb.TagNumber(6)
  set leaderId($core.List<$core.int> v) {
    $_setBytes(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLeaderId() => $_has(5);
  @$pb.TagNumber(6)
  void clearLeaderId() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get subscriptionId => $_getN(6);
  @$pb.TagNumber(7)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSubscriptionId() => $_has(6);
  @$pb.TagNumber(7)
  void clearSubscriptionId() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isPromotable => $_getBF(7);
  @$pb.TagNumber(8)
  set isPromotable($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIsPromotable() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsPromotable() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get version => $_getIZ(8);
  @$pb.TagNumber(9)
  set version($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasVersion() => $_has(8);
  @$pb.TagNumber(9)
  void clearVersion() => clearField(9);
}

class ReplicaSubscriptionRetry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReplicaSubscriptionRetry',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  ReplicaSubscriptionRetry._() : super();
  factory ReplicaSubscriptionRetry({
    $core.List<$core.int>? leaderId,
    $core.List<$core.int>? subscriptionId,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    return _result;
  }
  factory ReplicaSubscriptionRetry.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReplicaSubscriptionRetry.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReplicaSubscriptionRetry clone() =>
      ReplicaSubscriptionRetry()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReplicaSubscriptionRetry copyWith(
          void Function(ReplicaSubscriptionRetry) updates) =>
      super.copyWith((message) => updates(message as ReplicaSubscriptionRetry))
          as ReplicaSubscriptionRetry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReplicaSubscriptionRetry create() => ReplicaSubscriptionRetry._();
  ReplicaSubscriptionRetry createEmptyInstance() => create();
  static $pb.PbList<ReplicaSubscriptionRetry> createRepeated() =>
      $pb.PbList<ReplicaSubscriptionRetry>();
  @$core.pragma('dart2js:noInline')
  static ReplicaSubscriptionRetry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplicaSubscriptionRetry>(create);
  static ReplicaSubscriptionRetry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get subscriptionId => $_getN(1);
  @$pb.TagNumber(2)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscriptionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionId() => clearField(2);
}

class ReplicaSubscribed extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReplicaSubscribed',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionPosition')
    ..hasRequiredFields = false;

  ReplicaSubscribed._() : super();
  factory ReplicaSubscribed({
    $core.List<$core.int>? leaderId,
    $core.List<$core.int>? subscriptionId,
    $fixnum.Int64? subscriptionPosition,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    if (subscriptionPosition != null) {
      _result.subscriptionPosition = subscriptionPosition;
    }
    return _result;
  }
  factory ReplicaSubscribed.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReplicaSubscribed.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReplicaSubscribed clone() => ReplicaSubscribed()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReplicaSubscribed copyWith(void Function(ReplicaSubscribed) updates) =>
      super.copyWith((message) => updates(message as ReplicaSubscribed))
          as ReplicaSubscribed; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReplicaSubscribed create() => ReplicaSubscribed._();
  ReplicaSubscribed createEmptyInstance() => create();
  static $pb.PbList<ReplicaSubscribed> createRepeated() =>
      $pb.PbList<ReplicaSubscribed>();
  @$core.pragma('dart2js:noInline')
  static ReplicaSubscribed getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplicaSubscribed>(create);
  static ReplicaSubscribed? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get subscriptionId => $_getN(1);
  @$pb.TagNumber(2)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscriptionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get subscriptionPosition => $_getI64(2);
  @$pb.TagNumber(3)
  set subscriptionPosition($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSubscriptionPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubscriptionPosition() => clearField(3);
}

class ReplicaLogPositionAck extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReplicaLogPositionAck',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replicationLogPosition')
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'writerLogPosition')
    ..hasRequiredFields = false;

  ReplicaLogPositionAck._() : super();
  factory ReplicaLogPositionAck({
    $core.List<$core.int>? subscriptionId,
    $fixnum.Int64? replicationLogPosition,
    $fixnum.Int64? writerLogPosition,
  }) {
    final _result = create();
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    if (replicationLogPosition != null) {
      _result.replicationLogPosition = replicationLogPosition;
    }
    if (writerLogPosition != null) {
      _result.writerLogPosition = writerLogPosition;
    }
    return _result;
  }
  factory ReplicaLogPositionAck.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReplicaLogPositionAck.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReplicaLogPositionAck clone() =>
      ReplicaLogPositionAck()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReplicaLogPositionAck copyWith(
          void Function(ReplicaLogPositionAck) updates) =>
      super.copyWith((message) => updates(message as ReplicaLogPositionAck))
          as ReplicaLogPositionAck; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReplicaLogPositionAck create() => ReplicaLogPositionAck._();
  ReplicaLogPositionAck createEmptyInstance() => create();
  static $pb.PbList<ReplicaLogPositionAck> createRepeated() =>
      $pb.PbList<ReplicaLogPositionAck>();
  @$core.pragma('dart2js:noInline')
  static ReplicaLogPositionAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplicaLogPositionAck>(create);
  static ReplicaLogPositionAck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get subscriptionId => $_getN(0);
  @$pb.TagNumber(1)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSubscriptionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriptionId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get replicationLogPosition => $_getI64(1);
  @$pb.TagNumber(2)
  set replicationLogPosition($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReplicationLogPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplicationLogPosition() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get writerLogPosition => $_getI64(2);
  @$pb.TagNumber(3)
  set writerLogPosition($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWriterLogPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearWriterLogPosition() => clearField(3);
}

class CreateChunk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateChunk',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chunkHeaderBytes',
        $pb.PbFieldType.OY)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fileSize',
        $pb.PbFieldType.O3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isCompletedChunk')
    ..hasRequiredFields = false;

  CreateChunk._() : super();
  factory CreateChunk({
    $core.List<$core.int>? leaderId,
    $core.List<$core.int>? subscriptionId,
    $core.List<$core.int>? chunkHeaderBytes,
    $core.int? fileSize,
    $core.bool? isCompletedChunk,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    if (chunkHeaderBytes != null) {
      _result.chunkHeaderBytes = chunkHeaderBytes;
    }
    if (fileSize != null) {
      _result.fileSize = fileSize;
    }
    if (isCompletedChunk != null) {
      _result.isCompletedChunk = isCompletedChunk;
    }
    return _result;
  }
  factory CreateChunk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateChunk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateChunk clone() => CreateChunk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateChunk copyWith(void Function(CreateChunk) updates) =>
      super.copyWith((message) => updates(message as CreateChunk))
          as CreateChunk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateChunk create() => CreateChunk._();
  CreateChunk createEmptyInstance() => create();
  static $pb.PbList<CreateChunk> createRepeated() => $pb.PbList<CreateChunk>();
  @$core.pragma('dart2js:noInline')
  static CreateChunk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateChunk>(create);
  static CreateChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get subscriptionId => $_getN(1);
  @$pb.TagNumber(2)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscriptionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get chunkHeaderBytes => $_getN(2);
  @$pb.TagNumber(3)
  set chunkHeaderBytes($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasChunkHeaderBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearChunkHeaderBytes() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get fileSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set fileSize($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFileSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearFileSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isCompletedChunk => $_getBF(4);
  @$pb.TagNumber(5)
  set isCompletedChunk($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsCompletedChunk() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsCompletedChunk() => clearField(5);
}

class RawChunkBulk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RawChunkBulk',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chunkStartNumber',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chunkEndNumber',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rawPosition',
        $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rawBytes',
        $pb.PbFieldType.OY)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'completeChunk')
    ..hasRequiredFields = false;

  RawChunkBulk._() : super();
  factory RawChunkBulk({
    $core.List<$core.int>? leaderId,
    $core.List<$core.int>? subscriptionId,
    $core.int? chunkStartNumber,
    $core.int? chunkEndNumber,
    $core.int? rawPosition,
    $core.List<$core.int>? rawBytes,
    $core.bool? completeChunk,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    if (chunkStartNumber != null) {
      _result.chunkStartNumber = chunkStartNumber;
    }
    if (chunkEndNumber != null) {
      _result.chunkEndNumber = chunkEndNumber;
    }
    if (rawPosition != null) {
      _result.rawPosition = rawPosition;
    }
    if (rawBytes != null) {
      _result.rawBytes = rawBytes;
    }
    if (completeChunk != null) {
      _result.completeChunk = completeChunk;
    }
    return _result;
  }
  factory RawChunkBulk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RawChunkBulk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RawChunkBulk clone() => RawChunkBulk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RawChunkBulk copyWith(void Function(RawChunkBulk) updates) =>
      super.copyWith((message) => updates(message as RawChunkBulk))
          as RawChunkBulk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RawChunkBulk create() => RawChunkBulk._();
  RawChunkBulk createEmptyInstance() => create();
  static $pb.PbList<RawChunkBulk> createRepeated() =>
      $pb.PbList<RawChunkBulk>();
  @$core.pragma('dart2js:noInline')
  static RawChunkBulk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RawChunkBulk>(create);
  static RawChunkBulk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get subscriptionId => $_getN(1);
  @$pb.TagNumber(2)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscriptionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get chunkStartNumber => $_getIZ(2);
  @$pb.TagNumber(3)
  set chunkStartNumber($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasChunkStartNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearChunkStartNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get chunkEndNumber => $_getIZ(3);
  @$pb.TagNumber(4)
  set chunkEndNumber($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasChunkEndNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearChunkEndNumber() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rawPosition => $_getIZ(4);
  @$pb.TagNumber(5)
  set rawPosition($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRawPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearRawPosition() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get rawBytes => $_getN(5);
  @$pb.TagNumber(6)
  set rawBytes($core.List<$core.int> v) {
    $_setBytes(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRawBytes() => $_has(5);
  @$pb.TagNumber(6)
  void clearRawBytes() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get completeChunk => $_getBF(6);
  @$pb.TagNumber(7)
  set completeChunk($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCompleteChunk() => $_has(6);
  @$pb.TagNumber(7)
  void clearCompleteChunk() => clearField(7);
}

class DataChunkBulk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DataChunkBulk',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chunkStartNumber',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chunkEndNumber',
        $pb.PbFieldType.O3)
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionPosition')
    ..a<$core.List<$core.int>>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dataBytes',
        $pb.PbFieldType.OY)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'completeChunk')
    ..hasRequiredFields = false;

  DataChunkBulk._() : super();
  factory DataChunkBulk({
    $core.List<$core.int>? leaderId,
    $core.List<$core.int>? subscriptionId,
    $core.int? chunkStartNumber,
    $core.int? chunkEndNumber,
    $fixnum.Int64? subscriptionPosition,
    $core.List<$core.int>? dataBytes,
    $core.bool? completeChunk,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    if (chunkStartNumber != null) {
      _result.chunkStartNumber = chunkStartNumber;
    }
    if (chunkEndNumber != null) {
      _result.chunkEndNumber = chunkEndNumber;
    }
    if (subscriptionPosition != null) {
      _result.subscriptionPosition = subscriptionPosition;
    }
    if (dataBytes != null) {
      _result.dataBytes = dataBytes;
    }
    if (completeChunk != null) {
      _result.completeChunk = completeChunk;
    }
    return _result;
  }
  factory DataChunkBulk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DataChunkBulk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DataChunkBulk clone() => DataChunkBulk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DataChunkBulk copyWith(void Function(DataChunkBulk) updates) =>
      super.copyWith((message) => updates(message as DataChunkBulk))
          as DataChunkBulk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DataChunkBulk create() => DataChunkBulk._();
  DataChunkBulk createEmptyInstance() => create();
  static $pb.PbList<DataChunkBulk> createRepeated() =>
      $pb.PbList<DataChunkBulk>();
  @$core.pragma('dart2js:noInline')
  static DataChunkBulk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DataChunkBulk>(create);
  static DataChunkBulk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get subscriptionId => $_getN(1);
  @$pb.TagNumber(2)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscriptionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get chunkStartNumber => $_getIZ(2);
  @$pb.TagNumber(3)
  set chunkStartNumber($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasChunkStartNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearChunkStartNumber() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get chunkEndNumber => $_getIZ(3);
  @$pb.TagNumber(4)
  set chunkEndNumber($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasChunkEndNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearChunkEndNumber() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get subscriptionPosition => $_getI64(4);
  @$pb.TagNumber(5)
  set subscriptionPosition($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSubscriptionPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearSubscriptionPosition() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get dataBytes => $_getN(5);
  @$pb.TagNumber(6)
  set dataBytes($core.List<$core.int> v) {
    $_setBytes(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDataBytes() => $_has(5);
  @$pb.TagNumber(6)
  void clearDataBytes() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get completeChunk => $_getBF(6);
  @$pb.TagNumber(7)
  set completeChunk($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCompleteChunk() => $_has(6);
  @$pb.TagNumber(7)
  void clearCompleteChunk() => clearField(7);
}

class FollowerAssignment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FollowerAssignment',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  FollowerAssignment._() : super();
  factory FollowerAssignment({
    $core.List<$core.int>? leaderId,
    $core.List<$core.int>? subscriptionId,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    return _result;
  }
  factory FollowerAssignment.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FollowerAssignment.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FollowerAssignment clone() => FollowerAssignment()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FollowerAssignment copyWith(void Function(FollowerAssignment) updates) =>
      super.copyWith((message) => updates(message as FollowerAssignment))
          as FollowerAssignment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FollowerAssignment create() => FollowerAssignment._();
  FollowerAssignment createEmptyInstance() => create();
  static $pb.PbList<FollowerAssignment> createRepeated() =>
      $pb.PbList<FollowerAssignment>();
  @$core.pragma('dart2js:noInline')
  static FollowerAssignment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FollowerAssignment>(create);
  static FollowerAssignment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get subscriptionId => $_getN(1);
  @$pb.TagNumber(2)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscriptionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionId() => clearField(2);
}

class CloneAssignment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CloneAssignment',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  CloneAssignment._() : super();
  factory CloneAssignment({
    $core.List<$core.int>? leaderId,
    $core.List<$core.int>? subscriptionId,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    return _result;
  }
  factory CloneAssignment.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CloneAssignment.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CloneAssignment clone() => CloneAssignment()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CloneAssignment copyWith(void Function(CloneAssignment) updates) =>
      super.copyWith((message) => updates(message as CloneAssignment))
          as CloneAssignment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CloneAssignment create() => CloneAssignment._();
  CloneAssignment createEmptyInstance() => create();
  static $pb.PbList<CloneAssignment> createRepeated() =>
      $pb.PbList<CloneAssignment>();
  @$core.pragma('dart2js:noInline')
  static CloneAssignment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CloneAssignment>(create);
  static CloneAssignment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get subscriptionId => $_getN(1);
  @$pb.TagNumber(2)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscriptionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionId() => clearField(2);
}

class DropSubscription extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DropSubscription',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.cluster'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leaderId',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  DropSubscription._() : super();
  factory DropSubscription({
    $core.List<$core.int>? leaderId,
    $core.List<$core.int>? subscriptionId,
  }) {
    final _result = create();
    if (leaderId != null) {
      _result.leaderId = leaderId;
    }
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    return _result;
  }
  factory DropSubscription.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DropSubscription.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DropSubscription clone() => DropSubscription()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DropSubscription copyWith(void Function(DropSubscription) updates) =>
      super.copyWith((message) => updates(message as DropSubscription))
          as DropSubscription; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DropSubscription create() => DropSubscription._();
  DropSubscription createEmptyInstance() => create();
  static $pb.PbList<DropSubscription> createRepeated() =>
      $pb.PbList<DropSubscription>();
  @$core.pragma('dart2js:noInline')
  static DropSubscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DropSubscription>(create);
  static DropSubscription? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get leaderId => $_getN(0);
  @$pb.TagNumber(1)
  set leaderId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get subscriptionId => $_getN(1);
  @$pb.TagNumber(2)
  set subscriptionId($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscriptionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionId() => clearField(2);
}
