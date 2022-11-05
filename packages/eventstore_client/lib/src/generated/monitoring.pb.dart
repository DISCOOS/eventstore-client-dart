///
//  Generated code. Do not modify.
//  source: monitoring.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class StatsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StatsReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.monitoring'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'useMetadata')
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'refreshTimePeriodInMs',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  StatsReq._() : super();
  factory StatsReq({
    $core.bool? useMetadata,
    $fixnum.Int64? refreshTimePeriodInMs,
  }) {
    final _result = create();
    if (useMetadata != null) {
      _result.useMetadata = useMetadata;
    }
    if (refreshTimePeriodInMs != null) {
      _result.refreshTimePeriodInMs = refreshTimePeriodInMs;
    }
    return _result;
  }
  factory StatsReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StatsReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StatsReq clone() => StatsReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StatsReq copyWith(void Function(StatsReq) updates) =>
      super.copyWith((message) => updates(message as StatsReq))
          as StatsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatsReq create() => StatsReq._();
  StatsReq createEmptyInstance() => create();
  static $pb.PbList<StatsReq> createRepeated() => $pb.PbList<StatsReq>();
  @$core.pragma('dart2js:noInline')
  static StatsReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatsReq>(create);
  static StatsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get useMetadata => $_getBF(0);
  @$pb.TagNumber(1)
  set useMetadata($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUseMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearUseMetadata() => clearField(1);

  @$pb.TagNumber(4)
  $fixnum.Int64 get refreshTimePeriodInMs => $_getI64(1);
  @$pb.TagNumber(4)
  set refreshTimePeriodInMs($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRefreshTimePeriodInMs() => $_has(1);
  @$pb.TagNumber(4)
  void clearRefreshTimePeriodInMs() => clearField(4);
}

class StatsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StatsResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.monitoring'),
      createEmptyInstance: create)
    ..m<$core.String, $core.String>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stats',
        entryClassName: 'StatsResp.StatsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('event_store.client.monitoring'))
    ..hasRequiredFields = false;

  StatsResp._() : super();
  factory StatsResp({
    $core.Map<$core.String, $core.String>? stats,
  }) {
    final _result = create();
    if (stats != null) {
      _result.stats.addAll(stats);
    }
    return _result;
  }
  factory StatsResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StatsResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StatsResp clone() => StatsResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StatsResp copyWith(void Function(StatsResp) updates) =>
      super.copyWith((message) => updates(message as StatsResp))
          as StatsResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatsResp create() => StatsResp._();
  StatsResp createEmptyInstance() => create();
  static $pb.PbList<StatsResp> createRepeated() => $pb.PbList<StatsResp>();
  @$core.pragma('dart2js:noInline')
  static StatsResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatsResp>(create);
  static StatsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get stats => $_getMap(0);
}
