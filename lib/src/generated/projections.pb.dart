///
//  Generated code. Do not modify.
//  source: projections.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'shared.pb.dart' as $1;
import 'struct.pb.dart' as $9;

class CreateReq_Options_Transient extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.Options.Transient',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  CreateReq_Options_Transient._() : super();
  factory CreateReq_Options_Transient({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory CreateReq_Options_Transient.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq_Options_Transient.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq_Options_Transient clone() =>
      CreateReq_Options_Transient()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq_Options_Transient copyWith(
          void Function(CreateReq_Options_Transient) updates) =>
      super.copyWith(
              (message) => updates(message as CreateReq_Options_Transient))
          as CreateReq_Options_Transient; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq_Options_Transient create() =>
      CreateReq_Options_Transient._();
  CreateReq_Options_Transient createEmptyInstance() => create();
  static $pb.PbList<CreateReq_Options_Transient> createRepeated() =>
      $pb.PbList<CreateReq_Options_Transient>();
  @$core.pragma('dart2js:noInline')
  static CreateReq_Options_Transient getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReq_Options_Transient>(create);
  static CreateReq_Options_Transient? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class CreateReq_Options_Continuous extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.Options.Continuous',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'trackEmittedStreams')
    ..hasRequiredFields = false;

  CreateReq_Options_Continuous._() : super();
  factory CreateReq_Options_Continuous({
    $core.String? name,
    $core.bool? trackEmittedStreams,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (trackEmittedStreams != null) {
      _result.trackEmittedStreams = trackEmittedStreams;
    }
    return _result;
  }
  factory CreateReq_Options_Continuous.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq_Options_Continuous.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq_Options_Continuous clone() =>
      CreateReq_Options_Continuous()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq_Options_Continuous copyWith(
          void Function(CreateReq_Options_Continuous) updates) =>
      super.copyWith(
              (message) => updates(message as CreateReq_Options_Continuous))
          as CreateReq_Options_Continuous; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq_Options_Continuous create() =>
      CreateReq_Options_Continuous._();
  CreateReq_Options_Continuous createEmptyInstance() => create();
  static $pb.PbList<CreateReq_Options_Continuous> createRepeated() =>
      $pb.PbList<CreateReq_Options_Continuous>();
  @$core.pragma('dart2js:noInline')
  static CreateReq_Options_Continuous getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReq_Options_Continuous>(create);
  static CreateReq_Options_Continuous? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get trackEmittedStreams => $_getBF(1);
  @$pb.TagNumber(2)
  set trackEmittedStreams($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTrackEmittedStreams() => $_has(1);
  @$pb.TagNumber(2)
  void clearTrackEmittedStreams() => clearField(2);
}

enum CreateReq_Options_Mode { oneTime, transient, continuous, notSet }

class CreateReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateReq_Options_Mode>
      _CreateReq_Options_ModeByTag = {
    1: CreateReq_Options_Mode.oneTime,
    2: CreateReq_Options_Mode.transient,
    3: CreateReq_Options_Mode.continuous,
    0: CreateReq_Options_Mode.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<$1.Empty>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oneTime',
        subBuilder: $1.Empty.create)
    ..aOM<CreateReq_Options_Transient>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transient',
        subBuilder: CreateReq_Options_Transient.create)
    ..aOM<CreateReq_Options_Continuous>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'continuous',
        subBuilder: CreateReq_Options_Continuous.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query')
    ..hasRequiredFields = false;

  CreateReq_Options._() : super();
  factory CreateReq_Options({
    $1.Empty? oneTime,
    CreateReq_Options_Transient? transient,
    CreateReq_Options_Continuous? continuous,
    $core.String? query,
  }) {
    final _result = create();
    if (oneTime != null) {
      _result.oneTime = oneTime;
    }
    if (transient != null) {
      _result.transient = transient;
    }
    if (continuous != null) {
      _result.continuous = continuous;
    }
    if (query != null) {
      _result.query = query;
    }
    return _result;
  }
  factory CreateReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq_Options clone() => CreateReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq_Options copyWith(void Function(CreateReq_Options) updates) =>
      super.copyWith((message) => updates(message as CreateReq_Options))
          as CreateReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq_Options create() => CreateReq_Options._();
  CreateReq_Options createEmptyInstance() => create();
  static $pb.PbList<CreateReq_Options> createRepeated() =>
      $pb.PbList<CreateReq_Options>();
  @$core.pragma('dart2js:noInline')
  static CreateReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReq_Options>(create);
  static CreateReq_Options? _defaultInstance;

  CreateReq_Options_Mode whichMode() =>
      _CreateReq_Options_ModeByTag[$_whichOneof(0)]!;
  void clearMode() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Empty get oneTime => $_getN(0);
  @$pb.TagNumber(1)
  set oneTime($1.Empty v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOneTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearOneTime() => clearField(1);
  @$pb.TagNumber(1)
  $1.Empty ensureOneTime() => $_ensure(0);

  @$pb.TagNumber(2)
  CreateReq_Options_Transient get transient => $_getN(1);
  @$pb.TagNumber(2)
  set transient(CreateReq_Options_Transient v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTransient() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransient() => clearField(2);
  @$pb.TagNumber(2)
  CreateReq_Options_Transient ensureTransient() => $_ensure(1);

  @$pb.TagNumber(3)
  CreateReq_Options_Continuous get continuous => $_getN(2);
  @$pb.TagNumber(3)
  set continuous(CreateReq_Options_Continuous v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContinuous() => $_has(2);
  @$pb.TagNumber(3)
  void clearContinuous() => clearField(3);
  @$pb.TagNumber(3)
  CreateReq_Options_Continuous ensureContinuous() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get query => $_getSZ(3);
  @$pb.TagNumber(4)
  set query($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasQuery() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuery() => clearField(4);
}

class CreateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<CreateReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: CreateReq_Options.create)
    ..hasRequiredFields = false;

  CreateReq._() : super();
  factory CreateReq({
    CreateReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory CreateReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq clone() => CreateReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq copyWith(void Function(CreateReq) updates) =>
      super.copyWith((message) => updates(message as CreateReq))
          as CreateReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq create() => CreateReq._();
  CreateReq createEmptyInstance() => create();
  static $pb.PbList<CreateReq> createRepeated() => $pb.PbList<CreateReq>();
  @$core.pragma('dart2js:noInline')
  static CreateReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateReq>(create);
  static CreateReq? _defaultInstance;

  @$pb.TagNumber(1)
  CreateReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(CreateReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  CreateReq_Options ensureOptions() => $_ensure(0);
}

class CreateResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  CreateResp._() : super();
  factory CreateResp() => create();
  factory CreateResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateResp clone() => CreateResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateResp copyWith(void Function(CreateResp) updates) =>
      super.copyWith((message) => updates(message as CreateResp))
          as CreateResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateResp create() => CreateResp._();
  CreateResp createEmptyInstance() => create();
  static $pb.PbList<CreateResp> createRepeated() => $pb.PbList<CreateResp>();
  @$core.pragma('dart2js:noInline')
  static CreateResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateResp>(create);
  static CreateResp? _defaultInstance;
}

enum UpdateReq_Options_EmitOption { emitEnabled, noEmitOptions, notSet }

class UpdateReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UpdateReq_Options_EmitOption>
      _UpdateReq_Options_EmitOptionByTag = {
    3: UpdateReq_Options_EmitOption.emitEnabled,
    4: UpdateReq_Options_EmitOption.noEmitOptions,
    0: UpdateReq_Options_EmitOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'query')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'emitEnabled')
    ..aOM<$1.Empty>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noEmitOptions',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  UpdateReq_Options._() : super();
  factory UpdateReq_Options({
    $core.String? name,
    $core.String? query,
    $core.bool? emitEnabled,
    $1.Empty? noEmitOptions,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (query != null) {
      _result.query = query;
    }
    if (emitEnabled != null) {
      _result.emitEnabled = emitEnabled;
    }
    if (noEmitOptions != null) {
      _result.noEmitOptions = noEmitOptions;
    }
    return _result;
  }
  factory UpdateReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateReq_Options clone() => UpdateReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateReq_Options copyWith(void Function(UpdateReq_Options) updates) =>
      super.copyWith((message) => updates(message as UpdateReq_Options))
          as UpdateReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateReq_Options create() => UpdateReq_Options._();
  UpdateReq_Options createEmptyInstance() => create();
  static $pb.PbList<UpdateReq_Options> createRepeated() =>
      $pb.PbList<UpdateReq_Options>();
  @$core.pragma('dart2js:noInline')
  static UpdateReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateReq_Options>(create);
  static UpdateReq_Options? _defaultInstance;

  UpdateReq_Options_EmitOption whichEmitOption() =>
      _UpdateReq_Options_EmitOptionByTag[$_whichOneof(0)]!;
  void clearEmitOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get query => $_getSZ(1);
  @$pb.TagNumber(2)
  set query($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get emitEnabled => $_getBF(2);
  @$pb.TagNumber(3)
  set emitEnabled($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEmitEnabled() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmitEnabled() => clearField(3);

  @$pb.TagNumber(4)
  $1.Empty get noEmitOptions => $_getN(3);
  @$pb.TagNumber(4)
  set noEmitOptions($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNoEmitOptions() => $_has(3);
  @$pb.TagNumber(4)
  void clearNoEmitOptions() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureNoEmitOptions() => $_ensure(3);
}

class UpdateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<UpdateReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: UpdateReq_Options.create)
    ..hasRequiredFields = false;

  UpdateReq._() : super();
  factory UpdateReq({
    UpdateReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory UpdateReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateReq clone() => UpdateReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateReq copyWith(void Function(UpdateReq) updates) =>
      super.copyWith((message) => updates(message as UpdateReq))
          as UpdateReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateReq create() => UpdateReq._();
  UpdateReq createEmptyInstance() => create();
  static $pb.PbList<UpdateReq> createRepeated() => $pb.PbList<UpdateReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateReq>(create);
  static UpdateReq? _defaultInstance;

  @$pb.TagNumber(1)
  UpdateReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(UpdateReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  UpdateReq_Options ensureOptions() => $_ensure(0);
}

class UpdateResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  UpdateResp._() : super();
  factory UpdateResp() => create();
  factory UpdateResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateResp clone() => UpdateResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateResp copyWith(void Function(UpdateResp) updates) =>
      super.copyWith((message) => updates(message as UpdateResp))
          as UpdateResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateResp create() => UpdateResp._();
  UpdateResp createEmptyInstance() => create();
  static $pb.PbList<UpdateResp> createRepeated() => $pb.PbList<UpdateResp>();
  @$core.pragma('dart2js:noInline')
  static UpdateResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateResp>(create);
  static UpdateResp? _defaultInstance;
}

class DeleteReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleteEmittedStreams')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleteStateStream')
    ..aOB(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleteCheckpointStream')
    ..hasRequiredFields = false;

  DeleteReq_Options._() : super();
  factory DeleteReq_Options({
    $core.String? name,
    $core.bool? deleteEmittedStreams,
    $core.bool? deleteStateStream,
    $core.bool? deleteCheckpointStream,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (deleteEmittedStreams != null) {
      _result.deleteEmittedStreams = deleteEmittedStreams;
    }
    if (deleteStateStream != null) {
      _result.deleteStateStream = deleteStateStream;
    }
    if (deleteCheckpointStream != null) {
      _result.deleteCheckpointStream = deleteCheckpointStream;
    }
    return _result;
  }
  factory DeleteReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteReq_Options clone() => DeleteReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteReq_Options copyWith(void Function(DeleteReq_Options) updates) =>
      super.copyWith((message) => updates(message as DeleteReq_Options))
          as DeleteReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteReq_Options create() => DeleteReq_Options._();
  DeleteReq_Options createEmptyInstance() => create();
  static $pb.PbList<DeleteReq_Options> createRepeated() =>
      $pb.PbList<DeleteReq_Options>();
  @$core.pragma('dart2js:noInline')
  static DeleteReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteReq_Options>(create);
  static DeleteReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get deleteEmittedStreams => $_getBF(1);
  @$pb.TagNumber(2)
  set deleteEmittedStreams($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDeleteEmittedStreams() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeleteEmittedStreams() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get deleteStateStream => $_getBF(2);
  @$pb.TagNumber(3)
  set deleteStateStream($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDeleteStateStream() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeleteStateStream() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get deleteCheckpointStream => $_getBF(3);
  @$pb.TagNumber(4)
  set deleteCheckpointStream($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDeleteCheckpointStream() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeleteCheckpointStream() => clearField(4);
}

class DeleteReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<DeleteReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: DeleteReq_Options.create)
    ..hasRequiredFields = false;

  DeleteReq._() : super();
  factory DeleteReq({
    DeleteReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory DeleteReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteReq clone() => DeleteReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteReq copyWith(void Function(DeleteReq) updates) =>
      super.copyWith((message) => updates(message as DeleteReq))
          as DeleteReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteReq create() => DeleteReq._();
  DeleteReq createEmptyInstance() => create();
  static $pb.PbList<DeleteReq> createRepeated() => $pb.PbList<DeleteReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteReq>(create);
  static DeleteReq? _defaultInstance;

  @$pb.TagNumber(1)
  DeleteReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(DeleteReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  DeleteReq_Options ensureOptions() => $_ensure(0);
}

class DeleteResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  DeleteResp._() : super();
  factory DeleteResp() => create();
  factory DeleteResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteResp clone() => DeleteResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteResp copyWith(void Function(DeleteResp) updates) =>
      super.copyWith((message) => updates(message as DeleteResp))
          as DeleteResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteResp create() => DeleteResp._();
  DeleteResp createEmptyInstance() => create();
  static $pb.PbList<DeleteResp> createRepeated() => $pb.PbList<DeleteResp>();
  @$core.pragma('dart2js:noInline')
  static DeleteResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteResp>(create);
  static DeleteResp? _defaultInstance;
}

enum StatisticsReq_Options_Mode {
  name,
  all,
  transient,
  continuous,
  oneTime,
  notSet
}

class StatisticsReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, StatisticsReq_Options_Mode>
      _StatisticsReq_Options_ModeByTag = {
    1: StatisticsReq_Options_Mode.name,
    2: StatisticsReq_Options_Mode.all,
    3: StatisticsReq_Options_Mode.transient,
    4: StatisticsReq_Options_Mode.continuous,
    5: StatisticsReq_Options_Mode.oneTime,
    0: StatisticsReq_Options_Mode.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StatisticsReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOM<$1.Empty>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'all',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transient',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'continuous',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oneTime', subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  StatisticsReq_Options._() : super();
  factory StatisticsReq_Options({
    $core.String? name,
    $1.Empty? all,
    $1.Empty? transient,
    $1.Empty? continuous,
    $1.Empty? oneTime,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (all != null) {
      _result.all = all;
    }
    if (transient != null) {
      _result.transient = transient;
    }
    if (continuous != null) {
      _result.continuous = continuous;
    }
    if (oneTime != null) {
      _result.oneTime = oneTime;
    }
    return _result;
  }
  factory StatisticsReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StatisticsReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StatisticsReq_Options clone() =>
      StatisticsReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StatisticsReq_Options copyWith(
          void Function(StatisticsReq_Options) updates) =>
      super.copyWith((message) => updates(message as StatisticsReq_Options))
          as StatisticsReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatisticsReq_Options create() => StatisticsReq_Options._();
  StatisticsReq_Options createEmptyInstance() => create();
  static $pb.PbList<StatisticsReq_Options> createRepeated() =>
      $pb.PbList<StatisticsReq_Options>();
  @$core.pragma('dart2js:noInline')
  static StatisticsReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StatisticsReq_Options>(create);
  static StatisticsReq_Options? _defaultInstance;

  StatisticsReq_Options_Mode whichMode() =>
      _StatisticsReq_Options_ModeByTag[$_whichOneof(0)]!;
  void clearMode() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $1.Empty get all => $_getN(1);
  @$pb.TagNumber(2)
  set all($1.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAll() => $_has(1);
  @$pb.TagNumber(2)
  void clearAll() => clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureAll() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Empty get transient => $_getN(2);
  @$pb.TagNumber(3)
  set transient($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTransient() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransient() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureTransient() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Empty get continuous => $_getN(3);
  @$pb.TagNumber(4)
  set continuous($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContinuous() => $_has(3);
  @$pb.TagNumber(4)
  void clearContinuous() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureContinuous() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Empty get oneTime => $_getN(4);
  @$pb.TagNumber(5)
  set oneTime($1.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOneTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearOneTime() => clearField(5);
  @$pb.TagNumber(5)
  $1.Empty ensureOneTime() => $_ensure(4);
}

class StatisticsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StatisticsReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<StatisticsReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: StatisticsReq_Options.create)
    ..hasRequiredFields = false;

  StatisticsReq._() : super();
  factory StatisticsReq({
    StatisticsReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory StatisticsReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StatisticsReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StatisticsReq clone() => StatisticsReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StatisticsReq copyWith(void Function(StatisticsReq) updates) =>
      super.copyWith((message) => updates(message as StatisticsReq))
          as StatisticsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatisticsReq create() => StatisticsReq._();
  StatisticsReq createEmptyInstance() => create();
  static $pb.PbList<StatisticsReq> createRepeated() =>
      $pb.PbList<StatisticsReq>();
  @$core.pragma('dart2js:noInline')
  static StatisticsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StatisticsReq>(create);
  static StatisticsReq? _defaultInstance;

  @$pb.TagNumber(1)
  StatisticsReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(StatisticsReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  StatisticsReq_Options ensureOptions() => $_ensure(0);
}

class StatisticsResp_Details extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StatisticsResp.Details',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'coreProcessingTime',
        protoName: 'coreProcessingTime')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'epoch')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'effectiveName', protoName: 'effectiveName')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'writesInProgress', $pb.PbFieldType.O3, protoName: 'writesInProgress')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'readsInProgress', $pb.PbFieldType.O3, protoName: 'readsInProgress')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'partitionsCached', $pb.PbFieldType.O3, protoName: 'partitionsCached')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stateReason', protoName: 'stateReason')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position')
    ..a<$core.double>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'progress', $pb.PbFieldType.OF)
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastCheckpoint', protoName: 'lastCheckpoint')
    ..aInt64(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventsProcessedAfterRestart', protoName: 'eventsProcessedAfterRestart')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'checkpointStatus', protoName: 'checkpointStatus')
    ..aInt64(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bufferedEvents', protoName: 'bufferedEvents')
    ..a<$core.int>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'writePendingEventsBeforeCheckpoint', $pb.PbFieldType.O3, protoName: 'writePendingEventsBeforeCheckpoint')
    ..a<$core.int>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'writePendingEventsAfterCheckpoint', $pb.PbFieldType.O3, protoName: 'writePendingEventsAfterCheckpoint')
    ..hasRequiredFields = false;

  StatisticsResp_Details._() : super();
  factory StatisticsResp_Details({
    $fixnum.Int64? coreProcessingTime,
    $fixnum.Int64? version,
    $fixnum.Int64? epoch,
    $core.String? effectiveName,
    $core.int? writesInProgress,
    $core.int? readsInProgress,
    $core.int? partitionsCached,
    $core.String? status,
    $core.String? stateReason,
    $core.String? name,
    $core.String? mode,
    $core.String? position,
    $core.double? progress,
    $core.String? lastCheckpoint,
    $fixnum.Int64? eventsProcessedAfterRestart,
    $core.String? checkpointStatus,
    $fixnum.Int64? bufferedEvents,
    $core.int? writePendingEventsBeforeCheckpoint,
    $core.int? writePendingEventsAfterCheckpoint,
  }) {
    final _result = create();
    if (coreProcessingTime != null) {
      _result.coreProcessingTime = coreProcessingTime;
    }
    if (version != null) {
      _result.version = version;
    }
    if (epoch != null) {
      _result.epoch = epoch;
    }
    if (effectiveName != null) {
      _result.effectiveName = effectiveName;
    }
    if (writesInProgress != null) {
      _result.writesInProgress = writesInProgress;
    }
    if (readsInProgress != null) {
      _result.readsInProgress = readsInProgress;
    }
    if (partitionsCached != null) {
      _result.partitionsCached = partitionsCached;
    }
    if (status != null) {
      _result.status = status;
    }
    if (stateReason != null) {
      _result.stateReason = stateReason;
    }
    if (name != null) {
      _result.name = name;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (position != null) {
      _result.position = position;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    if (lastCheckpoint != null) {
      _result.lastCheckpoint = lastCheckpoint;
    }
    if (eventsProcessedAfterRestart != null) {
      _result.eventsProcessedAfterRestart = eventsProcessedAfterRestart;
    }
    if (checkpointStatus != null) {
      _result.checkpointStatus = checkpointStatus;
    }
    if (bufferedEvents != null) {
      _result.bufferedEvents = bufferedEvents;
    }
    if (writePendingEventsBeforeCheckpoint != null) {
      _result.writePendingEventsBeforeCheckpoint =
          writePendingEventsBeforeCheckpoint;
    }
    if (writePendingEventsAfterCheckpoint != null) {
      _result.writePendingEventsAfterCheckpoint =
          writePendingEventsAfterCheckpoint;
    }
    return _result;
  }
  factory StatisticsResp_Details.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StatisticsResp_Details.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StatisticsResp_Details clone() =>
      StatisticsResp_Details()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StatisticsResp_Details copyWith(
          void Function(StatisticsResp_Details) updates) =>
      super.copyWith((message) => updates(message as StatisticsResp_Details))
          as StatisticsResp_Details; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatisticsResp_Details create() => StatisticsResp_Details._();
  StatisticsResp_Details createEmptyInstance() => create();
  static $pb.PbList<StatisticsResp_Details> createRepeated() =>
      $pb.PbList<StatisticsResp_Details>();
  @$core.pragma('dart2js:noInline')
  static StatisticsResp_Details getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StatisticsResp_Details>(create);
  static StatisticsResp_Details? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get coreProcessingTime => $_getI64(0);
  @$pb.TagNumber(1)
  set coreProcessingTime($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCoreProcessingTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoreProcessingTime() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get version => $_getI64(1);
  @$pb.TagNumber(2)
  set version($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get epoch => $_getI64(2);
  @$pb.TagNumber(3)
  set epoch($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEpoch() => $_has(2);
  @$pb.TagNumber(3)
  void clearEpoch() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get effectiveName => $_getSZ(3);
  @$pb.TagNumber(4)
  set effectiveName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEffectiveName() => $_has(3);
  @$pb.TagNumber(4)
  void clearEffectiveName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get writesInProgress => $_getIZ(4);
  @$pb.TagNumber(5)
  set writesInProgress($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWritesInProgress() => $_has(4);
  @$pb.TagNumber(5)
  void clearWritesInProgress() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get readsInProgress => $_getIZ(5);
  @$pb.TagNumber(6)
  set readsInProgress($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasReadsInProgress() => $_has(5);
  @$pb.TagNumber(6)
  void clearReadsInProgress() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get partitionsCached => $_getIZ(6);
  @$pb.TagNumber(7)
  set partitionsCached($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPartitionsCached() => $_has(6);
  @$pb.TagNumber(7)
  void clearPartitionsCached() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get stateReason => $_getSZ(8);
  @$pb.TagNumber(9)
  set stateReason($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasStateReason() => $_has(8);
  @$pb.TagNumber(9)
  void clearStateReason() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get name => $_getSZ(9);
  @$pb.TagNumber(10)
  set name($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasName() => $_has(9);
  @$pb.TagNumber(10)
  void clearName() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get mode => $_getSZ(10);
  @$pb.TagNumber(11)
  set mode($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasMode() => $_has(10);
  @$pb.TagNumber(11)
  void clearMode() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get position => $_getSZ(11);
  @$pb.TagNumber(12)
  set position($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasPosition() => $_has(11);
  @$pb.TagNumber(12)
  void clearPosition() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get progress => $_getN(12);
  @$pb.TagNumber(13)
  set progress($core.double v) {
    $_setFloat(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasProgress() => $_has(12);
  @$pb.TagNumber(13)
  void clearProgress() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get lastCheckpoint => $_getSZ(13);
  @$pb.TagNumber(14)
  set lastCheckpoint($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasLastCheckpoint() => $_has(13);
  @$pb.TagNumber(14)
  void clearLastCheckpoint() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get eventsProcessedAfterRestart => $_getI64(14);
  @$pb.TagNumber(15)
  set eventsProcessedAfterRestart($fixnum.Int64 v) {
    $_setInt64(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasEventsProcessedAfterRestart() => $_has(14);
  @$pb.TagNumber(15)
  void clearEventsProcessedAfterRestart() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get checkpointStatus => $_getSZ(15);
  @$pb.TagNumber(16)
  set checkpointStatus($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasCheckpointStatus() => $_has(15);
  @$pb.TagNumber(16)
  void clearCheckpointStatus() => clearField(16);

  @$pb.TagNumber(17)
  $fixnum.Int64 get bufferedEvents => $_getI64(16);
  @$pb.TagNumber(17)
  set bufferedEvents($fixnum.Int64 v) {
    $_setInt64(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasBufferedEvents() => $_has(16);
  @$pb.TagNumber(17)
  void clearBufferedEvents() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get writePendingEventsBeforeCheckpoint => $_getIZ(17);
  @$pb.TagNumber(18)
  set writePendingEventsBeforeCheckpoint($core.int v) {
    $_setSignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasWritePendingEventsBeforeCheckpoint() => $_has(17);
  @$pb.TagNumber(18)
  void clearWritePendingEventsBeforeCheckpoint() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get writePendingEventsAfterCheckpoint => $_getIZ(18);
  @$pb.TagNumber(19)
  set writePendingEventsAfterCheckpoint($core.int v) {
    $_setSignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasWritePendingEventsAfterCheckpoint() => $_has(18);
  @$pb.TagNumber(19)
  void clearWritePendingEventsAfterCheckpoint() => clearField(19);
}

class StatisticsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StatisticsResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<StatisticsResp_Details>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'details',
        subBuilder: StatisticsResp_Details.create)
    ..hasRequiredFields = false;

  StatisticsResp._() : super();
  factory StatisticsResp({
    StatisticsResp_Details? details,
  }) {
    final _result = create();
    if (details != null) {
      _result.details = details;
    }
    return _result;
  }
  factory StatisticsResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StatisticsResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StatisticsResp clone() => StatisticsResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StatisticsResp copyWith(void Function(StatisticsResp) updates) =>
      super.copyWith((message) => updates(message as StatisticsResp))
          as StatisticsResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatisticsResp create() => StatisticsResp._();
  StatisticsResp createEmptyInstance() => create();
  static $pb.PbList<StatisticsResp> createRepeated() =>
      $pb.PbList<StatisticsResp>();
  @$core.pragma('dart2js:noInline')
  static StatisticsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StatisticsResp>(create);
  static StatisticsResp? _defaultInstance;

  @$pb.TagNumber(1)
  StatisticsResp_Details get details => $_getN(0);
  @$pb.TagNumber(1)
  set details(StatisticsResp_Details v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDetails() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetails() => clearField(1);
  @$pb.TagNumber(1)
  StatisticsResp_Details ensureDetails() => $_ensure(0);
}

class StateReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StateReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partition')
    ..hasRequiredFields = false;

  StateReq_Options._() : super();
  factory StateReq_Options({
    $core.String? name,
    $core.String? partition,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (partition != null) {
      _result.partition = partition;
    }
    return _result;
  }
  factory StateReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StateReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StateReq_Options clone() => StateReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StateReq_Options copyWith(void Function(StateReq_Options) updates) =>
      super.copyWith((message) => updates(message as StateReq_Options))
          as StateReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StateReq_Options create() => StateReq_Options._();
  StateReq_Options createEmptyInstance() => create();
  static $pb.PbList<StateReq_Options> createRepeated() =>
      $pb.PbList<StateReq_Options>();
  @$core.pragma('dart2js:noInline')
  static StateReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StateReq_Options>(create);
  static StateReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get partition => $_getSZ(1);
  @$pb.TagNumber(2)
  set partition($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPartition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartition() => clearField(2);
}

class StateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StateReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<StateReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: StateReq_Options.create)
    ..hasRequiredFields = false;

  StateReq._() : super();
  factory StateReq({
    StateReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory StateReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StateReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StateReq clone() => StateReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StateReq copyWith(void Function(StateReq) updates) =>
      super.copyWith((message) => updates(message as StateReq))
          as StateReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StateReq create() => StateReq._();
  StateReq createEmptyInstance() => create();
  static $pb.PbList<StateReq> createRepeated() => $pb.PbList<StateReq>();
  @$core.pragma('dart2js:noInline')
  static StateReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StateReq>(create);
  static StateReq? _defaultInstance;

  @$pb.TagNumber(1)
  StateReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(StateReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  StateReq_Options ensureOptions() => $_ensure(0);
}

class StateResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StateResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<$9.Value>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        subBuilder: $9.Value.create)
    ..hasRequiredFields = false;

  StateResp._() : super();
  factory StateResp({
    $9.Value? state,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory StateResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StateResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StateResp clone() => StateResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StateResp copyWith(void Function(StateResp) updates) =>
      super.copyWith((message) => updates(message as StateResp))
          as StateResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StateResp create() => StateResp._();
  StateResp createEmptyInstance() => create();
  static $pb.PbList<StateResp> createRepeated() => $pb.PbList<StateResp>();
  @$core.pragma('dart2js:noInline')
  static StateResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StateResp>(create);
  static StateResp? _defaultInstance;

  @$pb.TagNumber(1)
  $9.Value get state => $_getN(0);
  @$pb.TagNumber(1)
  set state($9.Value v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
  @$pb.TagNumber(1)
  $9.Value ensureState() => $_ensure(0);
}

class ResultReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResultReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partition')
    ..hasRequiredFields = false;

  ResultReq_Options._() : super();
  factory ResultReq_Options({
    $core.String? name,
    $core.String? partition,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (partition != null) {
      _result.partition = partition;
    }
    return _result;
  }
  factory ResultReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResultReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResultReq_Options clone() => ResultReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResultReq_Options copyWith(void Function(ResultReq_Options) updates) =>
      super.copyWith((message) => updates(message as ResultReq_Options))
          as ResultReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResultReq_Options create() => ResultReq_Options._();
  ResultReq_Options createEmptyInstance() => create();
  static $pb.PbList<ResultReq_Options> createRepeated() =>
      $pb.PbList<ResultReq_Options>();
  @$core.pragma('dart2js:noInline')
  static ResultReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResultReq_Options>(create);
  static ResultReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get partition => $_getSZ(1);
  @$pb.TagNumber(2)
  set partition($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPartition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartition() => clearField(2);
}

class ResultReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResultReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<ResultReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: ResultReq_Options.create)
    ..hasRequiredFields = false;

  ResultReq._() : super();
  factory ResultReq({
    ResultReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory ResultReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResultReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResultReq clone() => ResultReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResultReq copyWith(void Function(ResultReq) updates) =>
      super.copyWith((message) => updates(message as ResultReq))
          as ResultReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResultReq create() => ResultReq._();
  ResultReq createEmptyInstance() => create();
  static $pb.PbList<ResultReq> createRepeated() => $pb.PbList<ResultReq>();
  @$core.pragma('dart2js:noInline')
  static ResultReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultReq>(create);
  static ResultReq? _defaultInstance;

  @$pb.TagNumber(1)
  ResultReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(ResultReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  ResultReq_Options ensureOptions() => $_ensure(0);
}

class ResultResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResultResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<$9.Value>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'result',
        subBuilder: $9.Value.create)
    ..hasRequiredFields = false;

  ResultResp._() : super();
  factory ResultResp({
    $9.Value? result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory ResultResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResultResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResultResp clone() => ResultResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResultResp copyWith(void Function(ResultResp) updates) =>
      super.copyWith((message) => updates(message as ResultResp))
          as ResultResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResultResp create() => ResultResp._();
  ResultResp createEmptyInstance() => create();
  static $pb.PbList<ResultResp> createRepeated() => $pb.PbList<ResultResp>();
  @$core.pragma('dart2js:noInline')
  static ResultResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResultResp>(create);
  static ResultResp? _defaultInstance;

  @$pb.TagNumber(1)
  $9.Value get result => $_getN(0);
  @$pb.TagNumber(1)
  set result($9.Value v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
  @$pb.TagNumber(1)
  $9.Value ensureResult() => $_ensure(0);
}

class ResetReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResetReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'writeCheckpoint')
    ..hasRequiredFields = false;

  ResetReq_Options._() : super();
  factory ResetReq_Options({
    $core.String? name,
    $core.bool? writeCheckpoint,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (writeCheckpoint != null) {
      _result.writeCheckpoint = writeCheckpoint;
    }
    return _result;
  }
  factory ResetReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResetReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResetReq_Options clone() => ResetReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResetReq_Options copyWith(void Function(ResetReq_Options) updates) =>
      super.copyWith((message) => updates(message as ResetReq_Options))
          as ResetReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetReq_Options create() => ResetReq_Options._();
  ResetReq_Options createEmptyInstance() => create();
  static $pb.PbList<ResetReq_Options> createRepeated() =>
      $pb.PbList<ResetReq_Options>();
  @$core.pragma('dart2js:noInline')
  static ResetReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResetReq_Options>(create);
  static ResetReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get writeCheckpoint => $_getBF(1);
  @$pb.TagNumber(2)
  set writeCheckpoint($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWriteCheckpoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearWriteCheckpoint() => clearField(2);
}

class ResetReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResetReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<ResetReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: ResetReq_Options.create)
    ..hasRequiredFields = false;

  ResetReq._() : super();
  factory ResetReq({
    ResetReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory ResetReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResetReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResetReq clone() => ResetReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResetReq copyWith(void Function(ResetReq) updates) =>
      super.copyWith((message) => updates(message as ResetReq))
          as ResetReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetReq create() => ResetReq._();
  ResetReq createEmptyInstance() => create();
  static $pb.PbList<ResetReq> createRepeated() => $pb.PbList<ResetReq>();
  @$core.pragma('dart2js:noInline')
  static ResetReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetReq>(create);
  static ResetReq? _defaultInstance;

  @$pb.TagNumber(1)
  ResetReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(ResetReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  ResetReq_Options ensureOptions() => $_ensure(0);
}

class ResetResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResetResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  ResetResp._() : super();
  factory ResetResp() => create();
  factory ResetResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResetResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResetResp clone() => ResetResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResetResp copyWith(void Function(ResetResp) updates) =>
      super.copyWith((message) => updates(message as ResetResp))
          as ResetResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetResp create() => ResetResp._();
  ResetResp createEmptyInstance() => create();
  static $pb.PbList<ResetResp> createRepeated() => $pb.PbList<ResetResp>();
  @$core.pragma('dart2js:noInline')
  static ResetResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetResp>(create);
  static ResetResp? _defaultInstance;
}

class EnableReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EnableReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  EnableReq_Options._() : super();
  factory EnableReq_Options({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory EnableReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EnableReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EnableReq_Options clone() => EnableReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EnableReq_Options copyWith(void Function(EnableReq_Options) updates) =>
      super.copyWith((message) => updates(message as EnableReq_Options))
          as EnableReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnableReq_Options create() => EnableReq_Options._();
  EnableReq_Options createEmptyInstance() => create();
  static $pb.PbList<EnableReq_Options> createRepeated() =>
      $pb.PbList<EnableReq_Options>();
  @$core.pragma('dart2js:noInline')
  static EnableReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnableReq_Options>(create);
  static EnableReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class EnableReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EnableReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<EnableReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: EnableReq_Options.create)
    ..hasRequiredFields = false;

  EnableReq._() : super();
  factory EnableReq({
    EnableReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory EnableReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EnableReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EnableReq clone() => EnableReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EnableReq copyWith(void Function(EnableReq) updates) =>
      super.copyWith((message) => updates(message as EnableReq))
          as EnableReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnableReq create() => EnableReq._();
  EnableReq createEmptyInstance() => create();
  static $pb.PbList<EnableReq> createRepeated() => $pb.PbList<EnableReq>();
  @$core.pragma('dart2js:noInline')
  static EnableReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnableReq>(create);
  static EnableReq? _defaultInstance;

  @$pb.TagNumber(1)
  EnableReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(EnableReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  EnableReq_Options ensureOptions() => $_ensure(0);
}

class EnableResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EnableResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  EnableResp._() : super();
  factory EnableResp() => create();
  factory EnableResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EnableResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EnableResp clone() => EnableResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EnableResp copyWith(void Function(EnableResp) updates) =>
      super.copyWith((message) => updates(message as EnableResp))
          as EnableResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnableResp create() => EnableResp._();
  EnableResp createEmptyInstance() => create();
  static $pb.PbList<EnableResp> createRepeated() => $pb.PbList<EnableResp>();
  @$core.pragma('dart2js:noInline')
  static EnableResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnableResp>(create);
  static EnableResp? _defaultInstance;
}

class DisableReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DisableReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'writeCheckpoint')
    ..hasRequiredFields = false;

  DisableReq_Options._() : super();
  factory DisableReq_Options({
    $core.String? name,
    $core.bool? writeCheckpoint,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (writeCheckpoint != null) {
      _result.writeCheckpoint = writeCheckpoint;
    }
    return _result;
  }
  factory DisableReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DisableReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DisableReq_Options clone() => DisableReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DisableReq_Options copyWith(void Function(DisableReq_Options) updates) =>
      super.copyWith((message) => updates(message as DisableReq_Options))
          as DisableReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DisableReq_Options create() => DisableReq_Options._();
  DisableReq_Options createEmptyInstance() => create();
  static $pb.PbList<DisableReq_Options> createRepeated() =>
      $pb.PbList<DisableReq_Options>();
  @$core.pragma('dart2js:noInline')
  static DisableReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisableReq_Options>(create);
  static DisableReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get writeCheckpoint => $_getBF(1);
  @$pb.TagNumber(2)
  set writeCheckpoint($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWriteCheckpoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearWriteCheckpoint() => clearField(2);
}

class DisableReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DisableReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..aOM<DisableReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: DisableReq_Options.create)
    ..hasRequiredFields = false;

  DisableReq._() : super();
  factory DisableReq({
    DisableReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory DisableReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DisableReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DisableReq clone() => DisableReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DisableReq copyWith(void Function(DisableReq) updates) =>
      super.copyWith((message) => updates(message as DisableReq))
          as DisableReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DisableReq create() => DisableReq._();
  DisableReq createEmptyInstance() => create();
  static $pb.PbList<DisableReq> createRepeated() => $pb.PbList<DisableReq>();
  @$core.pragma('dart2js:noInline')
  static DisableReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisableReq>(create);
  static DisableReq? _defaultInstance;

  @$pb.TagNumber(1)
  DisableReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(DisableReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  DisableReq_Options ensureOptions() => $_ensure(0);
}

class DisableResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DisableResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.projections'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  DisableResp._() : super();
  factory DisableResp() => create();
  factory DisableResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DisableResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DisableResp clone() => DisableResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DisableResp copyWith(void Function(DisableResp) updates) =>
      super.copyWith((message) => updates(message as DisableResp))
          as DisableResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DisableResp create() => DisableResp._();
  DisableResp createEmptyInstance() => create();
  static $pb.PbList<DisableResp> createRepeated() => $pb.PbList<DisableResp>();
  @$core.pragma('dart2js:noInline')
  static DisableResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisableResp>(create);
  static DisableResp? _defaultInstance;
}
