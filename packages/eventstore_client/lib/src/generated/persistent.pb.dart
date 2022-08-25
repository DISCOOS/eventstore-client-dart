///
//  Generated code. Do not modify.
//  source: persistent.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'shared.pb.dart' as $1;

import 'persistent.pbenum.dart';

export 'persistent.pbenum.dart';

enum ReadReq_Options_UUIDOption_Content { structured, string, notSet }

class ReadReq_Options_UUIDOption extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadReq_Options_UUIDOption_Content>
      _ReadReq_Options_UUIDOption_ContentByTag = {
    1: ReadReq_Options_UUIDOption_Content.structured,
    2: ReadReq_Options_UUIDOption_Content.string,
    0: ReadReq_Options_UUIDOption_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options.UUIDOption',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.Empty>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'structured',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'string',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  ReadReq_Options_UUIDOption._() : super();
  factory ReadReq_Options_UUIDOption({
    $1.Empty? structured,
    $1.Empty? string,
  }) {
    final _result = create();
    if (structured != null) {
      _result.structured = structured;
    }
    if (string != null) {
      _result.string = string;
    }
    return _result;
  }
  factory ReadReq_Options_UUIDOption.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Options_UUIDOption.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Options_UUIDOption clone() =>
      ReadReq_Options_UUIDOption()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Options_UUIDOption copyWith(
          void Function(ReadReq_Options_UUIDOption) updates) =>
      super.copyWith(
              (message) => updates(message as ReadReq_Options_UUIDOption))
          as ReadReq_Options_UUIDOption; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_UUIDOption create() => ReadReq_Options_UUIDOption._();
  ReadReq_Options_UUIDOption createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Options_UUIDOption> createRepeated() =>
      $pb.PbList<ReadReq_Options_UUIDOption>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_UUIDOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadReq_Options_UUIDOption>(create);
  static ReadReq_Options_UUIDOption? _defaultInstance;

  ReadReq_Options_UUIDOption_Content whichContent() =>
      _ReadReq_Options_UUIDOption_ContentByTag[$_whichOneof(0)]!;
  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Empty get structured => $_getN(0);
  @$pb.TagNumber(1)
  set structured($1.Empty v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStructured() => $_has(0);
  @$pb.TagNumber(1)
  void clearStructured() => clearField(1);
  @$pb.TagNumber(1)
  $1.Empty ensureStructured() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Empty get string => $_getN(1);
  @$pb.TagNumber(2)
  set string($1.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasString() => $_has(1);
  @$pb.TagNumber(2)
  void clearString() => clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureString() => $_ensure(1);
}

enum ReadReq_Options_StreamOption { streamIdentifier, all, notSet }

class ReadReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadReq_Options_StreamOption>
      _ReadReq_Options_StreamOptionByTag = {
    1: ReadReq_Options_StreamOption.streamIdentifier,
    5: ReadReq_Options_StreamOption.all,
    0: ReadReq_Options_StreamOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 5])
    ..aOM<$1.StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bufferSize',
        $pb.PbFieldType.O3)
    ..aOM<ReadReq_Options_UUIDOption>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuidOption',
        subBuilder: ReadReq_Options_UUIDOption.create)
    ..aOM<$1.Empty>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'all',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  ReadReq_Options._() : super();
  factory ReadReq_Options({
    $1.StreamIdentifier? streamIdentifier,
    $core.String? groupName,
    $core.int? bufferSize,
    ReadReq_Options_UUIDOption? uuidOption,
    $1.Empty? all,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    if (bufferSize != null) {
      _result.bufferSize = bufferSize;
    }
    if (uuidOption != null) {
      _result.uuidOption = uuidOption;
    }
    if (all != null) {
      _result.all = all;
    }
    return _result;
  }
  factory ReadReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Options clone() => ReadReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Options copyWith(void Function(ReadReq_Options) updates) =>
      super.copyWith((message) => updates(message as ReadReq_Options))
          as ReadReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options create() => ReadReq_Options._();
  ReadReq_Options createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Options> createRepeated() =>
      $pb.PbList<ReadReq_Options>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadReq_Options>(create);
  static ReadReq_Options? _defaultInstance;

  ReadReq_Options_StreamOption whichStreamOption() =>
      _ReadReq_Options_StreamOptionByTag[$_whichOneof(0)]!;
  void clearStreamOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.StreamIdentifier get streamIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get bufferSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set bufferSize($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBufferSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearBufferSize() => clearField(3);

  @$pb.TagNumber(4)
  ReadReq_Options_UUIDOption get uuidOption => $_getN(3);
  @$pb.TagNumber(4)
  set uuidOption(ReadReq_Options_UUIDOption v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUuidOption() => $_has(3);
  @$pb.TagNumber(4)
  void clearUuidOption() => clearField(4);
  @$pb.TagNumber(4)
  ReadReq_Options_UUIDOption ensureUuidOption() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Empty get all => $_getN(4);
  @$pb.TagNumber(5)
  set all($1.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAll() => $_has(4);
  @$pb.TagNumber(5)
  void clearAll() => clearField(5);
  @$pb.TagNumber(5)
  $1.Empty ensureAll() => $_ensure(4);
}

class ReadReq_Ack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Ack',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OY)
    ..pc<$1.UUID>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ids',
        $pb.PbFieldType.PM,
        subBuilder: $1.UUID.create)
    ..hasRequiredFields = false;

  ReadReq_Ack._() : super();
  factory ReadReq_Ack({
    $core.List<$core.int>? id,
    $core.Iterable<$1.UUID>? ids,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    return _result;
  }
  factory ReadReq_Ack.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Ack.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Ack clone() => ReadReq_Ack()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Ack copyWith(void Function(ReadReq_Ack) updates) =>
      super.copyWith((message) => updates(message as ReadReq_Ack))
          as ReadReq_Ack; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Ack create() => ReadReq_Ack._();
  ReadReq_Ack createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Ack> createRepeated() => $pb.PbList<ReadReq_Ack>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Ack getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadReq_Ack>(create);
  static ReadReq_Ack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$1.UUID> get ids => $_getList(1);
}

class ReadReq_Nack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Nack',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OY)
    ..pc<$1.UUID>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ids',
        $pb.PbFieldType.PM,
        subBuilder: $1.UUID.create)
    ..e<ReadReq_Nack_Action>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'action',
        $pb.PbFieldType.OE,
        defaultOrMaker: ReadReq_Nack_Action.Unknown,
        valueOf: ReadReq_Nack_Action.valueOf,
        enumValues: ReadReq_Nack_Action.values)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reason')
    ..hasRequiredFields = false;

  ReadReq_Nack._() : super();
  factory ReadReq_Nack({
    $core.List<$core.int>? id,
    $core.Iterable<$1.UUID>? ids,
    ReadReq_Nack_Action? action,
    $core.String? reason,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    if (action != null) {
      _result.action = action;
    }
    if (reason != null) {
      _result.reason = reason;
    }
    return _result;
  }
  factory ReadReq_Nack.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Nack.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Nack clone() => ReadReq_Nack()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Nack copyWith(void Function(ReadReq_Nack) updates) =>
      super.copyWith((message) => updates(message as ReadReq_Nack))
          as ReadReq_Nack; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Nack create() => ReadReq_Nack._();
  ReadReq_Nack createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Nack> createRepeated() =>
      $pb.PbList<ReadReq_Nack>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Nack getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadReq_Nack>(create);
  static ReadReq_Nack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$1.UUID> get ids => $_getList(1);

  @$pb.TagNumber(3)
  ReadReq_Nack_Action get action => $_getN(2);
  @$pb.TagNumber(3)
  set action(ReadReq_Nack_Action v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearAction() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get reason => $_getSZ(3);
  @$pb.TagNumber(4)
  set reason($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearReason() => clearField(4);
}

enum ReadReq_Content { options, ack, nack, notSet }

class ReadReq extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadReq_Content> _ReadReq_ContentByTag = {
    1: ReadReq_Content.options,
    2: ReadReq_Content.ack,
    3: ReadReq_Content.nack,
    0: ReadReq_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<ReadReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: ReadReq_Options.create)
    ..aOM<ReadReq_Ack>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ack',
        subBuilder: ReadReq_Ack.create)
    ..aOM<ReadReq_Nack>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nack',
        subBuilder: ReadReq_Nack.create)
    ..hasRequiredFields = false;

  ReadReq._() : super();
  factory ReadReq({
    ReadReq_Options? options,
    ReadReq_Ack? ack,
    ReadReq_Nack? nack,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    if (ack != null) {
      _result.ack = ack;
    }
    if (nack != null) {
      _result.nack = nack;
    }
    return _result;
  }
  factory ReadReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq clone() => ReadReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq copyWith(void Function(ReadReq) updates) =>
      super.copyWith((message) => updates(message as ReadReq))
          as ReadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq create() => ReadReq._();
  ReadReq createEmptyInstance() => create();
  static $pb.PbList<ReadReq> createRepeated() => $pb.PbList<ReadReq>();
  @$core.pragma('dart2js:noInline')
  static ReadReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadReq>(create);
  static ReadReq? _defaultInstance;

  ReadReq_Content whichContent() => _ReadReq_ContentByTag[$_whichOneof(0)]!;
  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ReadReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(ReadReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  ReadReq_Options ensureOptions() => $_ensure(0);

  @$pb.TagNumber(2)
  ReadReq_Ack get ack => $_getN(1);
  @$pb.TagNumber(2)
  set ack(ReadReq_Ack v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAck() => $_has(1);
  @$pb.TagNumber(2)
  void clearAck() => clearField(2);
  @$pb.TagNumber(2)
  ReadReq_Ack ensureAck() => $_ensure(1);

  @$pb.TagNumber(3)
  ReadReq_Nack get nack => $_getN(2);
  @$pb.TagNumber(3)
  set nack(ReadReq_Nack v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNack() => $_has(2);
  @$pb.TagNumber(3)
  void clearNack() => clearField(3);
  @$pb.TagNumber(3)
  ReadReq_Nack ensureNack() => $_ensure(2);
}

class ReadResp_ReadEvent_RecordedEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp.ReadEvent.RecordedEvent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        subBuilder: $1.UUID.create)
    ..aOM<$1.StreamIdentifier>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..a<$fixnum.Int64>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamRevision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'preparePosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commitPosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..m<$core.String, $core.String>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'metadata',
        entryClassName: 'ReadResp.ReadEvent.RecordedEvent.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName(
            'event_store.client.persistent_subscriptions'))
    ..a<$core.List<$core.int>>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'customMetadata',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  ReadResp_ReadEvent_RecordedEvent._() : super();
  factory ReadResp_ReadEvent_RecordedEvent({
    $1.UUID? id,
    $1.StreamIdentifier? streamIdentifier,
    $fixnum.Int64? streamRevision,
    $fixnum.Int64? preparePosition,
    $fixnum.Int64? commitPosition,
    $core.Map<$core.String, $core.String>? metadata,
    $core.List<$core.int>? customMetadata,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (streamRevision != null) {
      _result.streamRevision = streamRevision;
    }
    if (preparePosition != null) {
      _result.preparePosition = preparePosition;
    }
    if (commitPosition != null) {
      _result.commitPosition = commitPosition;
    }
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    if (customMetadata != null) {
      _result.customMetadata = customMetadata;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ReadResp_ReadEvent_RecordedEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadResp_ReadEvent_RecordedEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadResp_ReadEvent_RecordedEvent clone() =>
      ReadResp_ReadEvent_RecordedEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadResp_ReadEvent_RecordedEvent copyWith(
          void Function(ReadResp_ReadEvent_RecordedEvent) updates) =>
      super.copyWith(
              (message) => updates(message as ReadResp_ReadEvent_RecordedEvent))
          as ReadResp_ReadEvent_RecordedEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadResp_ReadEvent_RecordedEvent create() =>
      ReadResp_ReadEvent_RecordedEvent._();
  ReadResp_ReadEvent_RecordedEvent createEmptyInstance() => create();
  static $pb.PbList<ReadResp_ReadEvent_RecordedEvent> createRepeated() =>
      $pb.PbList<ReadResp_ReadEvent_RecordedEvent>();
  @$core.pragma('dart2js:noInline')
  static ReadResp_ReadEvent_RecordedEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadResp_ReadEvent_RecordedEvent>(
          create);
  static ReadResp_ReadEvent_RecordedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureId() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.StreamIdentifier get streamIdentifier => $_getN(1);
  @$pb.TagNumber(2)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStreamIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreamIdentifier() => clearField(2);
  @$pb.TagNumber(2)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get streamRevision => $_getI64(2);
  @$pb.TagNumber(3)
  set streamRevision($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStreamRevision() => $_has(2);
  @$pb.TagNumber(3)
  void clearStreamRevision() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get preparePosition => $_getI64(3);
  @$pb.TagNumber(4)
  set preparePosition($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPreparePosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreparePosition() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get commitPosition => $_getI64(4);
  @$pb.TagNumber(5)
  set commitPosition($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCommitPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearCommitPosition() => clearField(5);

  @$pb.TagNumber(6)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(5);

  @$pb.TagNumber(7)
  $core.List<$core.int> get customMetadata => $_getN(6);
  @$pb.TagNumber(7)
  set customMetadata($core.List<$core.int> v) {
    $_setBytes(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCustomMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearCustomMetadata() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get data => $_getN(7);
  @$pb.TagNumber(8)
  set data($core.List<$core.int> v) {
    $_setBytes(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasData() => $_has(7);
  @$pb.TagNumber(8)
  void clearData() => clearField(8);
}

enum ReadResp_ReadEvent_Position { commitPosition, noPosition, notSet }

enum ReadResp_ReadEvent_Count { retryCount, noRetryCount, notSet }

class ReadResp_ReadEvent extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadResp_ReadEvent_Position>
      _ReadResp_ReadEvent_PositionByTag = {
    3: ReadResp_ReadEvent_Position.commitPosition,
    4: ReadResp_ReadEvent_Position.noPosition,
    0: ReadResp_ReadEvent_Position.notSet
  };
  static const $core.Map<$core.int, ReadResp_ReadEvent_Count>
      _ReadResp_ReadEvent_CountByTag = {
    5: ReadResp_ReadEvent_Count.retryCount,
    6: ReadResp_ReadEvent_Count.noRetryCount,
    0: ReadResp_ReadEvent_Count.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp.ReadEvent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..oo(1, [5, 6])
    ..aOM<ReadResp_ReadEvent_RecordedEvent>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'event',
        subBuilder: ReadResp_ReadEvent_RecordedEvent.create)
    ..aOM<ReadResp_ReadEvent_RecordedEvent>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'link',
        subBuilder: ReadResp_ReadEvent_RecordedEvent.create)
    ..a<$fixnum.Int64>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commitPosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noPosition',
        subBuilder: $1.Empty.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'retryCount',
        $pb.PbFieldType.O3)
    ..aOM<$1.Empty>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noRetryCount',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  ReadResp_ReadEvent._() : super();
  factory ReadResp_ReadEvent({
    ReadResp_ReadEvent_RecordedEvent? event,
    ReadResp_ReadEvent_RecordedEvent? link,
    $fixnum.Int64? commitPosition,
    $1.Empty? noPosition,
    $core.int? retryCount,
    $1.Empty? noRetryCount,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    if (link != null) {
      _result.link = link;
    }
    if (commitPosition != null) {
      _result.commitPosition = commitPosition;
    }
    if (noPosition != null) {
      _result.noPosition = noPosition;
    }
    if (retryCount != null) {
      _result.retryCount = retryCount;
    }
    if (noRetryCount != null) {
      _result.noRetryCount = noRetryCount;
    }
    return _result;
  }
  factory ReadResp_ReadEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadResp_ReadEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadResp_ReadEvent clone() => ReadResp_ReadEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadResp_ReadEvent copyWith(void Function(ReadResp_ReadEvent) updates) =>
      super.copyWith((message) => updates(message as ReadResp_ReadEvent))
          as ReadResp_ReadEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadResp_ReadEvent create() => ReadResp_ReadEvent._();
  ReadResp_ReadEvent createEmptyInstance() => create();
  static $pb.PbList<ReadResp_ReadEvent> createRepeated() =>
      $pb.PbList<ReadResp_ReadEvent>();
  @$core.pragma('dart2js:noInline')
  static ReadResp_ReadEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadResp_ReadEvent>(create);
  static ReadResp_ReadEvent? _defaultInstance;

  ReadResp_ReadEvent_Position whichPosition() =>
      _ReadResp_ReadEvent_PositionByTag[$_whichOneof(0)]!;
  void clearPosition() => clearField($_whichOneof(0));

  ReadResp_ReadEvent_Count whichCount() =>
      _ReadResp_ReadEvent_CountByTag[$_whichOneof(1)]!;
  void clearCount() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  ReadResp_ReadEvent_RecordedEvent get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(ReadResp_ReadEvent_RecordedEvent v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  ReadResp_ReadEvent_RecordedEvent ensureEvent() => $_ensure(0);

  @$pb.TagNumber(2)
  ReadResp_ReadEvent_RecordedEvent get link => $_getN(1);
  @$pb.TagNumber(2)
  set link(ReadResp_ReadEvent_RecordedEvent v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearLink() => clearField(2);
  @$pb.TagNumber(2)
  ReadResp_ReadEvent_RecordedEvent ensureLink() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get commitPosition => $_getI64(2);
  @$pb.TagNumber(3)
  set commitPosition($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCommitPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommitPosition() => clearField(3);

  @$pb.TagNumber(4)
  $1.Empty get noPosition => $_getN(3);
  @$pb.TagNumber(4)
  set noPosition($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNoPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearNoPosition() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureNoPosition() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get retryCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set retryCount($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRetryCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearRetryCount() => clearField(5);

  @$pb.TagNumber(6)
  $1.Empty get noRetryCount => $_getN(5);
  @$pb.TagNumber(6)
  set noRetryCount($1.Empty v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNoRetryCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearNoRetryCount() => clearField(6);
  @$pb.TagNumber(6)
  $1.Empty ensureNoRetryCount() => $_ensure(5);
}

class ReadResp_SubscriptionConfirmation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp.SubscriptionConfirmation',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionId')
    ..hasRequiredFields = false;

  ReadResp_SubscriptionConfirmation._() : super();
  factory ReadResp_SubscriptionConfirmation({
    $core.String? subscriptionId,
  }) {
    final _result = create();
    if (subscriptionId != null) {
      _result.subscriptionId = subscriptionId;
    }
    return _result;
  }
  factory ReadResp_SubscriptionConfirmation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadResp_SubscriptionConfirmation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadResp_SubscriptionConfirmation clone() =>
      ReadResp_SubscriptionConfirmation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadResp_SubscriptionConfirmation copyWith(
          void Function(ReadResp_SubscriptionConfirmation) updates) =>
      super.copyWith((message) =>
              updates(message as ReadResp_SubscriptionConfirmation))
          as ReadResp_SubscriptionConfirmation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadResp_SubscriptionConfirmation create() =>
      ReadResp_SubscriptionConfirmation._();
  ReadResp_SubscriptionConfirmation createEmptyInstance() => create();
  static $pb.PbList<ReadResp_SubscriptionConfirmation> createRepeated() =>
      $pb.PbList<ReadResp_SubscriptionConfirmation>();
  @$core.pragma('dart2js:noInline')
  static ReadResp_SubscriptionConfirmation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadResp_SubscriptionConfirmation>(
          create);
  static ReadResp_SubscriptionConfirmation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subscriptionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set subscriptionId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSubscriptionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriptionId() => clearField(1);
}

enum ReadResp_Content { event, subscriptionConfirmation, notSet }

class ReadResp extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadResp_Content> _ReadResp_ContentByTag = {
    1: ReadResp_Content.event,
    2: ReadResp_Content.subscriptionConfirmation,
    0: ReadResp_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ReadResp_ReadEvent>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'event',
        subBuilder: ReadResp_ReadEvent.create)
    ..aOM<ReadResp_SubscriptionConfirmation>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionConfirmation',
        subBuilder: ReadResp_SubscriptionConfirmation.create)
    ..hasRequiredFields = false;

  ReadResp._() : super();
  factory ReadResp({
    ReadResp_ReadEvent? event,
    ReadResp_SubscriptionConfirmation? subscriptionConfirmation,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    if (subscriptionConfirmation != null) {
      _result.subscriptionConfirmation = subscriptionConfirmation;
    }
    return _result;
  }
  factory ReadResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadResp clone() => ReadResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadResp copyWith(void Function(ReadResp) updates) =>
      super.copyWith((message) => updates(message as ReadResp))
          as ReadResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadResp create() => ReadResp._();
  ReadResp createEmptyInstance() => create();
  static $pb.PbList<ReadResp> createRepeated() => $pb.PbList<ReadResp>();
  @$core.pragma('dart2js:noInline')
  static ReadResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReadResp>(create);
  static ReadResp? _defaultInstance;

  ReadResp_Content whichContent() => _ReadResp_ContentByTag[$_whichOneof(0)]!;
  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ReadResp_ReadEvent get event => $_getN(0);
  @$pb.TagNumber(1)
  set event(ReadResp_ReadEvent v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  ReadResp_ReadEvent ensureEvent() => $_ensure(0);

  @$pb.TagNumber(2)
  ReadResp_SubscriptionConfirmation get subscriptionConfirmation => $_getN(1);
  @$pb.TagNumber(2)
  set subscriptionConfirmation(ReadResp_SubscriptionConfirmation v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscriptionConfirmation() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriptionConfirmation() => clearField(2);
  @$pb.TagNumber(2)
  ReadResp_SubscriptionConfirmation ensureSubscriptionConfirmation() =>
      $_ensure(1);
}

enum CreateReq_Options_StreamOption { stream, all, notSet }

class CreateReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateReq_Options_StreamOption>
      _CreateReq_Options_StreamOptionByTag = {
    4: CreateReq_Options_StreamOption.stream,
    5: CreateReq_Options_StreamOption.all,
    0: CreateReq_Options_StreamOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [4, 5])
    ..aOM<$1.StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..aOM<CreateReq_Settings>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'settings',
        subBuilder: CreateReq_Settings.create)
    ..aOM<CreateReq_StreamOptions>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stream',
        subBuilder: CreateReq_StreamOptions.create)
    ..aOM<CreateReq_AllOptions>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'all',
        subBuilder: CreateReq_AllOptions.create)
    ..hasRequiredFields = false;

  CreateReq_Options._() : super();
  factory CreateReq_Options({
    @$core.Deprecated('This field is deprecated.')
        $1.StreamIdentifier? streamIdentifier,
    $core.String? groupName,
    CreateReq_Settings? settings,
    CreateReq_StreamOptions? stream,
    CreateReq_AllOptions? all,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      // ignore: deprecated_member_use_from_same_package
      _result.streamIdentifier = streamIdentifier;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    if (settings != null) {
      _result.settings = settings;
    }
    if (stream != null) {
      _result.stream = stream;
    }
    if (all != null) {
      _result.all = all;
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

  CreateReq_Options_StreamOption whichStreamOption() =>
      _CreateReq_Options_StreamOptionByTag[$_whichOneof(0)]!;
  void clearStreamOption() => clearField($_whichOneof(0));

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $1.StreamIdentifier get streamIdentifier => $_getN(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(1, v);
  }

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => clearField(2);

  @$pb.TagNumber(3)
  CreateReq_Settings get settings => $_getN(2);
  @$pb.TagNumber(3)
  set settings(CreateReq_Settings v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSettings() => $_has(2);
  @$pb.TagNumber(3)
  void clearSettings() => clearField(3);
  @$pb.TagNumber(3)
  CreateReq_Settings ensureSettings() => $_ensure(2);

  @$pb.TagNumber(4)
  CreateReq_StreamOptions get stream => $_getN(3);
  @$pb.TagNumber(4)
  set stream(CreateReq_StreamOptions v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStream() => $_has(3);
  @$pb.TagNumber(4)
  void clearStream() => clearField(4);
  @$pb.TagNumber(4)
  CreateReq_StreamOptions ensureStream() => $_ensure(3);

  @$pb.TagNumber(5)
  CreateReq_AllOptions get all => $_getN(4);
  @$pb.TagNumber(5)
  set all(CreateReq_AllOptions v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAll() => $_has(4);
  @$pb.TagNumber(5)
  void clearAll() => clearField(5);
  @$pb.TagNumber(5)
  CreateReq_AllOptions ensureAll() => $_ensure(4);
}

enum CreateReq_StreamOptions_RevisionOption { revision, start, end, notSet }

class CreateReq_StreamOptions extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateReq_StreamOptions_RevisionOption>
      _CreateReq_StreamOptions_RevisionOptionByTag = {
    2: CreateReq_StreamOptions_RevisionOption.revision,
    3: CreateReq_StreamOptions_RevisionOption.start,
    4: CreateReq_StreamOptions_RevisionOption.end,
    0: CreateReq_StreamOptions_RevisionOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.StreamOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOM<$1.StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'revision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Empty>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'end',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  CreateReq_StreamOptions._() : super();
  factory CreateReq_StreamOptions({
    $1.StreamIdentifier? streamIdentifier,
    $fixnum.Int64? revision,
    $1.Empty? start,
    $1.Empty? end,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (revision != null) {
      _result.revision = revision;
    }
    if (start != null) {
      _result.start = start;
    }
    if (end != null) {
      _result.end = end;
    }
    return _result;
  }
  factory CreateReq_StreamOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq_StreamOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq_StreamOptions clone() =>
      CreateReq_StreamOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq_StreamOptions copyWith(
          void Function(CreateReq_StreamOptions) updates) =>
      super.copyWith((message) => updates(message as CreateReq_StreamOptions))
          as CreateReq_StreamOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq_StreamOptions create() => CreateReq_StreamOptions._();
  CreateReq_StreamOptions createEmptyInstance() => create();
  static $pb.PbList<CreateReq_StreamOptions> createRepeated() =>
      $pb.PbList<CreateReq_StreamOptions>();
  @$core.pragma('dart2js:noInline')
  static CreateReq_StreamOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReq_StreamOptions>(create);
  static CreateReq_StreamOptions? _defaultInstance;

  CreateReq_StreamOptions_RevisionOption whichRevisionOption() =>
      _CreateReq_StreamOptions_RevisionOptionByTag[$_whichOneof(0)]!;
  void clearRevisionOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.StreamIdentifier get streamIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get revision => $_getI64(1);
  @$pb.TagNumber(2)
  set revision($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRevision() => $_has(1);
  @$pb.TagNumber(2)
  void clearRevision() => clearField(2);

  @$pb.TagNumber(3)
  $1.Empty get start => $_getN(2);
  @$pb.TagNumber(3)
  set start($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearStart() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureStart() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Empty get end => $_getN(3);
  @$pb.TagNumber(4)
  set end($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnd() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureEnd() => $_ensure(3);
}

class CreateReq_AllOptions_FilterOptions_Expression
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.AllOptions.FilterOptions.Expression',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'regex')
    ..pPS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..hasRequiredFields = false;

  CreateReq_AllOptions_FilterOptions_Expression._() : super();
  factory CreateReq_AllOptions_FilterOptions_Expression({
    $core.String? regex,
    $core.Iterable<$core.String>? prefix,
  }) {
    final _result = create();
    if (regex != null) {
      _result.regex = regex;
    }
    if (prefix != null) {
      _result.prefix.addAll(prefix);
    }
    return _result;
  }
  factory CreateReq_AllOptions_FilterOptions_Expression.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq_AllOptions_FilterOptions_Expression.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq_AllOptions_FilterOptions_Expression clone() =>
      CreateReq_AllOptions_FilterOptions_Expression()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq_AllOptions_FilterOptions_Expression copyWith(
          void Function(CreateReq_AllOptions_FilterOptions_Expression)
              updates) =>
      super.copyWith((message) =>
              updates(message as CreateReq_AllOptions_FilterOptions_Expression))
          as CreateReq_AllOptions_FilterOptions_Expression; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq_AllOptions_FilterOptions_Expression create() =>
      CreateReq_AllOptions_FilterOptions_Expression._();
  CreateReq_AllOptions_FilterOptions_Expression createEmptyInstance() =>
      create();
  static $pb.PbList<CreateReq_AllOptions_FilterOptions_Expression>
      createRepeated() =>
          $pb.PbList<CreateReq_AllOptions_FilterOptions_Expression>();
  @$core.pragma('dart2js:noInline')
  static CreateReq_AllOptions_FilterOptions_Expression getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CreateReq_AllOptions_FilterOptions_Expression>(create);
  static CreateReq_AllOptions_FilterOptions_Expression? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get regex => $_getSZ(0);
  @$pb.TagNumber(1)
  set regex($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRegex() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegex() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get prefix => $_getList(1);
}

enum CreateReq_AllOptions_FilterOptions_Filter {
  streamIdentifier,
  eventType,
  notSet
}

enum CreateReq_AllOptions_FilterOptions_Window { max, count, notSet }

class CreateReq_AllOptions_FilterOptions extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateReq_AllOptions_FilterOptions_Filter>
      _CreateReq_AllOptions_FilterOptions_FilterByTag = {
    1: CreateReq_AllOptions_FilterOptions_Filter.streamIdentifier,
    2: CreateReq_AllOptions_FilterOptions_Filter.eventType,
    0: CreateReq_AllOptions_FilterOptions_Filter.notSet
  };
  static const $core.Map<$core.int, CreateReq_AllOptions_FilterOptions_Window>
      _CreateReq_AllOptions_FilterOptions_WindowByTag = {
    3: CreateReq_AllOptions_FilterOptions_Window.max,
    4: CreateReq_AllOptions_FilterOptions_Window.count,
    0: CreateReq_AllOptions_FilterOptions_Window.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.AllOptions.FilterOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..oo(1, [3, 4])
    ..aOM<CreateReq_AllOptions_FilterOptions_Expression>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: CreateReq_AllOptions_FilterOptions_Expression.create)
    ..aOM<CreateReq_AllOptions_FilterOptions_Expression>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'eventType',
        subBuilder: CreateReq_AllOptions_FilterOptions_Expression.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'max',
        $pb.PbFieldType.OU3)
    ..aOM<$1.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        subBuilder: $1.Empty.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkpointIntervalMultiplier',
        $pb.PbFieldType.OU3,
        protoName: 'checkpointIntervalMultiplier')
    ..hasRequiredFields = false;

  CreateReq_AllOptions_FilterOptions._() : super();
  factory CreateReq_AllOptions_FilterOptions({
    CreateReq_AllOptions_FilterOptions_Expression? streamIdentifier,
    CreateReq_AllOptions_FilterOptions_Expression? eventType,
    $core.int? max,
    $1.Empty? count,
    $core.int? checkpointIntervalMultiplier,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (eventType != null) {
      _result.eventType = eventType;
    }
    if (max != null) {
      _result.max = max;
    }
    if (count != null) {
      _result.count = count;
    }
    if (checkpointIntervalMultiplier != null) {
      _result.checkpointIntervalMultiplier = checkpointIntervalMultiplier;
    }
    return _result;
  }
  factory CreateReq_AllOptions_FilterOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq_AllOptions_FilterOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq_AllOptions_FilterOptions clone() =>
      CreateReq_AllOptions_FilterOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq_AllOptions_FilterOptions copyWith(
          void Function(CreateReq_AllOptions_FilterOptions) updates) =>
      super.copyWith((message) =>
              updates(message as CreateReq_AllOptions_FilterOptions))
          as CreateReq_AllOptions_FilterOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq_AllOptions_FilterOptions create() =>
      CreateReq_AllOptions_FilterOptions._();
  CreateReq_AllOptions_FilterOptions createEmptyInstance() => create();
  static $pb.PbList<CreateReq_AllOptions_FilterOptions> createRepeated() =>
      $pb.PbList<CreateReq_AllOptions_FilterOptions>();
  @$core.pragma('dart2js:noInline')
  static CreateReq_AllOptions_FilterOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReq_AllOptions_FilterOptions>(
          create);
  static CreateReq_AllOptions_FilterOptions? _defaultInstance;

  CreateReq_AllOptions_FilterOptions_Filter whichFilter() =>
      _CreateReq_AllOptions_FilterOptions_FilterByTag[$_whichOneof(0)]!;
  void clearFilter() => clearField($_whichOneof(0));

  CreateReq_AllOptions_FilterOptions_Window whichWindow() =>
      _CreateReq_AllOptions_FilterOptions_WindowByTag[$_whichOneof(1)]!;
  void clearWindow() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  CreateReq_AllOptions_FilterOptions_Expression get streamIdentifier =>
      $_getN(0);
  @$pb.TagNumber(1)
  set streamIdentifier(CreateReq_AllOptions_FilterOptions_Expression v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  CreateReq_AllOptions_FilterOptions_Expression ensureStreamIdentifier() =>
      $_ensure(0);

  @$pb.TagNumber(2)
  CreateReq_AllOptions_FilterOptions_Expression get eventType => $_getN(1);
  @$pb.TagNumber(2)
  set eventType(CreateReq_AllOptions_FilterOptions_Expression v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEventType() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventType() => clearField(2);
  @$pb.TagNumber(2)
  CreateReq_AllOptions_FilterOptions_Expression ensureEventType() =>
      $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get max => $_getIZ(2);
  @$pb.TagNumber(3)
  set max($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMax() => $_has(2);
  @$pb.TagNumber(3)
  void clearMax() => clearField(3);

  @$pb.TagNumber(4)
  $1.Empty get count => $_getN(3);
  @$pb.TagNumber(4)
  set count($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureCount() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get checkpointIntervalMultiplier => $_getIZ(4);
  @$pb.TagNumber(5)
  set checkpointIntervalMultiplier($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCheckpointIntervalMultiplier() => $_has(4);
  @$pb.TagNumber(5)
  void clearCheckpointIntervalMultiplier() => clearField(5);
}

enum CreateReq_AllOptions_AllOption { position, start, end, notSet }

enum CreateReq_AllOptions_FilterOption { filter, noFilter, notSet }

class CreateReq_AllOptions extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateReq_AllOptions_AllOption>
      _CreateReq_AllOptions_AllOptionByTag = {
    1: CreateReq_AllOptions_AllOption.position,
    2: CreateReq_AllOptions_AllOption.start,
    3: CreateReq_AllOptions_AllOption.end,
    0: CreateReq_AllOptions_AllOption.notSet
  };
  static const $core.Map<$core.int, CreateReq_AllOptions_FilterOption>
      _CreateReq_AllOptions_FilterOptionByTag = {
    4: CreateReq_AllOptions_FilterOption.filter,
    5: CreateReq_AllOptions_FilterOption.noFilter,
    0: CreateReq_AllOptions_FilterOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.AllOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..oo(1, [4, 5])
    ..aOM<CreateReq_Position>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        subBuilder: CreateReq_Position.create)
    ..aOM<$1.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'end',
        subBuilder: $1.Empty.create)
    ..aOM<CreateReq_AllOptions_FilterOptions>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filter',
        subBuilder: CreateReq_AllOptions_FilterOptions.create)
    ..aOM<$1.Empty>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noFilter',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  CreateReq_AllOptions._() : super();
  factory CreateReq_AllOptions({
    CreateReq_Position? position,
    $1.Empty? start,
    $1.Empty? end,
    CreateReq_AllOptions_FilterOptions? filter,
    $1.Empty? noFilter,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (start != null) {
      _result.start = start;
    }
    if (end != null) {
      _result.end = end;
    }
    if (filter != null) {
      _result.filter = filter;
    }
    if (noFilter != null) {
      _result.noFilter = noFilter;
    }
    return _result;
  }
  factory CreateReq_AllOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq_AllOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq_AllOptions clone() =>
      CreateReq_AllOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq_AllOptions copyWith(void Function(CreateReq_AllOptions) updates) =>
      super.copyWith((message) => updates(message as CreateReq_AllOptions))
          as CreateReq_AllOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq_AllOptions create() => CreateReq_AllOptions._();
  CreateReq_AllOptions createEmptyInstance() => create();
  static $pb.PbList<CreateReq_AllOptions> createRepeated() =>
      $pb.PbList<CreateReq_AllOptions>();
  @$core.pragma('dart2js:noInline')
  static CreateReq_AllOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReq_AllOptions>(create);
  static CreateReq_AllOptions? _defaultInstance;

  CreateReq_AllOptions_AllOption whichAllOption() =>
      _CreateReq_AllOptions_AllOptionByTag[$_whichOneof(0)]!;
  void clearAllOption() => clearField($_whichOneof(0));

  CreateReq_AllOptions_FilterOption whichFilterOption() =>
      _CreateReq_AllOptions_FilterOptionByTag[$_whichOneof(1)]!;
  void clearFilterOption() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  CreateReq_Position get position => $_getN(0);
  @$pb.TagNumber(1)
  set position(CreateReq_Position v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);
  @$pb.TagNumber(1)
  CreateReq_Position ensurePosition() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Empty get start => $_getN(1);
  @$pb.TagNumber(2)
  set start($1.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearStart() => clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureStart() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Empty get end => $_getN(2);
  @$pb.TagNumber(3)
  set end($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnd() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureEnd() => $_ensure(2);

  @$pb.TagNumber(4)
  CreateReq_AllOptions_FilterOptions get filter => $_getN(3);
  @$pb.TagNumber(4)
  set filter(CreateReq_AllOptions_FilterOptions v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilter() => clearField(4);
  @$pb.TagNumber(4)
  CreateReq_AllOptions_FilterOptions ensureFilter() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Empty get noFilter => $_getN(4);
  @$pb.TagNumber(5)
  set noFilter($1.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNoFilter() => $_has(4);
  @$pb.TagNumber(5)
  void clearNoFilter() => clearField(5);
  @$pb.TagNumber(5)
  $1.Empty ensureNoFilter() => $_ensure(4);
}

class CreateReq_Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.Position',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commitPosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'preparePosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  CreateReq_Position._() : super();
  factory CreateReq_Position({
    $fixnum.Int64? commitPosition,
    $fixnum.Int64? preparePosition,
  }) {
    final _result = create();
    if (commitPosition != null) {
      _result.commitPosition = commitPosition;
    }
    if (preparePosition != null) {
      _result.preparePosition = preparePosition;
    }
    return _result;
  }
  factory CreateReq_Position.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq_Position.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq_Position clone() => CreateReq_Position()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq_Position copyWith(void Function(CreateReq_Position) updates) =>
      super.copyWith((message) => updates(message as CreateReq_Position))
          as CreateReq_Position; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq_Position create() => CreateReq_Position._();
  CreateReq_Position createEmptyInstance() => create();
  static $pb.PbList<CreateReq_Position> createRepeated() =>
      $pb.PbList<CreateReq_Position>();
  @$core.pragma('dart2js:noInline')
  static CreateReq_Position getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReq_Position>(create);
  static CreateReq_Position? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get commitPosition => $_getI64(0);
  @$pb.TagNumber(1)
  set commitPosition($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommitPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommitPosition() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get preparePosition => $_getI64(1);
  @$pb.TagNumber(2)
  set preparePosition($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPreparePosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreparePosition() => clearField(2);
}

enum CreateReq_Settings_MessageTimeout {
  messageTimeoutTicks,
  messageTimeoutMs,
  notSet
}

enum CreateReq_Settings_CheckpointAfter {
  checkpointAfterTicks,
  checkpointAfterMs,
  notSet
}

class CreateReq_Settings extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateReq_Settings_MessageTimeout>
      _CreateReq_Settings_MessageTimeoutByTag = {
    4: CreateReq_Settings_MessageTimeout.messageTimeoutTicks,
    14: CreateReq_Settings_MessageTimeout.messageTimeoutMs,
    0: CreateReq_Settings_MessageTimeout.notSet
  };
  static const $core.Map<$core.int, CreateReq_Settings_CheckpointAfter>
      _CreateReq_Settings_CheckpointAfterByTag = {
    6: CreateReq_Settings_CheckpointAfter.checkpointAfterTicks,
    15: CreateReq_Settings_CheckpointAfter.checkpointAfterMs,
    0: CreateReq_Settings_CheckpointAfter.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq.Settings',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [4, 14])
    ..oo(1, [6, 15])
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resolveLinks')
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'revision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extraStatistics')
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'messageTimeoutTicks')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxRetryCount',
        $pb.PbFieldType.O3)
    ..aInt64(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkpointAfterTicks')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'minCheckpointCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxCheckpointCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxSubscriberCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveBufferSize',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'readBatchSize',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'historyBufferSize',
        $pb.PbFieldType.O3)
    ..e<CreateReq_ConsumerStrategy>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'namedConsumerStrategy',
        $pb.PbFieldType.OE,
        defaultOrMaker: CreateReq_ConsumerStrategy.DispatchToSingle,
        valueOf: CreateReq_ConsumerStrategy.valueOf,
        enumValues: CreateReq_ConsumerStrategy.values)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'messageTimeoutMs',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkpointAfterMs',
        $pb.PbFieldType.O3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'consumerStrategy')
    ..hasRequiredFields = false;

  CreateReq_Settings._() : super();
  factory CreateReq_Settings({
    $core.bool? resolveLinks,
    @$core.Deprecated('This field is deprecated.') $fixnum.Int64? revision,
    $core.bool? extraStatistics,
    $fixnum.Int64? messageTimeoutTicks,
    $core.int? maxRetryCount,
    $fixnum.Int64? checkpointAfterTicks,
    $core.int? minCheckpointCount,
    $core.int? maxCheckpointCount,
    $core.int? maxSubscriberCount,
    $core.int? liveBufferSize,
    $core.int? readBatchSize,
    $core.int? historyBufferSize,
    @$core.Deprecated('This field is deprecated.')
        CreateReq_ConsumerStrategy? namedConsumerStrategy,
    $core.int? messageTimeoutMs,
    $core.int? checkpointAfterMs,
    $core.String? consumerStrategy,
  }) {
    final _result = create();
    if (resolveLinks != null) {
      _result.resolveLinks = resolveLinks;
    }
    if (revision != null) {
      // ignore: deprecated_member_use_from_same_package
      _result.revision = revision;
    }
    if (extraStatistics != null) {
      _result.extraStatistics = extraStatistics;
    }
    if (messageTimeoutTicks != null) {
      _result.messageTimeoutTicks = messageTimeoutTicks;
    }
    if (maxRetryCount != null) {
      _result.maxRetryCount = maxRetryCount;
    }
    if (checkpointAfterTicks != null) {
      _result.checkpointAfterTicks = checkpointAfterTicks;
    }
    if (minCheckpointCount != null) {
      _result.minCheckpointCount = minCheckpointCount;
    }
    if (maxCheckpointCount != null) {
      _result.maxCheckpointCount = maxCheckpointCount;
    }
    if (maxSubscriberCount != null) {
      _result.maxSubscriberCount = maxSubscriberCount;
    }
    if (liveBufferSize != null) {
      _result.liveBufferSize = liveBufferSize;
    }
    if (readBatchSize != null) {
      _result.readBatchSize = readBatchSize;
    }
    if (historyBufferSize != null) {
      _result.historyBufferSize = historyBufferSize;
    }
    if (namedConsumerStrategy != null) {
      // ignore: deprecated_member_use_from_same_package
      _result.namedConsumerStrategy = namedConsumerStrategy;
    }
    if (messageTimeoutMs != null) {
      _result.messageTimeoutMs = messageTimeoutMs;
    }
    if (checkpointAfterMs != null) {
      _result.checkpointAfterMs = checkpointAfterMs;
    }
    if (consumerStrategy != null) {
      _result.consumerStrategy = consumerStrategy;
    }
    return _result;
  }
  factory CreateReq_Settings.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateReq_Settings.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateReq_Settings clone() => CreateReq_Settings()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateReq_Settings copyWith(void Function(CreateReq_Settings) updates) =>
      super.copyWith((message) => updates(message as CreateReq_Settings))
          as CreateReq_Settings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReq_Settings create() => CreateReq_Settings._();
  CreateReq_Settings createEmptyInstance() => create();
  static $pb.PbList<CreateReq_Settings> createRepeated() =>
      $pb.PbList<CreateReq_Settings>();
  @$core.pragma('dart2js:noInline')
  static CreateReq_Settings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReq_Settings>(create);
  static CreateReq_Settings? _defaultInstance;

  CreateReq_Settings_MessageTimeout whichMessageTimeout() =>
      _CreateReq_Settings_MessageTimeoutByTag[$_whichOneof(0)]!;
  void clearMessageTimeout() => clearField($_whichOneof(0));

  CreateReq_Settings_CheckpointAfter whichCheckpointAfter() =>
      _CreateReq_Settings_CheckpointAfterByTag[$_whichOneof(1)]!;
  void clearCheckpointAfter() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.bool get resolveLinks => $_getBF(0);
  @$pb.TagNumber(1)
  set resolveLinks($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResolveLinks() => $_has(0);
  @$pb.TagNumber(1)
  void clearResolveLinks() => clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $fixnum.Int64 get revision => $_getI64(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set revision($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasRevision() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearRevision() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get extraStatistics => $_getBF(2);
  @$pb.TagNumber(3)
  set extraStatistics($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExtraStatistics() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtraStatistics() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get messageTimeoutTicks => $_getI64(3);
  @$pb.TagNumber(4)
  set messageTimeoutTicks($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMessageTimeoutTicks() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageTimeoutTicks() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxRetryCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxRetryCount($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMaxRetryCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxRetryCount() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get checkpointAfterTicks => $_getI64(5);
  @$pb.TagNumber(6)
  set checkpointAfterTicks($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCheckpointAfterTicks() => $_has(5);
  @$pb.TagNumber(6)
  void clearCheckpointAfterTicks() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get minCheckpointCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set minCheckpointCount($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMinCheckpointCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinCheckpointCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxCheckpointCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxCheckpointCount($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMaxCheckpointCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxCheckpointCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get maxSubscriberCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set maxSubscriberCount($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMaxSubscriberCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearMaxSubscriberCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get liveBufferSize => $_getIZ(9);
  @$pb.TagNumber(10)
  set liveBufferSize($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLiveBufferSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearLiveBufferSize() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get readBatchSize => $_getIZ(10);
  @$pb.TagNumber(11)
  set readBatchSize($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasReadBatchSize() => $_has(10);
  @$pb.TagNumber(11)
  void clearReadBatchSize() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get historyBufferSize => $_getIZ(11);
  @$pb.TagNumber(12)
  set historyBufferSize($core.int v) {
    $_setSignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasHistoryBufferSize() => $_has(11);
  @$pb.TagNumber(12)
  void clearHistoryBufferSize() => clearField(12);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  CreateReq_ConsumerStrategy get namedConsumerStrategy => $_getN(12);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  set namedConsumerStrategy(CreateReq_ConsumerStrategy v) {
    setField(13, v);
  }

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  $core.bool hasNamedConsumerStrategy() => $_has(12);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  void clearNamedConsumerStrategy() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get messageTimeoutMs => $_getIZ(13);
  @$pb.TagNumber(14)
  set messageTimeoutMs($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasMessageTimeoutMs() => $_has(13);
  @$pb.TagNumber(14)
  void clearMessageTimeoutMs() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get checkpointAfterMs => $_getIZ(14);
  @$pb.TagNumber(15)
  set checkpointAfterMs($core.int v) {
    $_setSignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasCheckpointAfterMs() => $_has(14);
  @$pb.TagNumber(15)
  void clearCheckpointAfterMs() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get consumerStrategy => $_getSZ(15);
  @$pb.TagNumber(16)
  set consumerStrategy($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasConsumerStrategy() => $_has(15);
  @$pb.TagNumber(16)
  void clearConsumerStrategy() => clearField(16);
}

class CreateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
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
              : 'event_store.client.persistent_subscriptions'),
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

enum UpdateReq_Options_StreamOption { stream, all, notSet }

class UpdateReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UpdateReq_Options_StreamOption>
      _UpdateReq_Options_StreamOptionByTag = {
    4: UpdateReq_Options_StreamOption.stream,
    5: UpdateReq_Options_StreamOption.all,
    0: UpdateReq_Options_StreamOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [4, 5])
    ..aOM<$1.StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..aOM<UpdateReq_Settings>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'settings',
        subBuilder: UpdateReq_Settings.create)
    ..aOM<UpdateReq_StreamOptions>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stream',
        subBuilder: UpdateReq_StreamOptions.create)
    ..aOM<UpdateReq_AllOptions>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'all',
        subBuilder: UpdateReq_AllOptions.create)
    ..hasRequiredFields = false;

  UpdateReq_Options._() : super();
  factory UpdateReq_Options({
    @$core.Deprecated('This field is deprecated.')
        $1.StreamIdentifier? streamIdentifier,
    $core.String? groupName,
    UpdateReq_Settings? settings,
    UpdateReq_StreamOptions? stream,
    UpdateReq_AllOptions? all,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      // ignore: deprecated_member_use_from_same_package
      _result.streamIdentifier = streamIdentifier;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    if (settings != null) {
      _result.settings = settings;
    }
    if (stream != null) {
      _result.stream = stream;
    }
    if (all != null) {
      _result.all = all;
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

  UpdateReq_Options_StreamOption whichStreamOption() =>
      _UpdateReq_Options_StreamOptionByTag[$_whichOneof(0)]!;
  void clearStreamOption() => clearField($_whichOneof(0));

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $1.StreamIdentifier get streamIdentifier => $_getN(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(1, v);
  }

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => clearField(2);

  @$pb.TagNumber(3)
  UpdateReq_Settings get settings => $_getN(2);
  @$pb.TagNumber(3)
  set settings(UpdateReq_Settings v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSettings() => $_has(2);
  @$pb.TagNumber(3)
  void clearSettings() => clearField(3);
  @$pb.TagNumber(3)
  UpdateReq_Settings ensureSettings() => $_ensure(2);

  @$pb.TagNumber(4)
  UpdateReq_StreamOptions get stream => $_getN(3);
  @$pb.TagNumber(4)
  set stream(UpdateReq_StreamOptions v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStream() => $_has(3);
  @$pb.TagNumber(4)
  void clearStream() => clearField(4);
  @$pb.TagNumber(4)
  UpdateReq_StreamOptions ensureStream() => $_ensure(3);

  @$pb.TagNumber(5)
  UpdateReq_AllOptions get all => $_getN(4);
  @$pb.TagNumber(5)
  set all(UpdateReq_AllOptions v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAll() => $_has(4);
  @$pb.TagNumber(5)
  void clearAll() => clearField(5);
  @$pb.TagNumber(5)
  UpdateReq_AllOptions ensureAll() => $_ensure(4);
}

enum UpdateReq_StreamOptions_RevisionOption { revision, start, end, notSet }

class UpdateReq_StreamOptions extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UpdateReq_StreamOptions_RevisionOption>
      _UpdateReq_StreamOptions_RevisionOptionByTag = {
    2: UpdateReq_StreamOptions_RevisionOption.revision,
    3: UpdateReq_StreamOptions_RevisionOption.start,
    4: UpdateReq_StreamOptions_RevisionOption.end,
    0: UpdateReq_StreamOptions_RevisionOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq.StreamOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOM<$1.StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'revision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Empty>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'end',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  UpdateReq_StreamOptions._() : super();
  factory UpdateReq_StreamOptions({
    $1.StreamIdentifier? streamIdentifier,
    $fixnum.Int64? revision,
    $1.Empty? start,
    $1.Empty? end,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (revision != null) {
      _result.revision = revision;
    }
    if (start != null) {
      _result.start = start;
    }
    if (end != null) {
      _result.end = end;
    }
    return _result;
  }
  factory UpdateReq_StreamOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateReq_StreamOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateReq_StreamOptions clone() =>
      UpdateReq_StreamOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateReq_StreamOptions copyWith(
          void Function(UpdateReq_StreamOptions) updates) =>
      super.copyWith((message) => updates(message as UpdateReq_StreamOptions))
          as UpdateReq_StreamOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateReq_StreamOptions create() => UpdateReq_StreamOptions._();
  UpdateReq_StreamOptions createEmptyInstance() => create();
  static $pb.PbList<UpdateReq_StreamOptions> createRepeated() =>
      $pb.PbList<UpdateReq_StreamOptions>();
  @$core.pragma('dart2js:noInline')
  static UpdateReq_StreamOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateReq_StreamOptions>(create);
  static UpdateReq_StreamOptions? _defaultInstance;

  UpdateReq_StreamOptions_RevisionOption whichRevisionOption() =>
      _UpdateReq_StreamOptions_RevisionOptionByTag[$_whichOneof(0)]!;
  void clearRevisionOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.StreamIdentifier get streamIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get revision => $_getI64(1);
  @$pb.TagNumber(2)
  set revision($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRevision() => $_has(1);
  @$pb.TagNumber(2)
  void clearRevision() => clearField(2);

  @$pb.TagNumber(3)
  $1.Empty get start => $_getN(2);
  @$pb.TagNumber(3)
  set start($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearStart() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureStart() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Empty get end => $_getN(3);
  @$pb.TagNumber(4)
  set end($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnd() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureEnd() => $_ensure(3);
}

enum UpdateReq_AllOptions_AllOption { position, start, end, notSet }

class UpdateReq_AllOptions extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UpdateReq_AllOptions_AllOption>
      _UpdateReq_AllOptions_AllOptionByTag = {
    1: UpdateReq_AllOptions_AllOption.position,
    2: UpdateReq_AllOptions_AllOption.start,
    3: UpdateReq_AllOptions_AllOption.end,
    0: UpdateReq_AllOptions_AllOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq.AllOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<UpdateReq_Position>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        subBuilder: UpdateReq_Position.create)
    ..aOM<$1.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'end',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  UpdateReq_AllOptions._() : super();
  factory UpdateReq_AllOptions({
    UpdateReq_Position? position,
    $1.Empty? start,
    $1.Empty? end,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (start != null) {
      _result.start = start;
    }
    if (end != null) {
      _result.end = end;
    }
    return _result;
  }
  factory UpdateReq_AllOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateReq_AllOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateReq_AllOptions clone() =>
      UpdateReq_AllOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateReq_AllOptions copyWith(void Function(UpdateReq_AllOptions) updates) =>
      super.copyWith((message) => updates(message as UpdateReq_AllOptions))
          as UpdateReq_AllOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateReq_AllOptions create() => UpdateReq_AllOptions._();
  UpdateReq_AllOptions createEmptyInstance() => create();
  static $pb.PbList<UpdateReq_AllOptions> createRepeated() =>
      $pb.PbList<UpdateReq_AllOptions>();
  @$core.pragma('dart2js:noInline')
  static UpdateReq_AllOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateReq_AllOptions>(create);
  static UpdateReq_AllOptions? _defaultInstance;

  UpdateReq_AllOptions_AllOption whichAllOption() =>
      _UpdateReq_AllOptions_AllOptionByTag[$_whichOneof(0)]!;
  void clearAllOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UpdateReq_Position get position => $_getN(0);
  @$pb.TagNumber(1)
  set position(UpdateReq_Position v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);
  @$pb.TagNumber(1)
  UpdateReq_Position ensurePosition() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Empty get start => $_getN(1);
  @$pb.TagNumber(2)
  set start($1.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearStart() => clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureStart() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Empty get end => $_getN(2);
  @$pb.TagNumber(3)
  set end($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnd() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureEnd() => $_ensure(2);
}

class UpdateReq_Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq.Position',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commitPosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'preparePosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  UpdateReq_Position._() : super();
  factory UpdateReq_Position({
    $fixnum.Int64? commitPosition,
    $fixnum.Int64? preparePosition,
  }) {
    final _result = create();
    if (commitPosition != null) {
      _result.commitPosition = commitPosition;
    }
    if (preparePosition != null) {
      _result.preparePosition = preparePosition;
    }
    return _result;
  }
  factory UpdateReq_Position.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateReq_Position.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateReq_Position clone() => UpdateReq_Position()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateReq_Position copyWith(void Function(UpdateReq_Position) updates) =>
      super.copyWith((message) => updates(message as UpdateReq_Position))
          as UpdateReq_Position; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateReq_Position create() => UpdateReq_Position._();
  UpdateReq_Position createEmptyInstance() => create();
  static $pb.PbList<UpdateReq_Position> createRepeated() =>
      $pb.PbList<UpdateReq_Position>();
  @$core.pragma('dart2js:noInline')
  static UpdateReq_Position getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateReq_Position>(create);
  static UpdateReq_Position? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get commitPosition => $_getI64(0);
  @$pb.TagNumber(1)
  set commitPosition($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommitPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommitPosition() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get preparePosition => $_getI64(1);
  @$pb.TagNumber(2)
  set preparePosition($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPreparePosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreparePosition() => clearField(2);
}

enum UpdateReq_Settings_MessageTimeout {
  messageTimeoutTicks,
  messageTimeoutMs,
  notSet
}

enum UpdateReq_Settings_CheckpointAfter {
  checkpointAfterTicks,
  checkpointAfterMs,
  notSet
}

class UpdateReq_Settings extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UpdateReq_Settings_MessageTimeout>
      _UpdateReq_Settings_MessageTimeoutByTag = {
    4: UpdateReq_Settings_MessageTimeout.messageTimeoutTicks,
    14: UpdateReq_Settings_MessageTimeout.messageTimeoutMs,
    0: UpdateReq_Settings_MessageTimeout.notSet
  };
  static const $core.Map<$core.int, UpdateReq_Settings_CheckpointAfter>
      _UpdateReq_Settings_CheckpointAfterByTag = {
    6: UpdateReq_Settings_CheckpointAfter.checkpointAfterTicks,
    15: UpdateReq_Settings_CheckpointAfter.checkpointAfterMs,
    0: UpdateReq_Settings_CheckpointAfter.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq.Settings',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [4, 14])
    ..oo(1, [6, 15])
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resolveLinks')
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'revision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extraStatistics')
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'messageTimeoutTicks')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxRetryCount',
        $pb.PbFieldType.O3)
    ..aInt64(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkpointAfterTicks')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'minCheckpointCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxCheckpointCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxSubscriberCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveBufferSize',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'readBatchSize',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'historyBufferSize',
        $pb.PbFieldType.O3)
    ..e<UpdateReq_ConsumerStrategy>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'namedConsumerStrategy',
        $pb.PbFieldType.OE,
        defaultOrMaker: UpdateReq_ConsumerStrategy.DispatchToSingle,
        valueOf: UpdateReq_ConsumerStrategy.valueOf,
        enumValues: UpdateReq_ConsumerStrategy.values)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'messageTimeoutMs',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkpointAfterMs',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  UpdateReq_Settings._() : super();
  factory UpdateReq_Settings({
    $core.bool? resolveLinks,
    @$core.Deprecated('This field is deprecated.') $fixnum.Int64? revision,
    $core.bool? extraStatistics,
    $fixnum.Int64? messageTimeoutTicks,
    $core.int? maxRetryCount,
    $fixnum.Int64? checkpointAfterTicks,
    $core.int? minCheckpointCount,
    $core.int? maxCheckpointCount,
    $core.int? maxSubscriberCount,
    $core.int? liveBufferSize,
    $core.int? readBatchSize,
    $core.int? historyBufferSize,
    UpdateReq_ConsumerStrategy? namedConsumerStrategy,
    $core.int? messageTimeoutMs,
    $core.int? checkpointAfterMs,
  }) {
    final _result = create();
    if (resolveLinks != null) {
      _result.resolveLinks = resolveLinks;
    }
    if (revision != null) {
      // ignore: deprecated_member_use_from_same_package
      _result.revision = revision;
    }
    if (extraStatistics != null) {
      _result.extraStatistics = extraStatistics;
    }
    if (messageTimeoutTicks != null) {
      _result.messageTimeoutTicks = messageTimeoutTicks;
    }
    if (maxRetryCount != null) {
      _result.maxRetryCount = maxRetryCount;
    }
    if (checkpointAfterTicks != null) {
      _result.checkpointAfterTicks = checkpointAfterTicks;
    }
    if (minCheckpointCount != null) {
      _result.minCheckpointCount = minCheckpointCount;
    }
    if (maxCheckpointCount != null) {
      _result.maxCheckpointCount = maxCheckpointCount;
    }
    if (maxSubscriberCount != null) {
      _result.maxSubscriberCount = maxSubscriberCount;
    }
    if (liveBufferSize != null) {
      _result.liveBufferSize = liveBufferSize;
    }
    if (readBatchSize != null) {
      _result.readBatchSize = readBatchSize;
    }
    if (historyBufferSize != null) {
      _result.historyBufferSize = historyBufferSize;
    }
    if (namedConsumerStrategy != null) {
      _result.namedConsumerStrategy = namedConsumerStrategy;
    }
    if (messageTimeoutMs != null) {
      _result.messageTimeoutMs = messageTimeoutMs;
    }
    if (checkpointAfterMs != null) {
      _result.checkpointAfterMs = checkpointAfterMs;
    }
    return _result;
  }
  factory UpdateReq_Settings.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateReq_Settings.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateReq_Settings clone() => UpdateReq_Settings()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateReq_Settings copyWith(void Function(UpdateReq_Settings) updates) =>
      super.copyWith((message) => updates(message as UpdateReq_Settings))
          as UpdateReq_Settings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateReq_Settings create() => UpdateReq_Settings._();
  UpdateReq_Settings createEmptyInstance() => create();
  static $pb.PbList<UpdateReq_Settings> createRepeated() =>
      $pb.PbList<UpdateReq_Settings>();
  @$core.pragma('dart2js:noInline')
  static UpdateReq_Settings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateReq_Settings>(create);
  static UpdateReq_Settings? _defaultInstance;

  UpdateReq_Settings_MessageTimeout whichMessageTimeout() =>
      _UpdateReq_Settings_MessageTimeoutByTag[$_whichOneof(0)]!;
  void clearMessageTimeout() => clearField($_whichOneof(0));

  UpdateReq_Settings_CheckpointAfter whichCheckpointAfter() =>
      _UpdateReq_Settings_CheckpointAfterByTag[$_whichOneof(1)]!;
  void clearCheckpointAfter() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.bool get resolveLinks => $_getBF(0);
  @$pb.TagNumber(1)
  set resolveLinks($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResolveLinks() => $_has(0);
  @$pb.TagNumber(1)
  void clearResolveLinks() => clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $fixnum.Int64 get revision => $_getI64(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set revision($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasRevision() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearRevision() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get extraStatistics => $_getBF(2);
  @$pb.TagNumber(3)
  set extraStatistics($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExtraStatistics() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtraStatistics() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get messageTimeoutTicks => $_getI64(3);
  @$pb.TagNumber(4)
  set messageTimeoutTicks($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMessageTimeoutTicks() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageTimeoutTicks() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxRetryCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxRetryCount($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMaxRetryCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxRetryCount() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get checkpointAfterTicks => $_getI64(5);
  @$pb.TagNumber(6)
  set checkpointAfterTicks($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCheckpointAfterTicks() => $_has(5);
  @$pb.TagNumber(6)
  void clearCheckpointAfterTicks() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get minCheckpointCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set minCheckpointCount($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMinCheckpointCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinCheckpointCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxCheckpointCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxCheckpointCount($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMaxCheckpointCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxCheckpointCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get maxSubscriberCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set maxSubscriberCount($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMaxSubscriberCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearMaxSubscriberCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get liveBufferSize => $_getIZ(9);
  @$pb.TagNumber(10)
  set liveBufferSize($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLiveBufferSize() => $_has(9);
  @$pb.TagNumber(10)
  void clearLiveBufferSize() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get readBatchSize => $_getIZ(10);
  @$pb.TagNumber(11)
  set readBatchSize($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasReadBatchSize() => $_has(10);
  @$pb.TagNumber(11)
  void clearReadBatchSize() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get historyBufferSize => $_getIZ(11);
  @$pb.TagNumber(12)
  set historyBufferSize($core.int v) {
    $_setSignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasHistoryBufferSize() => $_has(11);
  @$pb.TagNumber(12)
  void clearHistoryBufferSize() => clearField(12);

  @$pb.TagNumber(13)
  UpdateReq_ConsumerStrategy get namedConsumerStrategy => $_getN(12);
  @$pb.TagNumber(13)
  set namedConsumerStrategy(UpdateReq_ConsumerStrategy v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasNamedConsumerStrategy() => $_has(12);
  @$pb.TagNumber(13)
  void clearNamedConsumerStrategy() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get messageTimeoutMs => $_getIZ(13);
  @$pb.TagNumber(14)
  set messageTimeoutMs($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasMessageTimeoutMs() => $_has(13);
  @$pb.TagNumber(14)
  void clearMessageTimeoutMs() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get checkpointAfterMs => $_getIZ(14);
  @$pb.TagNumber(15)
  set checkpointAfterMs($core.int v) {
    $_setSignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasCheckpointAfterMs() => $_has(14);
  @$pb.TagNumber(15)
  void clearCheckpointAfterMs() => clearField(15);
}

class UpdateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
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
              : 'event_store.client.persistent_subscriptions'),
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

enum DeleteReq_Options_StreamOption { streamIdentifier, all, notSet }

class DeleteReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DeleteReq_Options_StreamOption>
      _DeleteReq_Options_StreamOptionByTag = {
    1: DeleteReq_Options_StreamOption.streamIdentifier,
    3: DeleteReq_Options_StreamOption.all,
    0: DeleteReq_Options_StreamOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 3])
    ..aOM<$1.StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..aOM<$1.Empty>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'all',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  DeleteReq_Options._() : super();
  factory DeleteReq_Options({
    $1.StreamIdentifier? streamIdentifier,
    $core.String? groupName,
    $1.Empty? all,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    if (all != null) {
      _result.all = all;
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

  DeleteReq_Options_StreamOption whichStreamOption() =>
      _DeleteReq_Options_StreamOptionByTag[$_whichOneof(0)]!;
  void clearStreamOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.StreamIdentifier get streamIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => clearField(2);

  @$pb.TagNumber(3)
  $1.Empty get all => $_getN(2);
  @$pb.TagNumber(3)
  set all($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAll() => $_has(2);
  @$pb.TagNumber(3)
  void clearAll() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureAll() => $_ensure(2);
}

class DeleteReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
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
              : 'event_store.client.persistent_subscriptions'),
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

enum GetInfoReq_Options_StreamOption { streamIdentifier, all, notSet }

class GetInfoReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetInfoReq_Options_StreamOption>
      _GetInfoReq_Options_StreamOptionByTag = {
    1: GetInfoReq_Options_StreamOption.streamIdentifier,
    2: GetInfoReq_Options_StreamOption.all,
    0: GetInfoReq_Options_StreamOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetInfoReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..aOM<$1.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'all',
        subBuilder: $1.Empty.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..hasRequiredFields = false;

  GetInfoReq_Options._() : super();
  factory GetInfoReq_Options({
    $1.StreamIdentifier? streamIdentifier,
    $1.Empty? all,
    $core.String? groupName,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (all != null) {
      _result.all = all;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    return _result;
  }
  factory GetInfoReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetInfoReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetInfoReq_Options clone() => GetInfoReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetInfoReq_Options copyWith(void Function(GetInfoReq_Options) updates) =>
      super.copyWith((message) => updates(message as GetInfoReq_Options))
          as GetInfoReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetInfoReq_Options create() => GetInfoReq_Options._();
  GetInfoReq_Options createEmptyInstance() => create();
  static $pb.PbList<GetInfoReq_Options> createRepeated() =>
      $pb.PbList<GetInfoReq_Options>();
  @$core.pragma('dart2js:noInline')
  static GetInfoReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInfoReq_Options>(create);
  static GetInfoReq_Options? _defaultInstance;

  GetInfoReq_Options_StreamOption whichStreamOption() =>
      _GetInfoReq_Options_StreamOptionByTag[$_whichOneof(0)]!;
  void clearStreamOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.StreamIdentifier get streamIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(0);

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
  $core.String get groupName => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGroupName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupName() => clearField(3);
}

class GetInfoReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetInfoReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOM<GetInfoReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: GetInfoReq_Options.create)
    ..hasRequiredFields = false;

  GetInfoReq._() : super();
  factory GetInfoReq({
    GetInfoReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory GetInfoReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetInfoReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetInfoReq clone() => GetInfoReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetInfoReq copyWith(void Function(GetInfoReq) updates) =>
      super.copyWith((message) => updates(message as GetInfoReq))
          as GetInfoReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetInfoReq create() => GetInfoReq._();
  GetInfoReq createEmptyInstance() => create();
  static $pb.PbList<GetInfoReq> createRepeated() => $pb.PbList<GetInfoReq>();
  @$core.pragma('dart2js:noInline')
  static GetInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInfoReq>(create);
  static GetInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  GetInfoReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(GetInfoReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  GetInfoReq_Options ensureOptions() => $_ensure(0);
}

class GetInfoResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetInfoResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOM<SubscriptionInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptionInfo',
        subBuilder: SubscriptionInfo.create)
    ..hasRequiredFields = false;

  GetInfoResp._() : super();
  factory GetInfoResp({
    SubscriptionInfo? subscriptionInfo,
  }) {
    final _result = create();
    if (subscriptionInfo != null) {
      _result.subscriptionInfo = subscriptionInfo;
    }
    return _result;
  }
  factory GetInfoResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetInfoResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetInfoResp clone() => GetInfoResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetInfoResp copyWith(void Function(GetInfoResp) updates) =>
      super.copyWith((message) => updates(message as GetInfoResp))
          as GetInfoResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetInfoResp create() => GetInfoResp._();
  GetInfoResp createEmptyInstance() => create();
  static $pb.PbList<GetInfoResp> createRepeated() => $pb.PbList<GetInfoResp>();
  @$core.pragma('dart2js:noInline')
  static GetInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInfoResp>(create);
  static GetInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  SubscriptionInfo get subscriptionInfo => $_getN(0);
  @$pb.TagNumber(1)
  set subscriptionInfo(SubscriptionInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSubscriptionInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriptionInfo() => clearField(1);
  @$pb.TagNumber(1)
  SubscriptionInfo ensureSubscriptionInfo() => $_ensure(0);
}

class SubscriptionInfo_ConnectionInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SubscriptionInfo.ConnectionInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'averageItemsPerSecond',
        $pb.PbFieldType.O3)
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalItems')
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countSinceLastMeasurement')
    ..pc<SubscriptionInfo_Measurement>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'observedMeasurements',
        $pb.PbFieldType.PM,
        subBuilder: SubscriptionInfo_Measurement.create)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'availableSlots',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inFlightMessages',
        $pb.PbFieldType.O3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'connectionName')
    ..hasRequiredFields = false;

  SubscriptionInfo_ConnectionInfo._() : super();
  factory SubscriptionInfo_ConnectionInfo({
    $core.String? from,
    $core.String? username,
    $core.int? averageItemsPerSecond,
    $fixnum.Int64? totalItems,
    $fixnum.Int64? countSinceLastMeasurement,
    $core.Iterable<SubscriptionInfo_Measurement>? observedMeasurements,
    $core.int? availableSlots,
    $core.int? inFlightMessages,
    $core.String? connectionName,
  }) {
    final _result = create();
    if (from != null) {
      _result.from = from;
    }
    if (username != null) {
      _result.username = username;
    }
    if (averageItemsPerSecond != null) {
      _result.averageItemsPerSecond = averageItemsPerSecond;
    }
    if (totalItems != null) {
      _result.totalItems = totalItems;
    }
    if (countSinceLastMeasurement != null) {
      _result.countSinceLastMeasurement = countSinceLastMeasurement;
    }
    if (observedMeasurements != null) {
      _result.observedMeasurements.addAll(observedMeasurements);
    }
    if (availableSlots != null) {
      _result.availableSlots = availableSlots;
    }
    if (inFlightMessages != null) {
      _result.inFlightMessages = inFlightMessages;
    }
    if (connectionName != null) {
      _result.connectionName = connectionName;
    }
    return _result;
  }
  factory SubscriptionInfo_ConnectionInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionInfo_ConnectionInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscriptionInfo_ConnectionInfo clone() =>
      SubscriptionInfo_ConnectionInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscriptionInfo_ConnectionInfo copyWith(
          void Function(SubscriptionInfo_ConnectionInfo) updates) =>
      super.copyWith(
              (message) => updates(message as SubscriptionInfo_ConnectionInfo))
          as SubscriptionInfo_ConnectionInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscriptionInfo_ConnectionInfo create() =>
      SubscriptionInfo_ConnectionInfo._();
  SubscriptionInfo_ConnectionInfo createEmptyInstance() => create();
  static $pb.PbList<SubscriptionInfo_ConnectionInfo> createRepeated() =>
      $pb.PbList<SubscriptionInfo_ConnectionInfo>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionInfo_ConnectionInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionInfo_ConnectionInfo>(
          create);
  static SubscriptionInfo_ConnectionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get averageItemsPerSecond => $_getIZ(2);
  @$pb.TagNumber(3)
  set averageItemsPerSecond($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAverageItemsPerSecond() => $_has(2);
  @$pb.TagNumber(3)
  void clearAverageItemsPerSecond() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalItems => $_getI64(3);
  @$pb.TagNumber(4)
  set totalItems($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotalItems() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalItems() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get countSinceLastMeasurement => $_getI64(4);
  @$pb.TagNumber(5)
  set countSinceLastMeasurement($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCountSinceLastMeasurement() => $_has(4);
  @$pb.TagNumber(5)
  void clearCountSinceLastMeasurement() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<SubscriptionInfo_Measurement> get observedMeasurements =>
      $_getList(5);

  @$pb.TagNumber(7)
  $core.int get availableSlots => $_getIZ(6);
  @$pb.TagNumber(7)
  set availableSlots($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAvailableSlots() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvailableSlots() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get inFlightMessages => $_getIZ(7);
  @$pb.TagNumber(8)
  set inFlightMessages($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasInFlightMessages() => $_has(7);
  @$pb.TagNumber(8)
  void clearInFlightMessages() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get connectionName => $_getSZ(8);
  @$pb.TagNumber(9)
  set connectionName($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasConnectionName() => $_has(8);
  @$pb.TagNumber(9)
  void clearConnectionName() => clearField(9);
}

class SubscriptionInfo_Measurement extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SubscriptionInfo.Measurement',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  SubscriptionInfo_Measurement._() : super();
  factory SubscriptionInfo_Measurement({
    $core.String? key,
    $fixnum.Int64? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory SubscriptionInfo_Measurement.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionInfo_Measurement.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscriptionInfo_Measurement clone() =>
      SubscriptionInfo_Measurement()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscriptionInfo_Measurement copyWith(
          void Function(SubscriptionInfo_Measurement) updates) =>
      super.copyWith(
              (message) => updates(message as SubscriptionInfo_Measurement))
          as SubscriptionInfo_Measurement; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscriptionInfo_Measurement create() =>
      SubscriptionInfo_Measurement._();
  SubscriptionInfo_Measurement createEmptyInstance() => create();
  static $pb.PbList<SubscriptionInfo_Measurement> createRepeated() =>
      $pb.PbList<SubscriptionInfo_Measurement>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionInfo_Measurement getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionInfo_Measurement>(create);
  static SubscriptionInfo_Measurement? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class SubscriptionInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SubscriptionInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'eventSource')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status')
    ..pc<SubscriptionInfo_ConnectionInfo>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'connections',
        $pb.PbFieldType.PM,
        subBuilder: SubscriptionInfo_ConnectionInfo.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'averagePerSecond',
        $pb.PbFieldType.O3)
    ..aInt64(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalItems')
    ..aInt64(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countSinceLastMeasurement')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastCheckpointedEventPosition')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastKnownEventPosition')
    ..aOB(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resolveLinkTos')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startFrom')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'messageTimeoutMilliseconds',
        $pb.PbFieldType.O3)
    ..aOB(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extraStatistics')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxRetryCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveBufferSize',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bufferSize',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'readBatchSize',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkPointAfterMilliseconds',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'minCheckPointCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxCheckPointCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'readBufferCount',
        $pb.PbFieldType.O3)
    ..aInt64(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveBufferCount')
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'retryBufferCount',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalInFlightMessages',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outstandingMessagesCount',
        $pb.PbFieldType.O3)
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'namedConsumerStrategy')
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxSubscriberCount',
        $pb.PbFieldType.O3)
    ..aInt64(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parkedMessageCount')
    ..hasRequiredFields = false;

  SubscriptionInfo._() : super();
  factory SubscriptionInfo({
    $core.String? eventSource,
    $core.String? groupName,
    $core.String? status,
    $core.Iterable<SubscriptionInfo_ConnectionInfo>? connections,
    $core.int? averagePerSecond,
    $fixnum.Int64? totalItems,
    $fixnum.Int64? countSinceLastMeasurement,
    $core.String? lastCheckpointedEventPosition,
    $core.String? lastKnownEventPosition,
    $core.bool? resolveLinkTos,
    $core.String? startFrom,
    $core.int? messageTimeoutMilliseconds,
    $core.bool? extraStatistics,
    $core.int? maxRetryCount,
    $core.int? liveBufferSize,
    $core.int? bufferSize,
    $core.int? readBatchSize,
    $core.int? checkPointAfterMilliseconds,
    $core.int? minCheckPointCount,
    $core.int? maxCheckPointCount,
    $core.int? readBufferCount,
    $fixnum.Int64? liveBufferCount,
    $core.int? retryBufferCount,
    $core.int? totalInFlightMessages,
    $core.int? outstandingMessagesCount,
    $core.String? namedConsumerStrategy,
    $core.int? maxSubscriberCount,
    $fixnum.Int64? parkedMessageCount,
  }) {
    final _result = create();
    if (eventSource != null) {
      _result.eventSource = eventSource;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    if (status != null) {
      _result.status = status;
    }
    if (connections != null) {
      _result.connections.addAll(connections);
    }
    if (averagePerSecond != null) {
      _result.averagePerSecond = averagePerSecond;
    }
    if (totalItems != null) {
      _result.totalItems = totalItems;
    }
    if (countSinceLastMeasurement != null) {
      _result.countSinceLastMeasurement = countSinceLastMeasurement;
    }
    if (lastCheckpointedEventPosition != null) {
      _result.lastCheckpointedEventPosition = lastCheckpointedEventPosition;
    }
    if (lastKnownEventPosition != null) {
      _result.lastKnownEventPosition = lastKnownEventPosition;
    }
    if (resolveLinkTos != null) {
      _result.resolveLinkTos = resolveLinkTos;
    }
    if (startFrom != null) {
      _result.startFrom = startFrom;
    }
    if (messageTimeoutMilliseconds != null) {
      _result.messageTimeoutMilliseconds = messageTimeoutMilliseconds;
    }
    if (extraStatistics != null) {
      _result.extraStatistics = extraStatistics;
    }
    if (maxRetryCount != null) {
      _result.maxRetryCount = maxRetryCount;
    }
    if (liveBufferSize != null) {
      _result.liveBufferSize = liveBufferSize;
    }
    if (bufferSize != null) {
      _result.bufferSize = bufferSize;
    }
    if (readBatchSize != null) {
      _result.readBatchSize = readBatchSize;
    }
    if (checkPointAfterMilliseconds != null) {
      _result.checkPointAfterMilliseconds = checkPointAfterMilliseconds;
    }
    if (minCheckPointCount != null) {
      _result.minCheckPointCount = minCheckPointCount;
    }
    if (maxCheckPointCount != null) {
      _result.maxCheckPointCount = maxCheckPointCount;
    }
    if (readBufferCount != null) {
      _result.readBufferCount = readBufferCount;
    }
    if (liveBufferCount != null) {
      _result.liveBufferCount = liveBufferCount;
    }
    if (retryBufferCount != null) {
      _result.retryBufferCount = retryBufferCount;
    }
    if (totalInFlightMessages != null) {
      _result.totalInFlightMessages = totalInFlightMessages;
    }
    if (outstandingMessagesCount != null) {
      _result.outstandingMessagesCount = outstandingMessagesCount;
    }
    if (namedConsumerStrategy != null) {
      _result.namedConsumerStrategy = namedConsumerStrategy;
    }
    if (maxSubscriberCount != null) {
      _result.maxSubscriberCount = maxSubscriberCount;
    }
    if (parkedMessageCount != null) {
      _result.parkedMessageCount = parkedMessageCount;
    }
    return _result;
  }
  factory SubscriptionInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscriptionInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscriptionInfo clone() => SubscriptionInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscriptionInfo copyWith(void Function(SubscriptionInfo) updates) =>
      super.copyWith((message) => updates(message as SubscriptionInfo))
          as SubscriptionInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscriptionInfo create() => SubscriptionInfo._();
  SubscriptionInfo createEmptyInstance() => create();
  static $pb.PbList<SubscriptionInfo> createRepeated() =>
      $pb.PbList<SubscriptionInfo>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionInfo>(create);
  static SubscriptionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventSource => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventSource($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEventSource() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventSource() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<SubscriptionInfo_ConnectionInfo> get connections => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get averagePerSecond => $_getIZ(4);
  @$pb.TagNumber(5)
  set averagePerSecond($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAveragePerSecond() => $_has(4);
  @$pb.TagNumber(5)
  void clearAveragePerSecond() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalItems => $_getI64(5);
  @$pb.TagNumber(6)
  set totalItems($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTotalItems() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalItems() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get countSinceLastMeasurement => $_getI64(6);
  @$pb.TagNumber(7)
  set countSinceLastMeasurement($fixnum.Int64 v) {
    $_setInt64(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCountSinceLastMeasurement() => $_has(6);
  @$pb.TagNumber(7)
  void clearCountSinceLastMeasurement() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get lastCheckpointedEventPosition => $_getSZ(7);
  @$pb.TagNumber(8)
  set lastCheckpointedEventPosition($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLastCheckpointedEventPosition() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastCheckpointedEventPosition() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get lastKnownEventPosition => $_getSZ(8);
  @$pb.TagNumber(9)
  set lastKnownEventPosition($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLastKnownEventPosition() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastKnownEventPosition() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get resolveLinkTos => $_getBF(9);
  @$pb.TagNumber(10)
  set resolveLinkTos($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasResolveLinkTos() => $_has(9);
  @$pb.TagNumber(10)
  void clearResolveLinkTos() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get startFrom => $_getSZ(10);
  @$pb.TagNumber(11)
  set startFrom($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasStartFrom() => $_has(10);
  @$pb.TagNumber(11)
  void clearStartFrom() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get messageTimeoutMilliseconds => $_getIZ(11);
  @$pb.TagNumber(12)
  set messageTimeoutMilliseconds($core.int v) {
    $_setSignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasMessageTimeoutMilliseconds() => $_has(11);
  @$pb.TagNumber(12)
  void clearMessageTimeoutMilliseconds() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get extraStatistics => $_getBF(12);
  @$pb.TagNumber(13)
  set extraStatistics($core.bool v) {
    $_setBool(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasExtraStatistics() => $_has(12);
  @$pb.TagNumber(13)
  void clearExtraStatistics() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get maxRetryCount => $_getIZ(13);
  @$pb.TagNumber(14)
  set maxRetryCount($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasMaxRetryCount() => $_has(13);
  @$pb.TagNumber(14)
  void clearMaxRetryCount() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get liveBufferSize => $_getIZ(14);
  @$pb.TagNumber(15)
  set liveBufferSize($core.int v) {
    $_setSignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasLiveBufferSize() => $_has(14);
  @$pb.TagNumber(15)
  void clearLiveBufferSize() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get bufferSize => $_getIZ(15);
  @$pb.TagNumber(16)
  set bufferSize($core.int v) {
    $_setSignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasBufferSize() => $_has(15);
  @$pb.TagNumber(16)
  void clearBufferSize() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get readBatchSize => $_getIZ(16);
  @$pb.TagNumber(17)
  set readBatchSize($core.int v) {
    $_setSignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasReadBatchSize() => $_has(16);
  @$pb.TagNumber(17)
  void clearReadBatchSize() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get checkPointAfterMilliseconds => $_getIZ(17);
  @$pb.TagNumber(18)
  set checkPointAfterMilliseconds($core.int v) {
    $_setSignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasCheckPointAfterMilliseconds() => $_has(17);
  @$pb.TagNumber(18)
  void clearCheckPointAfterMilliseconds() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get minCheckPointCount => $_getIZ(18);
  @$pb.TagNumber(19)
  set minCheckPointCount($core.int v) {
    $_setSignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasMinCheckPointCount() => $_has(18);
  @$pb.TagNumber(19)
  void clearMinCheckPointCount() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get maxCheckPointCount => $_getIZ(19);
  @$pb.TagNumber(20)
  set maxCheckPointCount($core.int v) {
    $_setSignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasMaxCheckPointCount() => $_has(19);
  @$pb.TagNumber(20)
  void clearMaxCheckPointCount() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get readBufferCount => $_getIZ(20);
  @$pb.TagNumber(21)
  set readBufferCount($core.int v) {
    $_setSignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasReadBufferCount() => $_has(20);
  @$pb.TagNumber(21)
  void clearReadBufferCount() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get liveBufferCount => $_getI64(21);
  @$pb.TagNumber(22)
  set liveBufferCount($fixnum.Int64 v) {
    $_setInt64(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasLiveBufferCount() => $_has(21);
  @$pb.TagNumber(22)
  void clearLiveBufferCount() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get retryBufferCount => $_getIZ(22);
  @$pb.TagNumber(23)
  set retryBufferCount($core.int v) {
    $_setSignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasRetryBufferCount() => $_has(22);
  @$pb.TagNumber(23)
  void clearRetryBufferCount() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get totalInFlightMessages => $_getIZ(23);
  @$pb.TagNumber(24)
  set totalInFlightMessages($core.int v) {
    $_setSignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasTotalInFlightMessages() => $_has(23);
  @$pb.TagNumber(24)
  void clearTotalInFlightMessages() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get outstandingMessagesCount => $_getIZ(24);
  @$pb.TagNumber(25)
  set outstandingMessagesCount($core.int v) {
    $_setSignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasOutstandingMessagesCount() => $_has(24);
  @$pb.TagNumber(25)
  void clearOutstandingMessagesCount() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get namedConsumerStrategy => $_getSZ(25);
  @$pb.TagNumber(26)
  set namedConsumerStrategy($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasNamedConsumerStrategy() => $_has(25);
  @$pb.TagNumber(26)
  void clearNamedConsumerStrategy() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get maxSubscriberCount => $_getIZ(26);
  @$pb.TagNumber(27)
  set maxSubscriberCount($core.int v) {
    $_setSignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasMaxSubscriberCount() => $_has(26);
  @$pb.TagNumber(27)
  void clearMaxSubscriberCount() => clearField(27);

  @$pb.TagNumber(28)
  $fixnum.Int64 get parkedMessageCount => $_getI64(27);
  @$pb.TagNumber(28)
  set parkedMessageCount($fixnum.Int64 v) {
    $_setInt64(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasParkedMessageCount() => $_has(27);
  @$pb.TagNumber(28)
  void clearParkedMessageCount() => clearField(28);
}

enum ReplayParkedReq_Options_StreamOption { streamIdentifier, all, notSet }

enum ReplayParkedReq_Options_StopAtOption { stopAt, noLimit, notSet }

class ReplayParkedReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReplayParkedReq_Options_StreamOption>
      _ReplayParkedReq_Options_StreamOptionByTag = {
    2: ReplayParkedReq_Options_StreamOption.streamIdentifier,
    3: ReplayParkedReq_Options_StreamOption.all,
    0: ReplayParkedReq_Options_StreamOption.notSet
  };
  static const $core.Map<$core.int, ReplayParkedReq_Options_StopAtOption>
      _ReplayParkedReq_Options_StopAtOptionByTag = {
    4: ReplayParkedReq_Options_StopAtOption.stopAt,
    5: ReplayParkedReq_Options_StopAtOption.noLimit,
    0: ReplayParkedReq_Options_StopAtOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReplayParkedReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [4, 5])
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..aOM<$1.StreamIdentifier>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..aOM<$1.Empty>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'all',
        subBuilder: $1.Empty.create)
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stopAt')
    ..aOM<$1.Empty>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noLimit',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  ReplayParkedReq_Options._() : super();
  factory ReplayParkedReq_Options({
    $core.String? groupName,
    $1.StreamIdentifier? streamIdentifier,
    $1.Empty? all,
    $fixnum.Int64? stopAt,
    $1.Empty? noLimit,
  }) {
    final _result = create();
    if (groupName != null) {
      _result.groupName = groupName;
    }
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (all != null) {
      _result.all = all;
    }
    if (stopAt != null) {
      _result.stopAt = stopAt;
    }
    if (noLimit != null) {
      _result.noLimit = noLimit;
    }
    return _result;
  }
  factory ReplayParkedReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReplayParkedReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReplayParkedReq_Options clone() =>
      ReplayParkedReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReplayParkedReq_Options copyWith(
          void Function(ReplayParkedReq_Options) updates) =>
      super.copyWith((message) => updates(message as ReplayParkedReq_Options))
          as ReplayParkedReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReplayParkedReq_Options create() => ReplayParkedReq_Options._();
  ReplayParkedReq_Options createEmptyInstance() => create();
  static $pb.PbList<ReplayParkedReq_Options> createRepeated() =>
      $pb.PbList<ReplayParkedReq_Options>();
  @$core.pragma('dart2js:noInline')
  static ReplayParkedReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplayParkedReq_Options>(create);
  static ReplayParkedReq_Options? _defaultInstance;

  ReplayParkedReq_Options_StreamOption whichStreamOption() =>
      _ReplayParkedReq_Options_StreamOptionByTag[$_whichOneof(0)]!;
  void clearStreamOption() => clearField($_whichOneof(0));

  ReplayParkedReq_Options_StopAtOption whichStopAtOption() =>
      _ReplayParkedReq_Options_StopAtOptionByTag[$_whichOneof(1)]!;
  void clearStopAtOption() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $core.String get groupName => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGroupName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupName() => clearField(1);

  @$pb.TagNumber(2)
  $1.StreamIdentifier get streamIdentifier => $_getN(1);
  @$pb.TagNumber(2)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStreamIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreamIdentifier() => clearField(2);
  @$pb.TagNumber(2)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Empty get all => $_getN(2);
  @$pb.TagNumber(3)
  set all($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAll() => $_has(2);
  @$pb.TagNumber(3)
  void clearAll() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureAll() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get stopAt => $_getI64(3);
  @$pb.TagNumber(4)
  set stopAt($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStopAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearStopAt() => clearField(4);

  @$pb.TagNumber(5)
  $1.Empty get noLimit => $_getN(4);
  @$pb.TagNumber(5)
  set noLimit($1.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNoLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearNoLimit() => clearField(5);
  @$pb.TagNumber(5)
  $1.Empty ensureNoLimit() => $_ensure(4);
}

class ReplayParkedReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReplayParkedReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOM<ReplayParkedReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: ReplayParkedReq_Options.create)
    ..hasRequiredFields = false;

  ReplayParkedReq._() : super();
  factory ReplayParkedReq({
    ReplayParkedReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory ReplayParkedReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReplayParkedReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReplayParkedReq clone() => ReplayParkedReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReplayParkedReq copyWith(void Function(ReplayParkedReq) updates) =>
      super.copyWith((message) => updates(message as ReplayParkedReq))
          as ReplayParkedReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReplayParkedReq create() => ReplayParkedReq._();
  ReplayParkedReq createEmptyInstance() => create();
  static $pb.PbList<ReplayParkedReq> createRepeated() =>
      $pb.PbList<ReplayParkedReq>();
  @$core.pragma('dart2js:noInline')
  static ReplayParkedReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplayParkedReq>(create);
  static ReplayParkedReq? _defaultInstance;

  @$pb.TagNumber(1)
  ReplayParkedReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(ReplayParkedReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  ReplayParkedReq_Options ensureOptions() => $_ensure(0);
}

class ReplayParkedResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReplayParkedResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  ReplayParkedResp._() : super();
  factory ReplayParkedResp() => create();
  factory ReplayParkedResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReplayParkedResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReplayParkedResp clone() => ReplayParkedResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReplayParkedResp copyWith(void Function(ReplayParkedResp) updates) =>
      super.copyWith((message) => updates(message as ReplayParkedResp))
          as ReplayParkedResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReplayParkedResp create() => ReplayParkedResp._();
  ReplayParkedResp createEmptyInstance() => create();
  static $pb.PbList<ReplayParkedResp> createRepeated() =>
      $pb.PbList<ReplayParkedResp>();
  @$core.pragma('dart2js:noInline')
  static ReplayParkedResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplayParkedResp>(create);
  static ReplayParkedResp? _defaultInstance;
}

enum ListReq_Options_ListOption { listAllSubscriptions, listForStream, notSet }

class ListReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ListReq_Options_ListOption>
      _ListReq_Options_ListOptionByTag = {
    1: ListReq_Options_ListOption.listAllSubscriptions,
    2: ListReq_Options_ListOption.listForStream,
    0: ListReq_Options_ListOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.Empty>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listAllSubscriptions',
        subBuilder: $1.Empty.create)
    ..aOM<ListReq_StreamOption>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listForStream',
        subBuilder: ListReq_StreamOption.create)
    ..hasRequiredFields = false;

  ListReq_Options._() : super();
  factory ListReq_Options({
    $1.Empty? listAllSubscriptions,
    ListReq_StreamOption? listForStream,
  }) {
    final _result = create();
    if (listAllSubscriptions != null) {
      _result.listAllSubscriptions = listAllSubscriptions;
    }
    if (listForStream != null) {
      _result.listForStream = listForStream;
    }
    return _result;
  }
  factory ListReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListReq_Options clone() => ListReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListReq_Options copyWith(void Function(ListReq_Options) updates) =>
      super.copyWith((message) => updates(message as ListReq_Options))
          as ListReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListReq_Options create() => ListReq_Options._();
  ListReq_Options createEmptyInstance() => create();
  static $pb.PbList<ListReq_Options> createRepeated() =>
      $pb.PbList<ListReq_Options>();
  @$core.pragma('dart2js:noInline')
  static ListReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReq_Options>(create);
  static ListReq_Options? _defaultInstance;

  ListReq_Options_ListOption whichListOption() =>
      _ListReq_Options_ListOptionByTag[$_whichOneof(0)]!;
  void clearListOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.Empty get listAllSubscriptions => $_getN(0);
  @$pb.TagNumber(1)
  set listAllSubscriptions($1.Empty v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasListAllSubscriptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearListAllSubscriptions() => clearField(1);
  @$pb.TagNumber(1)
  $1.Empty ensureListAllSubscriptions() => $_ensure(0);

  @$pb.TagNumber(2)
  ListReq_StreamOption get listForStream => $_getN(1);
  @$pb.TagNumber(2)
  set listForStream(ListReq_StreamOption v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasListForStream() => $_has(1);
  @$pb.TagNumber(2)
  void clearListForStream() => clearField(2);
  @$pb.TagNumber(2)
  ListReq_StreamOption ensureListForStream() => $_ensure(1);
}

enum ListReq_StreamOption_StreamOption { stream, all, notSet }

class ListReq_StreamOption extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ListReq_StreamOption_StreamOption>
      _ListReq_StreamOption_StreamOptionByTag = {
    1: ListReq_StreamOption_StreamOption.stream,
    2: ListReq_StreamOption_StreamOption.all,
    0: ListReq_StreamOption_StreamOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListReq.StreamOption',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$1.StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stream',
        subBuilder: $1.StreamIdentifier.create)
    ..aOM<$1.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'all',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  ListReq_StreamOption._() : super();
  factory ListReq_StreamOption({
    $1.StreamIdentifier? stream,
    $1.Empty? all,
  }) {
    final _result = create();
    if (stream != null) {
      _result.stream = stream;
    }
    if (all != null) {
      _result.all = all;
    }
    return _result;
  }
  factory ListReq_StreamOption.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListReq_StreamOption.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListReq_StreamOption clone() =>
      ListReq_StreamOption()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListReq_StreamOption copyWith(void Function(ListReq_StreamOption) updates) =>
      super.copyWith((message) => updates(message as ListReq_StreamOption))
          as ListReq_StreamOption; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListReq_StreamOption create() => ListReq_StreamOption._();
  ListReq_StreamOption createEmptyInstance() => create();
  static $pb.PbList<ListReq_StreamOption> createRepeated() =>
      $pb.PbList<ListReq_StreamOption>();
  @$core.pragma('dart2js:noInline')
  static ListReq_StreamOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReq_StreamOption>(create);
  static ListReq_StreamOption? _defaultInstance;

  ListReq_StreamOption_StreamOption whichStreamOption() =>
      _ListReq_StreamOption_StreamOptionByTag[$_whichOneof(0)]!;
  void clearStreamOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.StreamIdentifier get stream => $_getN(0);
  @$pb.TagNumber(1)
  set stream($1.StreamIdentifier v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStream() => $_has(0);
  @$pb.TagNumber(1)
  void clearStream() => clearField(1);
  @$pb.TagNumber(1)
  $1.StreamIdentifier ensureStream() => $_ensure(0);

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
}

class ListReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..aOM<ListReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: ListReq_Options.create)
    ..hasRequiredFields = false;

  ListReq._() : super();
  factory ListReq({
    ListReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory ListReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListReq clone() => ListReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListReq copyWith(void Function(ListReq) updates) =>
      super.copyWith((message) => updates(message as ListReq))
          as ListReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListReq create() => ListReq._();
  ListReq createEmptyInstance() => create();
  static $pb.PbList<ListReq> createRepeated() => $pb.PbList<ListReq>();
  @$core.pragma('dart2js:noInline')
  static ListReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListReq>(create);
  static ListReq? _defaultInstance;

  @$pb.TagNumber(1)
  ListReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(ListReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  ListReq_Options ensureOptions() => $_ensure(0);
}

class ListResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.persistent_subscriptions'),
      createEmptyInstance: create)
    ..pc<SubscriptionInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscriptions',
        $pb.PbFieldType.PM,
        subBuilder: SubscriptionInfo.create)
    ..hasRequiredFields = false;

  ListResp._() : super();
  factory ListResp({
    $core.Iterable<SubscriptionInfo>? subscriptions,
  }) {
    final _result = create();
    if (subscriptions != null) {
      _result.subscriptions.addAll(subscriptions);
    }
    return _result;
  }
  factory ListResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListResp clone() => ListResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListResp copyWith(void Function(ListResp) updates) =>
      super.copyWith((message) => updates(message as ListResp))
          as ListResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListResp create() => ListResp._();
  ListResp createEmptyInstance() => create();
  static $pb.PbList<ListResp> createRepeated() => $pb.PbList<ListResp>();
  @$core.pragma('dart2js:noInline')
  static ListResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListResp>(create);
  static ListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SubscriptionInfo> get subscriptions => $_getList(0);
}
