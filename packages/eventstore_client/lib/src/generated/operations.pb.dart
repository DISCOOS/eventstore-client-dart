///
//  Generated code. Do not modify.
//  source: operations.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'operations.pbenum.dart';

export 'operations.pbenum.dart';

class StartScavengeReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StartScavengeReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.operations'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'threadCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startFromChunk',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  StartScavengeReq_Options._() : super();
  factory StartScavengeReq_Options({
    $core.int? threadCount,
    $core.int? startFromChunk,
  }) {
    final _result = create();
    if (threadCount != null) {
      _result.threadCount = threadCount;
    }
    if (startFromChunk != null) {
      _result.startFromChunk = startFromChunk;
    }
    return _result;
  }
  factory StartScavengeReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StartScavengeReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StartScavengeReq_Options clone() =>
      StartScavengeReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StartScavengeReq_Options copyWith(
          void Function(StartScavengeReq_Options) updates) =>
      super.copyWith((message) => updates(message as StartScavengeReq_Options))
          as StartScavengeReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StartScavengeReq_Options create() => StartScavengeReq_Options._();
  StartScavengeReq_Options createEmptyInstance() => create();
  static $pb.PbList<StartScavengeReq_Options> createRepeated() =>
      $pb.PbList<StartScavengeReq_Options>();
  @$core.pragma('dart2js:noInline')
  static StartScavengeReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartScavengeReq_Options>(create);
  static StartScavengeReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadCount($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasThreadCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get startFromChunk => $_getIZ(1);
  @$pb.TagNumber(2)
  set startFromChunk($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStartFromChunk() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartFromChunk() => clearField(2);
}

class StartScavengeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StartScavengeReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.operations'),
      createEmptyInstance: create)
    ..aOM<StartScavengeReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: StartScavengeReq_Options.create)
    ..hasRequiredFields = false;

  StartScavengeReq._() : super();
  factory StartScavengeReq({
    StartScavengeReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory StartScavengeReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StartScavengeReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StartScavengeReq clone() => StartScavengeReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StartScavengeReq copyWith(void Function(StartScavengeReq) updates) =>
      super.copyWith((message) => updates(message as StartScavengeReq))
          as StartScavengeReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StartScavengeReq create() => StartScavengeReq._();
  StartScavengeReq createEmptyInstance() => create();
  static $pb.PbList<StartScavengeReq> createRepeated() =>
      $pb.PbList<StartScavengeReq>();
  @$core.pragma('dart2js:noInline')
  static StartScavengeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartScavengeReq>(create);
  static StartScavengeReq? _defaultInstance;

  @$pb.TagNumber(1)
  StartScavengeReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(StartScavengeReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  StartScavengeReq_Options ensureOptions() => $_ensure(0);
}

class StopScavengeReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StopScavengeReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.operations'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scavengeId')
    ..hasRequiredFields = false;

  StopScavengeReq_Options._() : super();
  factory StopScavengeReq_Options({
    $core.String? scavengeId,
  }) {
    final _result = create();
    if (scavengeId != null) {
      _result.scavengeId = scavengeId;
    }
    return _result;
  }
  factory StopScavengeReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StopScavengeReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StopScavengeReq_Options clone() =>
      StopScavengeReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StopScavengeReq_Options copyWith(
          void Function(StopScavengeReq_Options) updates) =>
      super.copyWith((message) => updates(message as StopScavengeReq_Options))
          as StopScavengeReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StopScavengeReq_Options create() => StopScavengeReq_Options._();
  StopScavengeReq_Options createEmptyInstance() => create();
  static $pb.PbList<StopScavengeReq_Options> createRepeated() =>
      $pb.PbList<StopScavengeReq_Options>();
  @$core.pragma('dart2js:noInline')
  static StopScavengeReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopScavengeReq_Options>(create);
  static StopScavengeReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get scavengeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set scavengeId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasScavengeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScavengeId() => clearField(1);
}

class StopScavengeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StopScavengeReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.operations'),
      createEmptyInstance: create)
    ..aOM<StopScavengeReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: StopScavengeReq_Options.create)
    ..hasRequiredFields = false;

  StopScavengeReq._() : super();
  factory StopScavengeReq({
    StopScavengeReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory StopScavengeReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StopScavengeReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StopScavengeReq clone() => StopScavengeReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StopScavengeReq copyWith(void Function(StopScavengeReq) updates) =>
      super.copyWith((message) => updates(message as StopScavengeReq))
          as StopScavengeReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StopScavengeReq create() => StopScavengeReq._();
  StopScavengeReq createEmptyInstance() => create();
  static $pb.PbList<StopScavengeReq> createRepeated() =>
      $pb.PbList<StopScavengeReq>();
  @$core.pragma('dart2js:noInline')
  static StopScavengeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StopScavengeReq>(create);
  static StopScavengeReq? _defaultInstance;

  @$pb.TagNumber(1)
  StopScavengeReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(StopScavengeReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  StopScavengeReq_Options ensureOptions() => $_ensure(0);
}

class ScavengeResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScavengeResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.operations'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scavengeId')
    ..e<ScavengeResp_ScavengeResult>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scavengeResult',
        $pb.PbFieldType.OE,
        defaultOrMaker: ScavengeResp_ScavengeResult.Started,
        valueOf: ScavengeResp_ScavengeResult.valueOf,
        enumValues: ScavengeResp_ScavengeResult.values)
    ..hasRequiredFields = false;

  ScavengeResp._() : super();
  factory ScavengeResp({
    $core.String? scavengeId,
    ScavengeResp_ScavengeResult? scavengeResult,
  }) {
    final _result = create();
    if (scavengeId != null) {
      _result.scavengeId = scavengeId;
    }
    if (scavengeResult != null) {
      _result.scavengeResult = scavengeResult;
    }
    return _result;
  }
  factory ScavengeResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScavengeResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScavengeResp clone() => ScavengeResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScavengeResp copyWith(void Function(ScavengeResp) updates) =>
      super.copyWith((message) => updates(message as ScavengeResp))
          as ScavengeResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScavengeResp create() => ScavengeResp._();
  ScavengeResp createEmptyInstance() => create();
  static $pb.PbList<ScavengeResp> createRepeated() =>
      $pb.PbList<ScavengeResp>();
  @$core.pragma('dart2js:noInline')
  static ScavengeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScavengeResp>(create);
  static ScavengeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get scavengeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set scavengeId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasScavengeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScavengeId() => clearField(1);

  @$pb.TagNumber(2)
  ScavengeResp_ScavengeResult get scavengeResult => $_getN(1);
  @$pb.TagNumber(2)
  set scavengeResult(ScavengeResp_ScavengeResult v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScavengeResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearScavengeResult() => clearField(2);
}

class SetNodePriorityReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SetNodePriorityReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.operations'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'priority',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  SetNodePriorityReq._() : super();
  factory SetNodePriorityReq({
    $core.int? priority,
  }) {
    final _result = create();
    if (priority != null) {
      _result.priority = priority;
    }
    return _result;
  }
  factory SetNodePriorityReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SetNodePriorityReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SetNodePriorityReq clone() => SetNodePriorityReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SetNodePriorityReq copyWith(void Function(SetNodePriorityReq) updates) =>
      super.copyWith((message) => updates(message as SetNodePriorityReq))
          as SetNodePriorityReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetNodePriorityReq create() => SetNodePriorityReq._();
  SetNodePriorityReq createEmptyInstance() => create();
  static $pb.PbList<SetNodePriorityReq> createRepeated() =>
      $pb.PbList<SetNodePriorityReq>();
  @$core.pragma('dart2js:noInline')
  static SetNodePriorityReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetNodePriorityReq>(create);
  static SetNodePriorityReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get priority => $_getIZ(0);
  @$pb.TagNumber(1)
  set priority($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPriority() => $_has(0);
  @$pb.TagNumber(1)
  void clearPriority() => clearField(1);
}
