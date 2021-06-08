///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class CreateReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginName')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fullName')
    ..pPS(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groups')
    ..hasRequiredFields = false;

  CreateReq_Options._() : super();
  factory CreateReq_Options({
    $core.String? loginName,
    $core.String? password,
    $core.String? fullName,
    $core.Iterable<$core.String>? groups,
  }) {
    final _result = create();
    if (loginName != null) {
      _result.loginName = loginName;
    }
    if (password != null) {
      _result.password = password;
    }
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (groups != null) {
      _result.groups.addAll(groups);
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

  @$pb.TagNumber(1)
  $core.String get loginName => $_getSZ(0);
  @$pb.TagNumber(1)
  set loginName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLoginName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fullName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fullName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFullName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFullName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get groups => $_getList(3);
}

class CreateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
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
              : 'event_store.client.users'),
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

class UpdateReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginName')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fullName')
    ..pPS(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groups')
    ..hasRequiredFields = false;

  UpdateReq_Options._() : super();
  factory UpdateReq_Options({
    $core.String? loginName,
    $core.String? password,
    $core.String? fullName,
    $core.Iterable<$core.String>? groups,
  }) {
    final _result = create();
    if (loginName != null) {
      _result.loginName = loginName;
    }
    if (password != null) {
      _result.password = password;
    }
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (groups != null) {
      _result.groups.addAll(groups);
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

  @$pb.TagNumber(1)
  $core.String get loginName => $_getSZ(0);
  @$pb.TagNumber(1)
  set loginName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLoginName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fullName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fullName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFullName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFullName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get groups => $_getList(3);
}

class UpdateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
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
              : 'event_store.client.users'),
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
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginName')
    ..hasRequiredFields = false;

  DeleteReq_Options._() : super();
  factory DeleteReq_Options({
    $core.String? loginName,
  }) {
    final _result = create();
    if (loginName != null) {
      _result.loginName = loginName;
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
  $core.String get loginName => $_getSZ(0);
  @$pb.TagNumber(1)
  set loginName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLoginName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginName() => clearField(1);
}

class DeleteReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
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
              : 'event_store.client.users'),
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

class EnableReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EnableReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginName')
    ..hasRequiredFields = false;

  EnableReq_Options._() : super();
  factory EnableReq_Options({
    $core.String? loginName,
  }) {
    final _result = create();
    if (loginName != null) {
      _result.loginName = loginName;
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
  $core.String get loginName => $_getSZ(0);
  @$pb.TagNumber(1)
  set loginName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLoginName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginName() => clearField(1);
}

class EnableReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EnableReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
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
              : 'event_store.client.users'),
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
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginName')
    ..hasRequiredFields = false;

  DisableReq_Options._() : super();
  factory DisableReq_Options({
    $core.String? loginName,
  }) {
    final _result = create();
    if (loginName != null) {
      _result.loginName = loginName;
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
  $core.String get loginName => $_getSZ(0);
  @$pb.TagNumber(1)
  set loginName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLoginName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginName() => clearField(1);
}

class DisableReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DisableReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
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
              : 'event_store.client.users'),
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

class DetailsReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailsReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginName')
    ..hasRequiredFields = false;

  DetailsReq_Options._() : super();
  factory DetailsReq_Options({
    $core.String? loginName,
  }) {
    final _result = create();
    if (loginName != null) {
      _result.loginName = loginName;
    }
    return _result;
  }
  factory DetailsReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailsReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailsReq_Options clone() => DetailsReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailsReq_Options copyWith(void Function(DetailsReq_Options) updates) =>
      super.copyWith((message) => updates(message as DetailsReq_Options))
          as DetailsReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailsReq_Options create() => DetailsReq_Options._();
  DetailsReq_Options createEmptyInstance() => create();
  static $pb.PbList<DetailsReq_Options> createRepeated() =>
      $pb.PbList<DetailsReq_Options>();
  @$core.pragma('dart2js:noInline')
  static DetailsReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailsReq_Options>(create);
  static DetailsReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get loginName => $_getSZ(0);
  @$pb.TagNumber(1)
  set loginName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLoginName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginName() => clearField(1);
}

class DetailsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailsReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOM<DetailsReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: DetailsReq_Options.create)
    ..hasRequiredFields = false;

  DetailsReq._() : super();
  factory DetailsReq({
    DetailsReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory DetailsReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailsReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailsReq clone() => DetailsReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailsReq copyWith(void Function(DetailsReq) updates) =>
      super.copyWith((message) => updates(message as DetailsReq))
          as DetailsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailsReq create() => DetailsReq._();
  DetailsReq createEmptyInstance() => create();
  static $pb.PbList<DetailsReq> createRepeated() => $pb.PbList<DetailsReq>();
  @$core.pragma('dart2js:noInline')
  static DetailsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailsReq>(create);
  static DetailsReq? _defaultInstance;

  @$pb.TagNumber(1)
  DetailsReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(DetailsReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  DetailsReq_Options ensureOptions() => $_ensure(0);
}

class DetailsResp_UserDetails_DateTime extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailsResp.UserDetails.DateTime',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ticksSinceEpoch')
    ..hasRequiredFields = false;

  DetailsResp_UserDetails_DateTime._() : super();
  factory DetailsResp_UserDetails_DateTime({
    $fixnum.Int64? ticksSinceEpoch,
  }) {
    final _result = create();
    if (ticksSinceEpoch != null) {
      _result.ticksSinceEpoch = ticksSinceEpoch;
    }
    return _result;
  }
  factory DetailsResp_UserDetails_DateTime.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailsResp_UserDetails_DateTime.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailsResp_UserDetails_DateTime clone() =>
      DetailsResp_UserDetails_DateTime()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailsResp_UserDetails_DateTime copyWith(
          void Function(DetailsResp_UserDetails_DateTime) updates) =>
      super.copyWith(
              (message) => updates(message as DetailsResp_UserDetails_DateTime))
          as DetailsResp_UserDetails_DateTime; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailsResp_UserDetails_DateTime create() =>
      DetailsResp_UserDetails_DateTime._();
  DetailsResp_UserDetails_DateTime createEmptyInstance() => create();
  static $pb.PbList<DetailsResp_UserDetails_DateTime> createRepeated() =>
      $pb.PbList<DetailsResp_UserDetails_DateTime>();
  @$core.pragma('dart2js:noInline')
  static DetailsResp_UserDetails_DateTime getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailsResp_UserDetails_DateTime>(
          create);
  static DetailsResp_UserDetails_DateTime? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get ticksSinceEpoch => $_getI64(0);
  @$pb.TagNumber(1)
  set ticksSinceEpoch($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTicksSinceEpoch() => $_has(0);
  @$pb.TagNumber(1)
  void clearTicksSinceEpoch() => clearField(1);
}

class DetailsResp_UserDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailsResp.UserDetails',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginName')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fullName')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groups')
    ..aOM<DetailsResp_UserDetails_DateTime>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdated',
        subBuilder: DetailsResp_UserDetails_DateTime.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'disabled')
    ..hasRequiredFields = false;

  DetailsResp_UserDetails._() : super();
  factory DetailsResp_UserDetails({
    $core.String? loginName,
    $core.String? fullName,
    $core.Iterable<$core.String>? groups,
    DetailsResp_UserDetails_DateTime? lastUpdated,
    $core.bool? disabled,
  }) {
    final _result = create();
    if (loginName != null) {
      _result.loginName = loginName;
    }
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (groups != null) {
      _result.groups.addAll(groups);
    }
    if (lastUpdated != null) {
      _result.lastUpdated = lastUpdated;
    }
    if (disabled != null) {
      _result.disabled = disabled;
    }
    return _result;
  }
  factory DetailsResp_UserDetails.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailsResp_UserDetails.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailsResp_UserDetails clone() =>
      DetailsResp_UserDetails()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailsResp_UserDetails copyWith(
          void Function(DetailsResp_UserDetails) updates) =>
      super.copyWith((message) => updates(message as DetailsResp_UserDetails))
          as DetailsResp_UserDetails; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailsResp_UserDetails create() => DetailsResp_UserDetails._();
  DetailsResp_UserDetails createEmptyInstance() => create();
  static $pb.PbList<DetailsResp_UserDetails> createRepeated() =>
      $pb.PbList<DetailsResp_UserDetails>();
  @$core.pragma('dart2js:noInline')
  static DetailsResp_UserDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailsResp_UserDetails>(create);
  static DetailsResp_UserDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get loginName => $_getSZ(0);
  @$pb.TagNumber(1)
  set loginName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLoginName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get groups => $_getList(2);

  @$pb.TagNumber(4)
  DetailsResp_UserDetails_DateTime get lastUpdated => $_getN(3);
  @$pb.TagNumber(4)
  set lastUpdated(DetailsResp_UserDetails_DateTime v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLastUpdated() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastUpdated() => clearField(4);
  @$pb.TagNumber(4)
  DetailsResp_UserDetails_DateTime ensureLastUpdated() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get disabled => $_getBF(4);
  @$pb.TagNumber(5)
  set disabled($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDisabled() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisabled() => clearField(5);
}

class DetailsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DetailsResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOM<DetailsResp_UserDetails>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userDetails',
        subBuilder: DetailsResp_UserDetails.create)
    ..hasRequiredFields = false;

  DetailsResp._() : super();
  factory DetailsResp({
    DetailsResp_UserDetails? userDetails,
  }) {
    final _result = create();
    if (userDetails != null) {
      _result.userDetails = userDetails;
    }
    return _result;
  }
  factory DetailsResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DetailsResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DetailsResp clone() => DetailsResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DetailsResp copyWith(void Function(DetailsResp) updates) =>
      super.copyWith((message) => updates(message as DetailsResp))
          as DetailsResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DetailsResp create() => DetailsResp._();
  DetailsResp createEmptyInstance() => create();
  static $pb.PbList<DetailsResp> createRepeated() => $pb.PbList<DetailsResp>();
  @$core.pragma('dart2js:noInline')
  static DetailsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DetailsResp>(create);
  static DetailsResp? _defaultInstance;

  @$pb.TagNumber(1)
  DetailsResp_UserDetails get userDetails => $_getN(0);
  @$pb.TagNumber(1)
  set userDetails(DetailsResp_UserDetails v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserDetails() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserDetails() => clearField(1);
  @$pb.TagNumber(1)
  DetailsResp_UserDetails ensureUserDetails() => $_ensure(0);
}

class ChangePasswordReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChangePasswordReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginName')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentPassword')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newPassword')
    ..hasRequiredFields = false;

  ChangePasswordReq_Options._() : super();
  factory ChangePasswordReq_Options({
    $core.String? loginName,
    $core.String? currentPassword,
    $core.String? newPassword,
  }) {
    final _result = create();
    if (loginName != null) {
      _result.loginName = loginName;
    }
    if (currentPassword != null) {
      _result.currentPassword = currentPassword;
    }
    if (newPassword != null) {
      _result.newPassword = newPassword;
    }
    return _result;
  }
  factory ChangePasswordReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChangePasswordReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChangePasswordReq_Options clone() =>
      ChangePasswordReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChangePasswordReq_Options copyWith(
          void Function(ChangePasswordReq_Options) updates) =>
      super.copyWith((message) => updates(message as ChangePasswordReq_Options))
          as ChangePasswordReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangePasswordReq_Options create() => ChangePasswordReq_Options._();
  ChangePasswordReq_Options createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordReq_Options> createRepeated() =>
      $pb.PbList<ChangePasswordReq_Options>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangePasswordReq_Options>(create);
  static ChangePasswordReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get loginName => $_getSZ(0);
  @$pb.TagNumber(1)
  set loginName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLoginName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currentPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set currentPassword($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrentPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get newPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set newPassword($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNewPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewPassword() => clearField(3);
}

class ChangePasswordReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChangePasswordReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOM<ChangePasswordReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: ChangePasswordReq_Options.create)
    ..hasRequiredFields = false;

  ChangePasswordReq._() : super();
  factory ChangePasswordReq({
    ChangePasswordReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory ChangePasswordReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChangePasswordReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChangePasswordReq clone() => ChangePasswordReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChangePasswordReq copyWith(void Function(ChangePasswordReq) updates) =>
      super.copyWith((message) => updates(message as ChangePasswordReq))
          as ChangePasswordReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangePasswordReq create() => ChangePasswordReq._();
  ChangePasswordReq createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordReq> createRepeated() =>
      $pb.PbList<ChangePasswordReq>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangePasswordReq>(create);
  static ChangePasswordReq? _defaultInstance;

  @$pb.TagNumber(1)
  ChangePasswordReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(ChangePasswordReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  ChangePasswordReq_Options ensureOptions() => $_ensure(0);
}

class ChangePasswordResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChangePasswordResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  ChangePasswordResp._() : super();
  factory ChangePasswordResp() => create();
  factory ChangePasswordResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChangePasswordResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChangePasswordResp clone() => ChangePasswordResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChangePasswordResp copyWith(void Function(ChangePasswordResp) updates) =>
      super.copyWith((message) => updates(message as ChangePasswordResp))
          as ChangePasswordResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangePasswordResp create() => ChangePasswordResp._();
  ChangePasswordResp createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordResp> createRepeated() =>
      $pb.PbList<ChangePasswordResp>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangePasswordResp>(create);
  static ChangePasswordResp? _defaultInstance;
}

class ResetPasswordReq_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResetPasswordReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loginName')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newPassword')
    ..hasRequiredFields = false;

  ResetPasswordReq_Options._() : super();
  factory ResetPasswordReq_Options({
    $core.String? loginName,
    $core.String? newPassword,
  }) {
    final _result = create();
    if (loginName != null) {
      _result.loginName = loginName;
    }
    if (newPassword != null) {
      _result.newPassword = newPassword;
    }
    return _result;
  }
  factory ResetPasswordReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResetPasswordReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResetPasswordReq_Options clone() =>
      ResetPasswordReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResetPasswordReq_Options copyWith(
          void Function(ResetPasswordReq_Options) updates) =>
      super.copyWith((message) => updates(message as ResetPasswordReq_Options))
          as ResetPasswordReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordReq_Options create() => ResetPasswordReq_Options._();
  ResetPasswordReq_Options createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordReq_Options> createRepeated() =>
      $pb.PbList<ResetPasswordReq_Options>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResetPasswordReq_Options>(create);
  static ResetPasswordReq_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get loginName => $_getSZ(0);
  @$pb.TagNumber(1)
  set loginName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLoginName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLoginName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set newPassword($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNewPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPassword() => clearField(2);
}

class ResetPasswordReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResetPasswordReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..aOM<ResetPasswordReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: ResetPasswordReq_Options.create)
    ..hasRequiredFields = false;

  ResetPasswordReq._() : super();
  factory ResetPasswordReq({
    ResetPasswordReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory ResetPasswordReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResetPasswordReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResetPasswordReq clone() => ResetPasswordReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResetPasswordReq copyWith(void Function(ResetPasswordReq) updates) =>
      super.copyWith((message) => updates(message as ResetPasswordReq))
          as ResetPasswordReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordReq create() => ResetPasswordReq._();
  ResetPasswordReq createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordReq> createRepeated() =>
      $pb.PbList<ResetPasswordReq>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResetPasswordReq>(create);
  static ResetPasswordReq? _defaultInstance;

  @$pb.TagNumber(1)
  ResetPasswordReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(ResetPasswordReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  ResetPasswordReq_Options ensureOptions() => $_ensure(0);
}

class ResetPasswordResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResetPasswordResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.users'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  ResetPasswordResp._() : super();
  factory ResetPasswordResp() => create();
  factory ResetPasswordResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResetPasswordResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResetPasswordResp clone() => ResetPasswordResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResetPasswordResp copyWith(void Function(ResetPasswordResp) updates) =>
      super.copyWith((message) => updates(message as ResetPasswordResp))
          as ResetPasswordResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordResp create() => ResetPasswordResp._();
  ResetPasswordResp createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordResp> createRepeated() =>
      $pb.PbList<ResetPasswordResp>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResetPasswordResp>(create);
  static ResetPasswordResp? _defaultInstance;
}
