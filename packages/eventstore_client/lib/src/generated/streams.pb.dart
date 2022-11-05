///
//  Generated code. Do not modify.
//  source: streams.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'shared.pb.dart' as $1;
import 'google/empty.pb.dart' as $10;
import 'google/timestamp.pb.dart' as $14;
import 'google/duration.pb.dart' as $15;
import 'status.pb.dart' as $16;

import 'streams.pbenum.dart';

export 'streams.pbenum.dart';

enum ReadReq_Options_StreamOptions_RevisionOption {
  revision,
  start,
  end,
  notSet
}

class ReadReq_Options_StreamOptions extends $pb.GeneratedMessage {
  static const $core
          .Map<$core.int, ReadReq_Options_StreamOptions_RevisionOption>
      _ReadReq_Options_StreamOptions_RevisionOptionByTag = {
    2: ReadReq_Options_StreamOptions_RevisionOption.revision,
    3: ReadReq_Options_StreamOptions_RevisionOption.start,
    4: ReadReq_Options_StreamOptions_RevisionOption.end,
    0: ReadReq_Options_StreamOptions_RevisionOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options.StreamOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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

  ReadReq_Options_StreamOptions._() : super();
  factory ReadReq_Options_StreamOptions({
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
  factory ReadReq_Options_StreamOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Options_StreamOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Options_StreamOptions clone() =>
      ReadReq_Options_StreamOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Options_StreamOptions copyWith(
          void Function(ReadReq_Options_StreamOptions) updates) =>
      super.copyWith(
              (message) => updates(message as ReadReq_Options_StreamOptions))
          as ReadReq_Options_StreamOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_StreamOptions create() =>
      ReadReq_Options_StreamOptions._();
  ReadReq_Options_StreamOptions createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Options_StreamOptions> createRepeated() =>
      $pb.PbList<ReadReq_Options_StreamOptions>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_StreamOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadReq_Options_StreamOptions>(create);
  static ReadReq_Options_StreamOptions? _defaultInstance;

  ReadReq_Options_StreamOptions_RevisionOption whichRevisionOption() =>
      _ReadReq_Options_StreamOptions_RevisionOptionByTag[$_whichOneof(0)]!;
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

enum ReadReq_Options_AllOptions_AllOption { position, start, end, notSet }

class ReadReq_Options_AllOptions extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadReq_Options_AllOptions_AllOption>
      _ReadReq_Options_AllOptions_AllOptionByTag = {
    1: ReadReq_Options_AllOptions_AllOption.position,
    2: ReadReq_Options_AllOptions_AllOption.start,
    3: ReadReq_Options_AllOptions_AllOption.end,
    0: ReadReq_Options_AllOptions_AllOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options.AllOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<ReadReq_Options_Position>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        subBuilder: ReadReq_Options_Position.create)
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

  ReadReq_Options_AllOptions._() : super();
  factory ReadReq_Options_AllOptions({
    ReadReq_Options_Position? position,
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
  factory ReadReq_Options_AllOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Options_AllOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Options_AllOptions clone() =>
      ReadReq_Options_AllOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Options_AllOptions copyWith(
          void Function(ReadReq_Options_AllOptions) updates) =>
      super.copyWith(
              (message) => updates(message as ReadReq_Options_AllOptions))
          as ReadReq_Options_AllOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_AllOptions create() => ReadReq_Options_AllOptions._();
  ReadReq_Options_AllOptions createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Options_AllOptions> createRepeated() =>
      $pb.PbList<ReadReq_Options_AllOptions>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_AllOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadReq_Options_AllOptions>(create);
  static ReadReq_Options_AllOptions? _defaultInstance;

  ReadReq_Options_AllOptions_AllOption whichAllOption() =>
      _ReadReq_Options_AllOptions_AllOptionByTag[$_whichOneof(0)]!;
  void clearAllOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ReadReq_Options_Position get position => $_getN(0);
  @$pb.TagNumber(1)
  set position(ReadReq_Options_Position v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);
  @$pb.TagNumber(1)
  ReadReq_Options_Position ensurePosition() => $_ensure(0);

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

class ReadReq_Options_SubscriptionOptions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options.SubscriptionOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  ReadReq_Options_SubscriptionOptions._() : super();
  factory ReadReq_Options_SubscriptionOptions() => create();
  factory ReadReq_Options_SubscriptionOptions.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Options_SubscriptionOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Options_SubscriptionOptions clone() =>
      ReadReq_Options_SubscriptionOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Options_SubscriptionOptions copyWith(
          void Function(ReadReq_Options_SubscriptionOptions) updates) =>
      super.copyWith((message) =>
              updates(message as ReadReq_Options_SubscriptionOptions))
          as ReadReq_Options_SubscriptionOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_SubscriptionOptions create() =>
      ReadReq_Options_SubscriptionOptions._();
  ReadReq_Options_SubscriptionOptions createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Options_SubscriptionOptions> createRepeated() =>
      $pb.PbList<ReadReq_Options_SubscriptionOptions>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_SubscriptionOptions getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ReadReq_Options_SubscriptionOptions>(create);
  static ReadReq_Options_SubscriptionOptions? _defaultInstance;
}

class ReadReq_Options_Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options.Position',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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

  ReadReq_Options_Position._() : super();
  factory ReadReq_Options_Position({
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
  factory ReadReq_Options_Position.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Options_Position.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Options_Position clone() =>
      ReadReq_Options_Position()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Options_Position copyWith(
          void Function(ReadReq_Options_Position) updates) =>
      super.copyWith((message) => updates(message as ReadReq_Options_Position))
          as ReadReq_Options_Position; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_Position create() => ReadReq_Options_Position._();
  ReadReq_Options_Position createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Options_Position> createRepeated() =>
      $pb.PbList<ReadReq_Options_Position>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_Position getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadReq_Options_Position>(create);
  static ReadReq_Options_Position? _defaultInstance;

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

class ReadReq_Options_FilterOptions_Expression extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options.FilterOptions.Expression',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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

  ReadReq_Options_FilterOptions_Expression._() : super();
  factory ReadReq_Options_FilterOptions_Expression({
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
  factory ReadReq_Options_FilterOptions_Expression.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Options_FilterOptions_Expression.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Options_FilterOptions_Expression clone() =>
      ReadReq_Options_FilterOptions_Expression()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Options_FilterOptions_Expression copyWith(
          void Function(ReadReq_Options_FilterOptions_Expression) updates) =>
      super.copyWith((message) =>
              updates(message as ReadReq_Options_FilterOptions_Expression))
          as ReadReq_Options_FilterOptions_Expression; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_FilterOptions_Expression create() =>
      ReadReq_Options_FilterOptions_Expression._();
  ReadReq_Options_FilterOptions_Expression createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Options_FilterOptions_Expression>
      createRepeated() =>
          $pb.PbList<ReadReq_Options_FilterOptions_Expression>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_FilterOptions_Expression getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ReadReq_Options_FilterOptions_Expression>(create);
  static ReadReq_Options_FilterOptions_Expression? _defaultInstance;

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

enum ReadReq_Options_FilterOptions_Filter {
  streamIdentifier,
  eventType,
  notSet
}

enum ReadReq_Options_FilterOptions_Window { max, count, notSet }

class ReadReq_Options_FilterOptions extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadReq_Options_FilterOptions_Filter>
      _ReadReq_Options_FilterOptions_FilterByTag = {
    1: ReadReq_Options_FilterOptions_Filter.streamIdentifier,
    2: ReadReq_Options_FilterOptions_Filter.eventType,
    0: ReadReq_Options_FilterOptions_Filter.notSet
  };
  static const $core.Map<$core.int, ReadReq_Options_FilterOptions_Window>
      _ReadReq_Options_FilterOptions_WindowByTag = {
    3: ReadReq_Options_FilterOptions_Window.max,
    4: ReadReq_Options_FilterOptions_Window.count,
    0: ReadReq_Options_FilterOptions_Window.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options.FilterOptions',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..oo(1, [3, 4])
    ..aOM<ReadReq_Options_FilterOptions_Expression>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: ReadReq_Options_FilterOptions_Expression.create)
    ..aOM<ReadReq_Options_FilterOptions_Expression>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'eventType',
        subBuilder: ReadReq_Options_FilterOptions_Expression.create)
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

  ReadReq_Options_FilterOptions._() : super();
  factory ReadReq_Options_FilterOptions({
    ReadReq_Options_FilterOptions_Expression? streamIdentifier,
    ReadReq_Options_FilterOptions_Expression? eventType,
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
  factory ReadReq_Options_FilterOptions.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Options_FilterOptions.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Options_FilterOptions clone() =>
      ReadReq_Options_FilterOptions()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Options_FilterOptions copyWith(
          void Function(ReadReq_Options_FilterOptions) updates) =>
      super.copyWith(
              (message) => updates(message as ReadReq_Options_FilterOptions))
          as ReadReq_Options_FilterOptions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_FilterOptions create() =>
      ReadReq_Options_FilterOptions._();
  ReadReq_Options_FilterOptions createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Options_FilterOptions> createRepeated() =>
      $pb.PbList<ReadReq_Options_FilterOptions>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_FilterOptions getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadReq_Options_FilterOptions>(create);
  static ReadReq_Options_FilterOptions? _defaultInstance;

  ReadReq_Options_FilterOptions_Filter whichFilter() =>
      _ReadReq_Options_FilterOptions_FilterByTag[$_whichOneof(0)]!;
  void clearFilter() => clearField($_whichOneof(0));

  ReadReq_Options_FilterOptions_Window whichWindow() =>
      _ReadReq_Options_FilterOptions_WindowByTag[$_whichOneof(1)]!;
  void clearWindow() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  ReadReq_Options_FilterOptions_Expression get streamIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set streamIdentifier(ReadReq_Options_FilterOptions_Expression v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  ReadReq_Options_FilterOptions_Expression ensureStreamIdentifier() =>
      $_ensure(0);

  @$pb.TagNumber(2)
  ReadReq_Options_FilterOptions_Expression get eventType => $_getN(1);
  @$pb.TagNumber(2)
  set eventType(ReadReq_Options_FilterOptions_Expression v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEventType() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventType() => clearField(2);
  @$pb.TagNumber(2)
  ReadReq_Options_FilterOptions_Expression ensureEventType() => $_ensure(1);

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
              : 'event_store.client.streams'),
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

class ReadReq_Options_ControlOption extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options.ControlOption',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'compatibility',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ReadReq_Options_ControlOption._() : super();
  factory ReadReq_Options_ControlOption({
    $core.int? compatibility,
  }) {
    final _result = create();
    if (compatibility != null) {
      _result.compatibility = compatibility;
    }
    return _result;
  }
  factory ReadReq_Options_ControlOption.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadReq_Options_ControlOption.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadReq_Options_ControlOption clone() =>
      ReadReq_Options_ControlOption()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadReq_Options_ControlOption copyWith(
          void Function(ReadReq_Options_ControlOption) updates) =>
      super.copyWith(
              (message) => updates(message as ReadReq_Options_ControlOption))
          as ReadReq_Options_ControlOption; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_ControlOption create() =>
      ReadReq_Options_ControlOption._();
  ReadReq_Options_ControlOption createEmptyInstance() => create();
  static $pb.PbList<ReadReq_Options_ControlOption> createRepeated() =>
      $pb.PbList<ReadReq_Options_ControlOption>();
  @$core.pragma('dart2js:noInline')
  static ReadReq_Options_ControlOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadReq_Options_ControlOption>(create);
  static ReadReq_Options_ControlOption? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get compatibility => $_getIZ(0);
  @$pb.TagNumber(1)
  set compatibility($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCompatibility() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompatibility() => clearField(1);
}

enum ReadReq_Options_StreamOption { stream, all, notSet }

enum ReadReq_Options_CountOption { count, subscription, notSet }

enum ReadReq_Options_FilterOption { filter, noFilter, notSet }

class ReadReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadReq_Options_StreamOption>
      _ReadReq_Options_StreamOptionByTag = {
    1: ReadReq_Options_StreamOption.stream,
    2: ReadReq_Options_StreamOption.all,
    0: ReadReq_Options_StreamOption.notSet
  };
  static const $core.Map<$core.int, ReadReq_Options_CountOption>
      _ReadReq_Options_CountOptionByTag = {
    5: ReadReq_Options_CountOption.count,
    6: ReadReq_Options_CountOption.subscription,
    0: ReadReq_Options_CountOption.notSet
  };
  static const $core.Map<$core.int, ReadReq_Options_FilterOption>
      _ReadReq_Options_FilterOptionByTag = {
    7: ReadReq_Options_FilterOption.filter,
    8: ReadReq_Options_FilterOption.noFilter,
    0: ReadReq_Options_FilterOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..oo(1, [5, 6])
    ..oo(2, [7, 8])
    ..aOM<ReadReq_Options_StreamOptions>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stream',
        subBuilder: ReadReq_Options_StreamOptions.create)
    ..aOM<ReadReq_Options_AllOptions>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'all',
        subBuilder: ReadReq_Options_AllOptions.create)
    ..e<ReadReq_Options_ReadDirection>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'readDirection',
        $pb.PbFieldType.OE,
        defaultOrMaker: ReadReq_Options_ReadDirection.Forwards,
        valueOf: ReadReq_Options_ReadDirection.valueOf,
        enumValues: ReadReq_Options_ReadDirection.values)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resolveLinks')
    ..a<$fixnum.Int64>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<ReadReq_Options_SubscriptionOptions>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscription',
        subBuilder: ReadReq_Options_SubscriptionOptions.create)
    ..aOM<ReadReq_Options_FilterOptions>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filter',
        subBuilder: ReadReq_Options_FilterOptions.create)
    ..aOM<$1.Empty>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noFilter',
        subBuilder: $1.Empty.create)
    ..aOM<ReadReq_Options_UUIDOption>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuidOption',
        subBuilder: ReadReq_Options_UUIDOption.create)
    ..aOM<ReadReq_Options_ControlOption>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'controlOption',
        subBuilder: ReadReq_Options_ControlOption.create)
    ..hasRequiredFields = false;

  ReadReq_Options._() : super();
  factory ReadReq_Options({
    ReadReq_Options_StreamOptions? stream,
    ReadReq_Options_AllOptions? all,
    ReadReq_Options_ReadDirection? readDirection,
    $core.bool? resolveLinks,
    $fixnum.Int64? count,
    ReadReq_Options_SubscriptionOptions? subscription,
    ReadReq_Options_FilterOptions? filter,
    $1.Empty? noFilter,
    ReadReq_Options_UUIDOption? uuidOption,
    ReadReq_Options_ControlOption? controlOption,
  }) {
    final _result = create();
    if (stream != null) {
      _result.stream = stream;
    }
    if (all != null) {
      _result.all = all;
    }
    if (readDirection != null) {
      _result.readDirection = readDirection;
    }
    if (resolveLinks != null) {
      _result.resolveLinks = resolveLinks;
    }
    if (count != null) {
      _result.count = count;
    }
    if (subscription != null) {
      _result.subscription = subscription;
    }
    if (filter != null) {
      _result.filter = filter;
    }
    if (noFilter != null) {
      _result.noFilter = noFilter;
    }
    if (uuidOption != null) {
      _result.uuidOption = uuidOption;
    }
    if (controlOption != null) {
      _result.controlOption = controlOption;
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

  ReadReq_Options_CountOption whichCountOption() =>
      _ReadReq_Options_CountOptionByTag[$_whichOneof(1)]!;
  void clearCountOption() => clearField($_whichOneof(1));

  ReadReq_Options_FilterOption whichFilterOption() =>
      _ReadReq_Options_FilterOptionByTag[$_whichOneof(2)]!;
  void clearFilterOption() => clearField($_whichOneof(2));

  @$pb.TagNumber(1)
  ReadReq_Options_StreamOptions get stream => $_getN(0);
  @$pb.TagNumber(1)
  set stream(ReadReq_Options_StreamOptions v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStream() => $_has(0);
  @$pb.TagNumber(1)
  void clearStream() => clearField(1);
  @$pb.TagNumber(1)
  ReadReq_Options_StreamOptions ensureStream() => $_ensure(0);

  @$pb.TagNumber(2)
  ReadReq_Options_AllOptions get all => $_getN(1);
  @$pb.TagNumber(2)
  set all(ReadReq_Options_AllOptions v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAll() => $_has(1);
  @$pb.TagNumber(2)
  void clearAll() => clearField(2);
  @$pb.TagNumber(2)
  ReadReq_Options_AllOptions ensureAll() => $_ensure(1);

  @$pb.TagNumber(3)
  ReadReq_Options_ReadDirection get readDirection => $_getN(2);
  @$pb.TagNumber(3)
  set readDirection(ReadReq_Options_ReadDirection v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReadDirection() => $_has(2);
  @$pb.TagNumber(3)
  void clearReadDirection() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get resolveLinks => $_getBF(3);
  @$pb.TagNumber(4)
  set resolveLinks($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasResolveLinks() => $_has(3);
  @$pb.TagNumber(4)
  void clearResolveLinks() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get count => $_getI64(4);
  @$pb.TagNumber(5)
  set count($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearCount() => clearField(5);

  @$pb.TagNumber(6)
  ReadReq_Options_SubscriptionOptions get subscription => $_getN(5);
  @$pb.TagNumber(6)
  set subscription(ReadReq_Options_SubscriptionOptions v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSubscription() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubscription() => clearField(6);
  @$pb.TagNumber(6)
  ReadReq_Options_SubscriptionOptions ensureSubscription() => $_ensure(5);

  @$pb.TagNumber(7)
  ReadReq_Options_FilterOptions get filter => $_getN(6);
  @$pb.TagNumber(7)
  set filter(ReadReq_Options_FilterOptions v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFilter() => $_has(6);
  @$pb.TagNumber(7)
  void clearFilter() => clearField(7);
  @$pb.TagNumber(7)
  ReadReq_Options_FilterOptions ensureFilter() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Empty get noFilter => $_getN(7);
  @$pb.TagNumber(8)
  set noFilter($1.Empty v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasNoFilter() => $_has(7);
  @$pb.TagNumber(8)
  void clearNoFilter() => clearField(8);
  @$pb.TagNumber(8)
  $1.Empty ensureNoFilter() => $_ensure(7);

  @$pb.TagNumber(9)
  ReadReq_Options_UUIDOption get uuidOption => $_getN(8);
  @$pb.TagNumber(9)
  set uuidOption(ReadReq_Options_UUIDOption v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasUuidOption() => $_has(8);
  @$pb.TagNumber(9)
  void clearUuidOption() => clearField(9);
  @$pb.TagNumber(9)
  ReadReq_Options_UUIDOption ensureUuidOption() => $_ensure(8);

  @$pb.TagNumber(10)
  ReadReq_Options_ControlOption get controlOption => $_getN(9);
  @$pb.TagNumber(10)
  set controlOption(ReadReq_Options_ControlOption v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasControlOption() => $_has(9);
  @$pb.TagNumber(10)
  void clearControlOption() => clearField(10);
  @$pb.TagNumber(10)
  ReadReq_Options_ControlOption ensureControlOption() => $_ensure(9);
}

class ReadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..aOM<ReadReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: ReadReq_Options.create)
    ..hasRequiredFields = false;

  ReadReq._() : super();
  factory ReadReq({
    ReadReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
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
}

class ReadResp_ReadEvent_RecordedEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp.ReadEvent.RecordedEvent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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
        packageName: const $pb.PackageName('event_store.client.streams'))
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

class ReadResp_ReadEvent extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadResp_ReadEvent_Position>
      _ReadResp_ReadEvent_PositionByTag = {
    3: ReadResp_ReadEvent_Position.commitPosition,
    4: ReadResp_ReadEvent_Position.noPosition,
    0: ReadResp_ReadEvent_Position.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp.ReadEvent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
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
    ..hasRequiredFields = false;

  ReadResp_ReadEvent._() : super();
  factory ReadResp_ReadEvent({
    ReadResp_ReadEvent_RecordedEvent? event,
    ReadResp_ReadEvent_RecordedEvent? link,
    $fixnum.Int64? commitPosition,
    $1.Empty? noPosition,
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
}

class ReadResp_SubscriptionConfirmation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp.SubscriptionConfirmation',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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

class ReadResp_Checkpoint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp.Checkpoint',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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

  ReadResp_Checkpoint._() : super();
  factory ReadResp_Checkpoint({
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
  factory ReadResp_Checkpoint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadResp_Checkpoint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadResp_Checkpoint clone() => ReadResp_Checkpoint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadResp_Checkpoint copyWith(void Function(ReadResp_Checkpoint) updates) =>
      super.copyWith((message) => updates(message as ReadResp_Checkpoint))
          as ReadResp_Checkpoint; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadResp_Checkpoint create() => ReadResp_Checkpoint._();
  ReadResp_Checkpoint createEmptyInstance() => create();
  static $pb.PbList<ReadResp_Checkpoint> createRepeated() =>
      $pb.PbList<ReadResp_Checkpoint>();
  @$core.pragma('dart2js:noInline')
  static ReadResp_Checkpoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadResp_Checkpoint>(create);
  static ReadResp_Checkpoint? _defaultInstance;

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

class ReadResp_StreamNotFound extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp.StreamNotFound',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..aOM<$1.StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..hasRequiredFields = false;

  ReadResp_StreamNotFound._() : super();
  factory ReadResp_StreamNotFound({
    $1.StreamIdentifier? streamIdentifier,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    return _result;
  }
  factory ReadResp_StreamNotFound.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadResp_StreamNotFound.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadResp_StreamNotFound clone() =>
      ReadResp_StreamNotFound()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadResp_StreamNotFound copyWith(
          void Function(ReadResp_StreamNotFound) updates) =>
      super.copyWith((message) => updates(message as ReadResp_StreamNotFound))
          as ReadResp_StreamNotFound; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReadResp_StreamNotFound create() => ReadResp_StreamNotFound._();
  ReadResp_StreamNotFound createEmptyInstance() => create();
  static $pb.PbList<ReadResp_StreamNotFound> createRepeated() =>
      $pb.PbList<ReadResp_StreamNotFound>();
  @$core.pragma('dart2js:noInline')
  static ReadResp_StreamNotFound getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadResp_StreamNotFound>(create);
  static ReadResp_StreamNotFound? _defaultInstance;

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
}

enum ReadResp_Content {
  event,
  confirmation,
  checkpoint,
  streamNotFound,
  firstStreamPosition,
  lastStreamPosition,
  lastAllStreamPosition,
  notSet
}

class ReadResp extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ReadResp_Content> _ReadResp_ContentByTag = {
    1: ReadResp_Content.event,
    2: ReadResp_Content.confirmation,
    3: ReadResp_Content.checkpoint,
    4: ReadResp_Content.streamNotFound,
    5: ReadResp_Content.firstStreamPosition,
    6: ReadResp_Content.lastStreamPosition,
    7: ReadResp_Content.lastAllStreamPosition,
    0: ReadResp_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ReadResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7])
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
            : 'confirmation',
        subBuilder: ReadResp_SubscriptionConfirmation.create)
    ..aOM<ReadResp_Checkpoint>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkpoint',
        subBuilder: ReadResp_Checkpoint.create)
    ..aOM<ReadResp_StreamNotFound>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamNotFound',
        subBuilder: ReadResp_StreamNotFound.create)
    ..a<$fixnum.Int64>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'firstStreamPosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastStreamPosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.AllStreamPosition>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastAllStreamPosition',
        subBuilder: $1.AllStreamPosition.create)
    ..hasRequiredFields = false;

  ReadResp._() : super();
  factory ReadResp({
    ReadResp_ReadEvent? event,
    ReadResp_SubscriptionConfirmation? confirmation,
    ReadResp_Checkpoint? checkpoint,
    ReadResp_StreamNotFound? streamNotFound,
    $fixnum.Int64? firstStreamPosition,
    $fixnum.Int64? lastStreamPosition,
    $1.AllStreamPosition? lastAllStreamPosition,
  }) {
    final _result = create();
    if (event != null) {
      _result.event = event;
    }
    if (confirmation != null) {
      _result.confirmation = confirmation;
    }
    if (checkpoint != null) {
      _result.checkpoint = checkpoint;
    }
    if (streamNotFound != null) {
      _result.streamNotFound = streamNotFound;
    }
    if (firstStreamPosition != null) {
      _result.firstStreamPosition = firstStreamPosition;
    }
    if (lastStreamPosition != null) {
      _result.lastStreamPosition = lastStreamPosition;
    }
    if (lastAllStreamPosition != null) {
      _result.lastAllStreamPosition = lastAllStreamPosition;
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
  ReadResp_SubscriptionConfirmation get confirmation => $_getN(1);
  @$pb.TagNumber(2)
  set confirmation(ReadResp_SubscriptionConfirmation v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConfirmation() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfirmation() => clearField(2);
  @$pb.TagNumber(2)
  ReadResp_SubscriptionConfirmation ensureConfirmation() => $_ensure(1);

  @$pb.TagNumber(3)
  ReadResp_Checkpoint get checkpoint => $_getN(2);
  @$pb.TagNumber(3)
  set checkpoint(ReadResp_Checkpoint v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCheckpoint() => $_has(2);
  @$pb.TagNumber(3)
  void clearCheckpoint() => clearField(3);
  @$pb.TagNumber(3)
  ReadResp_Checkpoint ensureCheckpoint() => $_ensure(2);

  @$pb.TagNumber(4)
  ReadResp_StreamNotFound get streamNotFound => $_getN(3);
  @$pb.TagNumber(4)
  set streamNotFound(ReadResp_StreamNotFound v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStreamNotFound() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamNotFound() => clearField(4);
  @$pb.TagNumber(4)
  ReadResp_StreamNotFound ensureStreamNotFound() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get firstStreamPosition => $_getI64(4);
  @$pb.TagNumber(5)
  set firstStreamPosition($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFirstStreamPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstStreamPosition() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastStreamPosition => $_getI64(5);
  @$pb.TagNumber(6)
  set lastStreamPosition($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLastStreamPosition() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastStreamPosition() => clearField(6);

  @$pb.TagNumber(7)
  $1.AllStreamPosition get lastAllStreamPosition => $_getN(6);
  @$pb.TagNumber(7)
  set lastAllStreamPosition($1.AllStreamPosition v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLastAllStreamPosition() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastAllStreamPosition() => clearField(7);
  @$pb.TagNumber(7)
  $1.AllStreamPosition ensureLastAllStreamPosition() => $_ensure(6);
}

enum AppendReq_Options_ExpectedStreamRevision {
  revision,
  noStream,
  any,
  streamExists,
  notSet
}

class AppendReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, AppendReq_Options_ExpectedStreamRevision>
      _AppendReq_Options_ExpectedStreamRevisionByTag = {
    2: AppendReq_Options_ExpectedStreamRevision.revision,
    3: AppendReq_Options_ExpectedStreamRevision.noStream,
    4: AppendReq_Options_ExpectedStreamRevision.any,
    5: AppendReq_Options_ExpectedStreamRevision.streamExists,
    0: AppendReq_Options_ExpectedStreamRevision.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AppendReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5])
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
            : 'noStream',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'any',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamExists',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  AppendReq_Options._() : super();
  factory AppendReq_Options({
    $1.StreamIdentifier? streamIdentifier,
    $fixnum.Int64? revision,
    $1.Empty? noStream,
    $1.Empty? any,
    $1.Empty? streamExists,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (revision != null) {
      _result.revision = revision;
    }
    if (noStream != null) {
      _result.noStream = noStream;
    }
    if (any != null) {
      _result.any = any;
    }
    if (streamExists != null) {
      _result.streamExists = streamExists;
    }
    return _result;
  }
  factory AppendReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AppendReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppendReq_Options clone() => AppendReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppendReq_Options copyWith(void Function(AppendReq_Options) updates) =>
      super.copyWith((message) => updates(message as AppendReq_Options))
          as AppendReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppendReq_Options create() => AppendReq_Options._();
  AppendReq_Options createEmptyInstance() => create();
  static $pb.PbList<AppendReq_Options> createRepeated() =>
      $pb.PbList<AppendReq_Options>();
  @$core.pragma('dart2js:noInline')
  static AppendReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppendReq_Options>(create);
  static AppendReq_Options? _defaultInstance;

  AppendReq_Options_ExpectedStreamRevision whichExpectedStreamRevision() =>
      _AppendReq_Options_ExpectedStreamRevisionByTag[$_whichOneof(0)]!;
  void clearExpectedStreamRevision() => clearField($_whichOneof(0));

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
  $1.Empty get noStream => $_getN(2);
  @$pb.TagNumber(3)
  set noStream($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNoStream() => $_has(2);
  @$pb.TagNumber(3)
  void clearNoStream() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureNoStream() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Empty get any => $_getN(3);
  @$pb.TagNumber(4)
  set any($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAny() => $_has(3);
  @$pb.TagNumber(4)
  void clearAny() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureAny() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Empty get streamExists => $_getN(4);
  @$pb.TagNumber(5)
  set streamExists($1.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStreamExists() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamExists() => clearField(5);
  @$pb.TagNumber(5)
  $1.Empty ensureStreamExists() => $_ensure(4);
}

class AppendReq_ProposedMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AppendReq.ProposedMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        subBuilder: $1.UUID.create)
    ..m<$core.String, $core.String>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'metadata',
        entryClassName: 'AppendReq.ProposedMessage.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('event_store.client.streams'))
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'customMetadata',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  AppendReq_ProposedMessage._() : super();
  factory AppendReq_ProposedMessage({
    $1.UUID? id,
    $core.Map<$core.String, $core.String>? metadata,
    $core.List<$core.int>? customMetadata,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
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
  factory AppendReq_ProposedMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AppendReq_ProposedMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppendReq_ProposedMessage clone() =>
      AppendReq_ProposedMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppendReq_ProposedMessage copyWith(
          void Function(AppendReq_ProposedMessage) updates) =>
      super.copyWith((message) => updates(message as AppendReq_ProposedMessage))
          as AppendReq_ProposedMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppendReq_ProposedMessage create() => AppendReq_ProposedMessage._();
  AppendReq_ProposedMessage createEmptyInstance() => create();
  static $pb.PbList<AppendReq_ProposedMessage> createRepeated() =>
      $pb.PbList<AppendReq_ProposedMessage>();
  @$core.pragma('dart2js:noInline')
  static AppendReq_ProposedMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppendReq_ProposedMessage>(create);
  static AppendReq_ProposedMessage? _defaultInstance;

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
  $core.Map<$core.String, $core.String> get metadata => $_getMap(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get customMetadata => $_getN(2);
  @$pb.TagNumber(3)
  set customMetadata($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCustomMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomMetadata() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
}

enum AppendReq_Content { options, proposedMessage, notSet }

class AppendReq extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, AppendReq_Content> _AppendReq_ContentByTag =
      {
    1: AppendReq_Content.options,
    2: AppendReq_Content.proposedMessage,
    0: AppendReq_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AppendReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<AppendReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: AppendReq_Options.create)
    ..aOM<AppendReq_ProposedMessage>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'proposedMessage',
        subBuilder: AppendReq_ProposedMessage.create)
    ..hasRequiredFields = false;

  AppendReq._() : super();
  factory AppendReq({
    AppendReq_Options? options,
    AppendReq_ProposedMessage? proposedMessage,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    if (proposedMessage != null) {
      _result.proposedMessage = proposedMessage;
    }
    return _result;
  }
  factory AppendReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AppendReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppendReq clone() => AppendReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppendReq copyWith(void Function(AppendReq) updates) =>
      super.copyWith((message) => updates(message as AppendReq))
          as AppendReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppendReq create() => AppendReq._();
  AppendReq createEmptyInstance() => create();
  static $pb.PbList<AppendReq> createRepeated() => $pb.PbList<AppendReq>();
  @$core.pragma('dart2js:noInline')
  static AppendReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppendReq>(create);
  static AppendReq? _defaultInstance;

  AppendReq_Content whichContent() => _AppendReq_ContentByTag[$_whichOneof(0)]!;
  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  AppendReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(AppendReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  AppendReq_Options ensureOptions() => $_ensure(0);

  @$pb.TagNumber(2)
  AppendReq_ProposedMessage get proposedMessage => $_getN(1);
  @$pb.TagNumber(2)
  set proposedMessage(AppendReq_ProposedMessage v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasProposedMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearProposedMessage() => clearField(2);
  @$pb.TagNumber(2)
  AppendReq_ProposedMessage ensureProposedMessage() => $_ensure(1);
}

class AppendResp_Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AppendResp.Position',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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

  AppendResp_Position._() : super();
  factory AppendResp_Position({
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
  factory AppendResp_Position.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AppendResp_Position.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppendResp_Position clone() => AppendResp_Position()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppendResp_Position copyWith(void Function(AppendResp_Position) updates) =>
      super.copyWith((message) => updates(message as AppendResp_Position))
          as AppendResp_Position; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppendResp_Position create() => AppendResp_Position._();
  AppendResp_Position createEmptyInstance() => create();
  static $pb.PbList<AppendResp_Position> createRepeated() =>
      $pb.PbList<AppendResp_Position>();
  @$core.pragma('dart2js:noInline')
  static AppendResp_Position getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppendResp_Position>(create);
  static AppendResp_Position? _defaultInstance;

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

enum AppendResp_Success_CurrentRevisionOption {
  currentRevision,
  noStream,
  notSet
}

enum AppendResp_Success_PositionOption { position, noPosition, notSet }

class AppendResp_Success extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, AppendResp_Success_CurrentRevisionOption>
      _AppendResp_Success_CurrentRevisionOptionByTag = {
    1: AppendResp_Success_CurrentRevisionOption.currentRevision,
    2: AppendResp_Success_CurrentRevisionOption.noStream,
    0: AppendResp_Success_CurrentRevisionOption.notSet
  };
  static const $core.Map<$core.int, AppendResp_Success_PositionOption>
      _AppendResp_Success_PositionOptionByTag = {
    3: AppendResp_Success_PositionOption.position,
    4: AppendResp_Success_PositionOption.noPosition,
    0: AppendResp_Success_PositionOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AppendResp.Success',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..oo(1, [3, 4])
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentRevision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noStream',
        subBuilder: $1.Empty.create)
    ..aOM<AppendResp_Position>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        subBuilder: AppendResp_Position.create)
    ..aOM<$1.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noPosition',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  AppendResp_Success._() : super();
  factory AppendResp_Success({
    $fixnum.Int64? currentRevision,
    $1.Empty? noStream,
    AppendResp_Position? position,
    $1.Empty? noPosition,
  }) {
    final _result = create();
    if (currentRevision != null) {
      _result.currentRevision = currentRevision;
    }
    if (noStream != null) {
      _result.noStream = noStream;
    }
    if (position != null) {
      _result.position = position;
    }
    if (noPosition != null) {
      _result.noPosition = noPosition;
    }
    return _result;
  }
  factory AppendResp_Success.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AppendResp_Success.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppendResp_Success clone() => AppendResp_Success()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppendResp_Success copyWith(void Function(AppendResp_Success) updates) =>
      super.copyWith((message) => updates(message as AppendResp_Success))
          as AppendResp_Success; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppendResp_Success create() => AppendResp_Success._();
  AppendResp_Success createEmptyInstance() => create();
  static $pb.PbList<AppendResp_Success> createRepeated() =>
      $pb.PbList<AppendResp_Success>();
  @$core.pragma('dart2js:noInline')
  static AppendResp_Success getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppendResp_Success>(create);
  static AppendResp_Success? _defaultInstance;

  AppendResp_Success_CurrentRevisionOption whichCurrentRevisionOption() =>
      _AppendResp_Success_CurrentRevisionOptionByTag[$_whichOneof(0)]!;
  void clearCurrentRevisionOption() => clearField($_whichOneof(0));

  AppendResp_Success_PositionOption whichPositionOption() =>
      _AppendResp_Success_PositionOptionByTag[$_whichOneof(1)]!;
  void clearPositionOption() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $fixnum.Int64 get currentRevision => $_getI64(0);
  @$pb.TagNumber(1)
  set currentRevision($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrentRevision() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentRevision() => clearField(1);

  @$pb.TagNumber(2)
  $1.Empty get noStream => $_getN(1);
  @$pb.TagNumber(2)
  set noStream($1.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNoStream() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoStream() => clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureNoStream() => $_ensure(1);

  @$pb.TagNumber(3)
  AppendResp_Position get position => $_getN(2);
  @$pb.TagNumber(3)
  set position(AppendResp_Position v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);
  @$pb.TagNumber(3)
  AppendResp_Position ensurePosition() => $_ensure(2);

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
}

enum AppendResp_WrongExpectedVersion_CurrentRevisionOption2060 {
  currentRevision2060,
  noStream2060,
  notSet
}

enum AppendResp_WrongExpectedVersion_ExpectedRevisionOption2060 {
  expectedRevision2060,
  any2060,
  streamExists2060,
  notSet
}

enum AppendResp_WrongExpectedVersion_CurrentRevisionOption {
  currentRevision,
  currentNoStream,
  notSet
}

enum AppendResp_WrongExpectedVersion_ExpectedRevisionOption {
  expectedRevision,
  expectedAny,
  expectedStreamExists,
  expectedNoStream,
  notSet
}

class AppendResp_WrongExpectedVersion extends $pb.GeneratedMessage {
  static const $core.Map<$core.int,
          AppendResp_WrongExpectedVersion_CurrentRevisionOption2060>
      _AppendResp_WrongExpectedVersion_CurrentRevisionOption2060ByTag = {
    1: AppendResp_WrongExpectedVersion_CurrentRevisionOption2060
        .currentRevision2060,
    2: AppendResp_WrongExpectedVersion_CurrentRevisionOption2060.noStream2060,
    0: AppendResp_WrongExpectedVersion_CurrentRevisionOption2060.notSet
  };
  static const $core.Map<$core.int,
          AppendResp_WrongExpectedVersion_ExpectedRevisionOption2060>
      _AppendResp_WrongExpectedVersion_ExpectedRevisionOption2060ByTag = {
    3: AppendResp_WrongExpectedVersion_ExpectedRevisionOption2060
        .expectedRevision2060,
    4: AppendResp_WrongExpectedVersion_ExpectedRevisionOption2060.any2060,
    5: AppendResp_WrongExpectedVersion_ExpectedRevisionOption2060
        .streamExists2060,
    0: AppendResp_WrongExpectedVersion_ExpectedRevisionOption2060.notSet
  };
  static const $core
          .Map<$core.int, AppendResp_WrongExpectedVersion_CurrentRevisionOption>
      _AppendResp_WrongExpectedVersion_CurrentRevisionOptionByTag = {
    6: AppendResp_WrongExpectedVersion_CurrentRevisionOption.currentRevision,
    7: AppendResp_WrongExpectedVersion_CurrentRevisionOption.currentNoStream,
    0: AppendResp_WrongExpectedVersion_CurrentRevisionOption.notSet
  };
  static const $core.Map<$core.int,
          AppendResp_WrongExpectedVersion_ExpectedRevisionOption>
      _AppendResp_WrongExpectedVersion_ExpectedRevisionOptionByTag = {
    8: AppendResp_WrongExpectedVersion_ExpectedRevisionOption.expectedRevision,
    9: AppendResp_WrongExpectedVersion_ExpectedRevisionOption.expectedAny,
    10: AppendResp_WrongExpectedVersion_ExpectedRevisionOption
        .expectedStreamExists,
    11: AppendResp_WrongExpectedVersion_ExpectedRevisionOption.expectedNoStream,
    0: AppendResp_WrongExpectedVersion_ExpectedRevisionOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AppendResp.WrongExpectedVersion',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..oo(1, [3, 4, 5])
    ..oo(2, [6, 7])
    ..oo(3, [8, 9, 10, 11])
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentRevision2060',
        $pb.PbFieldType.OU6,
        protoName: 'current_revision_20_6_0',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noStream2060',
        protoName: 'no_stream_20_6_0',
        subBuilder: $1.Empty.create)
    ..a<$fixnum.Int64>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expectedRevision2060',
        $pb.PbFieldType.OU6,
        protoName: 'expected_revision_20_6_0',
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'any2060',
        protoName: 'any_20_6_0',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamExists2060',
        protoName: 'stream_exists_20_6_0',
        subBuilder: $1.Empty.create)
    ..a<$fixnum.Int64>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentRevision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Empty>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentNoStream',
        subBuilder: $1.Empty.create)
    ..a<$fixnum.Int64>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expectedRevision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Empty>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expectedAny',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expectedStreamExists',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expectedNoStream',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  AppendResp_WrongExpectedVersion._() : super();
  factory AppendResp_WrongExpectedVersion({
    $fixnum.Int64? currentRevision2060,
    $1.Empty? noStream2060,
    $fixnum.Int64? expectedRevision2060,
    $1.Empty? any2060,
    $1.Empty? streamExists2060,
    $fixnum.Int64? currentRevision,
    $1.Empty? currentNoStream,
    $fixnum.Int64? expectedRevision,
    $1.Empty? expectedAny,
    $1.Empty? expectedStreamExists,
    $1.Empty? expectedNoStream,
  }) {
    final _result = create();
    if (currentRevision2060 != null) {
      _result.currentRevision2060 = currentRevision2060;
    }
    if (noStream2060 != null) {
      _result.noStream2060 = noStream2060;
    }
    if (expectedRevision2060 != null) {
      _result.expectedRevision2060 = expectedRevision2060;
    }
    if (any2060 != null) {
      _result.any2060 = any2060;
    }
    if (streamExists2060 != null) {
      _result.streamExists2060 = streamExists2060;
    }
    if (currentRevision != null) {
      _result.currentRevision = currentRevision;
    }
    if (currentNoStream != null) {
      _result.currentNoStream = currentNoStream;
    }
    if (expectedRevision != null) {
      _result.expectedRevision = expectedRevision;
    }
    if (expectedAny != null) {
      _result.expectedAny = expectedAny;
    }
    if (expectedStreamExists != null) {
      _result.expectedStreamExists = expectedStreamExists;
    }
    if (expectedNoStream != null) {
      _result.expectedNoStream = expectedNoStream;
    }
    return _result;
  }
  factory AppendResp_WrongExpectedVersion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AppendResp_WrongExpectedVersion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppendResp_WrongExpectedVersion clone() =>
      AppendResp_WrongExpectedVersion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppendResp_WrongExpectedVersion copyWith(
          void Function(AppendResp_WrongExpectedVersion) updates) =>
      super.copyWith(
              (message) => updates(message as AppendResp_WrongExpectedVersion))
          as AppendResp_WrongExpectedVersion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppendResp_WrongExpectedVersion create() =>
      AppendResp_WrongExpectedVersion._();
  AppendResp_WrongExpectedVersion createEmptyInstance() => create();
  static $pb.PbList<AppendResp_WrongExpectedVersion> createRepeated() =>
      $pb.PbList<AppendResp_WrongExpectedVersion>();
  @$core.pragma('dart2js:noInline')
  static AppendResp_WrongExpectedVersion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppendResp_WrongExpectedVersion>(
          create);
  static AppendResp_WrongExpectedVersion? _defaultInstance;

  AppendResp_WrongExpectedVersion_CurrentRevisionOption2060
      whichCurrentRevisionOption2060() =>
          _AppendResp_WrongExpectedVersion_CurrentRevisionOption2060ByTag[
              $_whichOneof(0)]!;
  void clearCurrentRevisionOption2060() => clearField($_whichOneof(0));

  AppendResp_WrongExpectedVersion_ExpectedRevisionOption2060
      whichExpectedRevisionOption2060() =>
          _AppendResp_WrongExpectedVersion_ExpectedRevisionOption2060ByTag[
              $_whichOneof(1)]!;
  void clearExpectedRevisionOption2060() => clearField($_whichOneof(1));

  AppendResp_WrongExpectedVersion_CurrentRevisionOption
      whichCurrentRevisionOption() =>
          _AppendResp_WrongExpectedVersion_CurrentRevisionOptionByTag[
              $_whichOneof(2)]!;
  void clearCurrentRevisionOption() => clearField($_whichOneof(2));

  AppendResp_WrongExpectedVersion_ExpectedRevisionOption
      whichExpectedRevisionOption() =>
          _AppendResp_WrongExpectedVersion_ExpectedRevisionOptionByTag[
              $_whichOneof(3)]!;
  void clearExpectedRevisionOption() => clearField($_whichOneof(3));

  @$pb.TagNumber(1)
  $fixnum.Int64 get currentRevision2060 => $_getI64(0);
  @$pb.TagNumber(1)
  set currentRevision2060($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrentRevision2060() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentRevision2060() => clearField(1);

  @$pb.TagNumber(2)
  $1.Empty get noStream2060 => $_getN(1);
  @$pb.TagNumber(2)
  set noStream2060($1.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNoStream2060() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoStream2060() => clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureNoStream2060() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expectedRevision2060 => $_getI64(2);
  @$pb.TagNumber(3)
  set expectedRevision2060($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExpectedRevision2060() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpectedRevision2060() => clearField(3);

  @$pb.TagNumber(4)
  $1.Empty get any2060 => $_getN(3);
  @$pb.TagNumber(4)
  set any2060($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAny2060() => $_has(3);
  @$pb.TagNumber(4)
  void clearAny2060() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureAny2060() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Empty get streamExists2060 => $_getN(4);
  @$pb.TagNumber(5)
  set streamExists2060($1.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStreamExists2060() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamExists2060() => clearField(5);
  @$pb.TagNumber(5)
  $1.Empty ensureStreamExists2060() => $_ensure(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get currentRevision => $_getI64(5);
  @$pb.TagNumber(6)
  set currentRevision($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCurrentRevision() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrentRevision() => clearField(6);

  @$pb.TagNumber(7)
  $1.Empty get currentNoStream => $_getN(6);
  @$pb.TagNumber(7)
  set currentNoStream($1.Empty v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCurrentNoStream() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentNoStream() => clearField(7);
  @$pb.TagNumber(7)
  $1.Empty ensureCurrentNoStream() => $_ensure(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get expectedRevision => $_getI64(7);
  @$pb.TagNumber(8)
  set expectedRevision($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasExpectedRevision() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpectedRevision() => clearField(8);

  @$pb.TagNumber(9)
  $1.Empty get expectedAny => $_getN(8);
  @$pb.TagNumber(9)
  set expectedAny($1.Empty v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasExpectedAny() => $_has(8);
  @$pb.TagNumber(9)
  void clearExpectedAny() => clearField(9);
  @$pb.TagNumber(9)
  $1.Empty ensureExpectedAny() => $_ensure(8);

  @$pb.TagNumber(10)
  $1.Empty get expectedStreamExists => $_getN(9);
  @$pb.TagNumber(10)
  set expectedStreamExists($1.Empty v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasExpectedStreamExists() => $_has(9);
  @$pb.TagNumber(10)
  void clearExpectedStreamExists() => clearField(10);
  @$pb.TagNumber(10)
  $1.Empty ensureExpectedStreamExists() => $_ensure(9);

  @$pb.TagNumber(11)
  $1.Empty get expectedNoStream => $_getN(10);
  @$pb.TagNumber(11)
  set expectedNoStream($1.Empty v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasExpectedNoStream() => $_has(10);
  @$pb.TagNumber(11)
  void clearExpectedNoStream() => clearField(11);
  @$pb.TagNumber(11)
  $1.Empty ensureExpectedNoStream() => $_ensure(10);
}

enum AppendResp_Result { success, wrongExpectedVersion, notSet }

class AppendResp extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, AppendResp_Result> _AppendResp_ResultByTag =
      {
    1: AppendResp_Result.success,
    2: AppendResp_Result.wrongExpectedVersion,
    0: AppendResp_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AppendResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<AppendResp_Success>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success',
        subBuilder: AppendResp_Success.create)
    ..aOM<AppendResp_WrongExpectedVersion>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wrongExpectedVersion',
        subBuilder: AppendResp_WrongExpectedVersion.create)
    ..hasRequiredFields = false;

  AppendResp._() : super();
  factory AppendResp({
    AppendResp_Success? success,
    AppendResp_WrongExpectedVersion? wrongExpectedVersion,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (wrongExpectedVersion != null) {
      _result.wrongExpectedVersion = wrongExpectedVersion;
    }
    return _result;
  }
  factory AppendResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AppendResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AppendResp clone() => AppendResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AppendResp copyWith(void Function(AppendResp) updates) =>
      super.copyWith((message) => updates(message as AppendResp))
          as AppendResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppendResp create() => AppendResp._();
  AppendResp createEmptyInstance() => create();
  static $pb.PbList<AppendResp> createRepeated() => $pb.PbList<AppendResp>();
  @$core.pragma('dart2js:noInline')
  static AppendResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppendResp>(create);
  static AppendResp? _defaultInstance;

  AppendResp_Result whichResult() => _AppendResp_ResultByTag[$_whichOneof(0)]!;
  void clearResult() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  AppendResp_Success get success => $_getN(0);
  @$pb.TagNumber(1)
  set success(AppendResp_Success v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
  @$pb.TagNumber(1)
  AppendResp_Success ensureSuccess() => $_ensure(0);

  @$pb.TagNumber(2)
  AppendResp_WrongExpectedVersion get wrongExpectedVersion => $_getN(1);
  @$pb.TagNumber(2)
  set wrongExpectedVersion(AppendResp_WrongExpectedVersion v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWrongExpectedVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearWrongExpectedVersion() => clearField(2);
  @$pb.TagNumber(2)
  AppendResp_WrongExpectedVersion ensureWrongExpectedVersion() => $_ensure(1);
}

enum BatchAppendReq_Options_ExpectedStreamPosition {
  streamPosition,
  noStream,
  any,
  streamExists,
  notSet
}

enum BatchAppendReq_Options_DeadlineOption { deadline21100, deadline, notSet }

class BatchAppendReq_Options extends $pb.GeneratedMessage {
  static const $core
          .Map<$core.int, BatchAppendReq_Options_ExpectedStreamPosition>
      _BatchAppendReq_Options_ExpectedStreamPositionByTag = {
    2: BatchAppendReq_Options_ExpectedStreamPosition.streamPosition,
    3: BatchAppendReq_Options_ExpectedStreamPosition.noStream,
    4: BatchAppendReq_Options_ExpectedStreamPosition.any,
    5: BatchAppendReq_Options_ExpectedStreamPosition.streamExists,
    0: BatchAppendReq_Options_ExpectedStreamPosition.notSet
  };
  static const $core.Map<$core.int, BatchAppendReq_Options_DeadlineOption>
      _BatchAppendReq_Options_DeadlineOptionByTag = {
    6: BatchAppendReq_Options_DeadlineOption.deadline21100,
    7: BatchAppendReq_Options_DeadlineOption.deadline,
    0: BatchAppendReq_Options_DeadlineOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BatchAppendReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5])
    ..oo(1, [6, 7])
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
            : 'streamPosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$10.Empty>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noStream',
        subBuilder: $10.Empty.create)
    ..aOM<$10.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'any',
        subBuilder: $10.Empty.create)
    ..aOM<$10.Empty>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamExists',
        subBuilder: $10.Empty.create)
    ..aOM<$14.Timestamp>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadline21100',
        protoName: 'deadline_21_10_0',
        subBuilder: $14.Timestamp.create)
    ..aOM<$15.Duration>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadline',
        subBuilder: $15.Duration.create)
    ..hasRequiredFields = false;

  BatchAppendReq_Options._() : super();
  factory BatchAppendReq_Options({
    $1.StreamIdentifier? streamIdentifier,
    $fixnum.Int64? streamPosition,
    $10.Empty? noStream,
    $10.Empty? any,
    $10.Empty? streamExists,
    $14.Timestamp? deadline21100,
    $15.Duration? deadline,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (streamPosition != null) {
      _result.streamPosition = streamPosition;
    }
    if (noStream != null) {
      _result.noStream = noStream;
    }
    if (any != null) {
      _result.any = any;
    }
    if (streamExists != null) {
      _result.streamExists = streamExists;
    }
    if (deadline21100 != null) {
      _result.deadline21100 = deadline21100;
    }
    if (deadline != null) {
      _result.deadline = deadline;
    }
    return _result;
  }
  factory BatchAppendReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BatchAppendReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BatchAppendReq_Options clone() =>
      BatchAppendReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BatchAppendReq_Options copyWith(
          void Function(BatchAppendReq_Options) updates) =>
      super.copyWith((message) => updates(message as BatchAppendReq_Options))
          as BatchAppendReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BatchAppendReq_Options create() => BatchAppendReq_Options._();
  BatchAppendReq_Options createEmptyInstance() => create();
  static $pb.PbList<BatchAppendReq_Options> createRepeated() =>
      $pb.PbList<BatchAppendReq_Options>();
  @$core.pragma('dart2js:noInline')
  static BatchAppendReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BatchAppendReq_Options>(create);
  static BatchAppendReq_Options? _defaultInstance;

  BatchAppendReq_Options_ExpectedStreamPosition whichExpectedStreamPosition() =>
      _BatchAppendReq_Options_ExpectedStreamPositionByTag[$_whichOneof(0)]!;
  void clearExpectedStreamPosition() => clearField($_whichOneof(0));

  BatchAppendReq_Options_DeadlineOption whichDeadlineOption() =>
      _BatchAppendReq_Options_DeadlineOptionByTag[$_whichOneof(1)]!;
  void clearDeadlineOption() => clearField($_whichOneof(1));

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
  $fixnum.Int64 get streamPosition => $_getI64(1);
  @$pb.TagNumber(2)
  set streamPosition($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStreamPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreamPosition() => clearField(2);

  @$pb.TagNumber(3)
  $10.Empty get noStream => $_getN(2);
  @$pb.TagNumber(3)
  set noStream($10.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNoStream() => $_has(2);
  @$pb.TagNumber(3)
  void clearNoStream() => clearField(3);
  @$pb.TagNumber(3)
  $10.Empty ensureNoStream() => $_ensure(2);

  @$pb.TagNumber(4)
  $10.Empty get any => $_getN(3);
  @$pb.TagNumber(4)
  set any($10.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAny() => $_has(3);
  @$pb.TagNumber(4)
  void clearAny() => clearField(4);
  @$pb.TagNumber(4)
  $10.Empty ensureAny() => $_ensure(3);

  @$pb.TagNumber(5)
  $10.Empty get streamExists => $_getN(4);
  @$pb.TagNumber(5)
  set streamExists($10.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStreamExists() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamExists() => clearField(5);
  @$pb.TagNumber(5)
  $10.Empty ensureStreamExists() => $_ensure(4);

  @$pb.TagNumber(6)
  $14.Timestamp get deadline21100 => $_getN(5);
  @$pb.TagNumber(6)
  set deadline21100($14.Timestamp v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDeadline21100() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeadline21100() => clearField(6);
  @$pb.TagNumber(6)
  $14.Timestamp ensureDeadline21100() => $_ensure(5);

  @$pb.TagNumber(7)
  $15.Duration get deadline => $_getN(6);
  @$pb.TagNumber(7)
  set deadline($15.Duration v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDeadline() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeadline() => clearField(7);
  @$pb.TagNumber(7)
  $15.Duration ensureDeadline() => $_ensure(6);
}

class BatchAppendReq_ProposedMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BatchAppendReq.ProposedMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        subBuilder: $1.UUID.create)
    ..m<$core.String, $core.String>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'metadata',
        entryClassName: 'BatchAppendReq.ProposedMessage.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('event_store.client.streams'))
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'customMetadata',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  BatchAppendReq_ProposedMessage._() : super();
  factory BatchAppendReq_ProposedMessage({
    $1.UUID? id,
    $core.Map<$core.String, $core.String>? metadata,
    $core.List<$core.int>? customMetadata,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
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
  factory BatchAppendReq_ProposedMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BatchAppendReq_ProposedMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BatchAppendReq_ProposedMessage clone() =>
      BatchAppendReq_ProposedMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BatchAppendReq_ProposedMessage copyWith(
          void Function(BatchAppendReq_ProposedMessage) updates) =>
      super.copyWith(
              (message) => updates(message as BatchAppendReq_ProposedMessage))
          as BatchAppendReq_ProposedMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BatchAppendReq_ProposedMessage create() =>
      BatchAppendReq_ProposedMessage._();
  BatchAppendReq_ProposedMessage createEmptyInstance() => create();
  static $pb.PbList<BatchAppendReq_ProposedMessage> createRepeated() =>
      $pb.PbList<BatchAppendReq_ProposedMessage>();
  @$core.pragma('dart2js:noInline')
  static BatchAppendReq_ProposedMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BatchAppendReq_ProposedMessage>(create);
  static BatchAppendReq_ProposedMessage? _defaultInstance;

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
  $core.Map<$core.String, $core.String> get metadata => $_getMap(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get customMetadata => $_getN(2);
  @$pb.TagNumber(3)
  set customMetadata($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCustomMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomMetadata() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
}

class BatchAppendReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BatchAppendReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'correlationId',
        subBuilder: $1.UUID.create)
    ..aOM<BatchAppendReq_Options>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: BatchAppendReq_Options.create)
    ..pc<BatchAppendReq_ProposedMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'proposedMessages',
        $pb.PbFieldType.PM,
        subBuilder: BatchAppendReq_ProposedMessage.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isFinal')
    ..hasRequiredFields = false;

  BatchAppendReq._() : super();
  factory BatchAppendReq({
    $1.UUID? correlationId,
    BatchAppendReq_Options? options,
    $core.Iterable<BatchAppendReq_ProposedMessage>? proposedMessages,
    $core.bool? isFinal,
  }) {
    final _result = create();
    if (correlationId != null) {
      _result.correlationId = correlationId;
    }
    if (options != null) {
      _result.options = options;
    }
    if (proposedMessages != null) {
      _result.proposedMessages.addAll(proposedMessages);
    }
    if (isFinal != null) {
      _result.isFinal = isFinal;
    }
    return _result;
  }
  factory BatchAppendReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BatchAppendReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BatchAppendReq clone() => BatchAppendReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BatchAppendReq copyWith(void Function(BatchAppendReq) updates) =>
      super.copyWith((message) => updates(message as BatchAppendReq))
          as BatchAppendReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BatchAppendReq create() => BatchAppendReq._();
  BatchAppendReq createEmptyInstance() => create();
  static $pb.PbList<BatchAppendReq> createRepeated() =>
      $pb.PbList<BatchAppendReq>();
  @$core.pragma('dart2js:noInline')
  static BatchAppendReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BatchAppendReq>(create);
  static BatchAppendReq? _defaultInstance;

  @$pb.TagNumber(1)
  $1.UUID get correlationId => $_getN(0);
  @$pb.TagNumber(1)
  set correlationId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCorrelationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCorrelationId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureCorrelationId() => $_ensure(0);

  @$pb.TagNumber(2)
  BatchAppendReq_Options get options => $_getN(1);
  @$pb.TagNumber(2)
  set options(BatchAppendReq_Options v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOptions() => $_has(1);
  @$pb.TagNumber(2)
  void clearOptions() => clearField(2);
  @$pb.TagNumber(2)
  BatchAppendReq_Options ensureOptions() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<BatchAppendReq_ProposedMessage> get proposedMessages =>
      $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get isFinal => $_getBF(3);
  @$pb.TagNumber(4)
  set isFinal($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsFinal() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsFinal() => clearField(4);
}

enum BatchAppendResp_Success_CurrentRevisionOption {
  currentRevision,
  noStream,
  notSet
}

enum BatchAppendResp_Success_PositionOption { position, noPosition, notSet }

class BatchAppendResp_Success extends $pb.GeneratedMessage {
  static const $core
          .Map<$core.int, BatchAppendResp_Success_CurrentRevisionOption>
      _BatchAppendResp_Success_CurrentRevisionOptionByTag = {
    1: BatchAppendResp_Success_CurrentRevisionOption.currentRevision,
    2: BatchAppendResp_Success_CurrentRevisionOption.noStream,
    0: BatchAppendResp_Success_CurrentRevisionOption.notSet
  };
  static const $core.Map<$core.int, BatchAppendResp_Success_PositionOption>
      _BatchAppendResp_Success_PositionOptionByTag = {
    3: BatchAppendResp_Success_PositionOption.position,
    4: BatchAppendResp_Success_PositionOption.noPosition,
    0: BatchAppendResp_Success_PositionOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BatchAppendResp.Success',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..oo(1, [3, 4])
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentRevision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$10.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noStream',
        subBuilder: $10.Empty.create)
    ..aOM<$1.AllStreamPosition>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        subBuilder: $1.AllStreamPosition.create)
    ..aOM<$10.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noPosition',
        subBuilder: $10.Empty.create)
    ..hasRequiredFields = false;

  BatchAppendResp_Success._() : super();
  factory BatchAppendResp_Success({
    $fixnum.Int64? currentRevision,
    $10.Empty? noStream,
    $1.AllStreamPosition? position,
    $10.Empty? noPosition,
  }) {
    final _result = create();
    if (currentRevision != null) {
      _result.currentRevision = currentRevision;
    }
    if (noStream != null) {
      _result.noStream = noStream;
    }
    if (position != null) {
      _result.position = position;
    }
    if (noPosition != null) {
      _result.noPosition = noPosition;
    }
    return _result;
  }
  factory BatchAppendResp_Success.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BatchAppendResp_Success.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BatchAppendResp_Success clone() =>
      BatchAppendResp_Success()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BatchAppendResp_Success copyWith(
          void Function(BatchAppendResp_Success) updates) =>
      super.copyWith((message) => updates(message as BatchAppendResp_Success))
          as BatchAppendResp_Success; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BatchAppendResp_Success create() => BatchAppendResp_Success._();
  BatchAppendResp_Success createEmptyInstance() => create();
  static $pb.PbList<BatchAppendResp_Success> createRepeated() =>
      $pb.PbList<BatchAppendResp_Success>();
  @$core.pragma('dart2js:noInline')
  static BatchAppendResp_Success getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BatchAppendResp_Success>(create);
  static BatchAppendResp_Success? _defaultInstance;

  BatchAppendResp_Success_CurrentRevisionOption whichCurrentRevisionOption() =>
      _BatchAppendResp_Success_CurrentRevisionOptionByTag[$_whichOneof(0)]!;
  void clearCurrentRevisionOption() => clearField($_whichOneof(0));

  BatchAppendResp_Success_PositionOption whichPositionOption() =>
      _BatchAppendResp_Success_PositionOptionByTag[$_whichOneof(1)]!;
  void clearPositionOption() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $fixnum.Int64 get currentRevision => $_getI64(0);
  @$pb.TagNumber(1)
  set currentRevision($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrentRevision() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentRevision() => clearField(1);

  @$pb.TagNumber(2)
  $10.Empty get noStream => $_getN(1);
  @$pb.TagNumber(2)
  set noStream($10.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNoStream() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoStream() => clearField(2);
  @$pb.TagNumber(2)
  $10.Empty ensureNoStream() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.AllStreamPosition get position => $_getN(2);
  @$pb.TagNumber(3)
  set position($1.AllStreamPosition v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);
  @$pb.TagNumber(3)
  $1.AllStreamPosition ensurePosition() => $_ensure(2);

  @$pb.TagNumber(4)
  $10.Empty get noPosition => $_getN(3);
  @$pb.TagNumber(4)
  set noPosition($10.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNoPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearNoPosition() => clearField(4);
  @$pb.TagNumber(4)
  $10.Empty ensureNoPosition() => $_ensure(3);
}

enum BatchAppendResp_Result { error, success, notSet }

enum BatchAppendResp_ExpectedStreamPosition {
  streamPosition,
  noStream,
  any,
  streamExists,
  notSet
}

class BatchAppendResp extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, BatchAppendResp_Result>
      _BatchAppendResp_ResultByTag = {
    2: BatchAppendResp_Result.error,
    3: BatchAppendResp_Result.success,
    0: BatchAppendResp_Result.notSet
  };
  static const $core.Map<$core.int, BatchAppendResp_ExpectedStreamPosition>
      _BatchAppendResp_ExpectedStreamPositionByTag = {
    5: BatchAppendResp_ExpectedStreamPosition.streamPosition,
    6: BatchAppendResp_ExpectedStreamPosition.noStream,
    7: BatchAppendResp_ExpectedStreamPosition.any,
    8: BatchAppendResp_ExpectedStreamPosition.streamExists,
    0: BatchAppendResp_ExpectedStreamPosition.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BatchAppendResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..oo(1, [5, 6, 7, 8])
    ..aOM<$1.UUID>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'correlationId',
        subBuilder: $1.UUID.create)
    ..aOM<$16.Status>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'error',
        subBuilder: $16.Status.create)
    ..aOM<BatchAppendResp_Success>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success',
        subBuilder: BatchAppendResp_Success.create)
    ..aOM<$1.StreamIdentifier>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: $1.StreamIdentifier.create)
    ..a<$fixnum.Int64>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamPosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$10.Empty>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noStream',
        subBuilder: $10.Empty.create)
    ..aOM<$10.Empty>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'any',
        subBuilder: $10.Empty.create)
    ..aOM<$10.Empty>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamExists',
        subBuilder: $10.Empty.create)
    ..hasRequiredFields = false;

  BatchAppendResp._() : super();
  factory BatchAppendResp({
    $1.UUID? correlationId,
    $16.Status? error,
    BatchAppendResp_Success? success,
    $1.StreamIdentifier? streamIdentifier,
    $fixnum.Int64? streamPosition,
    $10.Empty? noStream,
    $10.Empty? any,
    $10.Empty? streamExists,
  }) {
    final _result = create();
    if (correlationId != null) {
      _result.correlationId = correlationId;
    }
    if (error != null) {
      _result.error = error;
    }
    if (success != null) {
      _result.success = success;
    }
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (streamPosition != null) {
      _result.streamPosition = streamPosition;
    }
    if (noStream != null) {
      _result.noStream = noStream;
    }
    if (any != null) {
      _result.any = any;
    }
    if (streamExists != null) {
      _result.streamExists = streamExists;
    }
    return _result;
  }
  factory BatchAppendResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BatchAppendResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BatchAppendResp clone() => BatchAppendResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BatchAppendResp copyWith(void Function(BatchAppendResp) updates) =>
      super.copyWith((message) => updates(message as BatchAppendResp))
          as BatchAppendResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BatchAppendResp create() => BatchAppendResp._();
  BatchAppendResp createEmptyInstance() => create();
  static $pb.PbList<BatchAppendResp> createRepeated() =>
      $pb.PbList<BatchAppendResp>();
  @$core.pragma('dart2js:noInline')
  static BatchAppendResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BatchAppendResp>(create);
  static BatchAppendResp? _defaultInstance;

  BatchAppendResp_Result whichResult() =>
      _BatchAppendResp_ResultByTag[$_whichOneof(0)]!;
  void clearResult() => clearField($_whichOneof(0));

  BatchAppendResp_ExpectedStreamPosition whichExpectedStreamPosition() =>
      _BatchAppendResp_ExpectedStreamPositionByTag[$_whichOneof(1)]!;
  void clearExpectedStreamPosition() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $1.UUID get correlationId => $_getN(0);
  @$pb.TagNumber(1)
  set correlationId($1.UUID v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCorrelationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCorrelationId() => clearField(1);
  @$pb.TagNumber(1)
  $1.UUID ensureCorrelationId() => $_ensure(0);

  @$pb.TagNumber(2)
  $16.Status get error => $_getN(1);
  @$pb.TagNumber(2)
  set error($16.Status v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
  @$pb.TagNumber(2)
  $16.Status ensureError() => $_ensure(1);

  @$pb.TagNumber(3)
  BatchAppendResp_Success get success => $_getN(2);
  @$pb.TagNumber(3)
  set success(BatchAppendResp_Success v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => clearField(3);
  @$pb.TagNumber(3)
  BatchAppendResp_Success ensureSuccess() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.StreamIdentifier get streamIdentifier => $_getN(3);
  @$pb.TagNumber(4)
  set streamIdentifier($1.StreamIdentifier v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStreamIdentifier() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamIdentifier() => clearField(4);
  @$pb.TagNumber(4)
  $1.StreamIdentifier ensureStreamIdentifier() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get streamPosition => $_getI64(4);
  @$pb.TagNumber(5)
  set streamPosition($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStreamPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamPosition() => clearField(5);

  @$pb.TagNumber(6)
  $10.Empty get noStream => $_getN(5);
  @$pb.TagNumber(6)
  set noStream($10.Empty v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNoStream() => $_has(5);
  @$pb.TagNumber(6)
  void clearNoStream() => clearField(6);
  @$pb.TagNumber(6)
  $10.Empty ensureNoStream() => $_ensure(5);

  @$pb.TagNumber(7)
  $10.Empty get any => $_getN(6);
  @$pb.TagNumber(7)
  set any($10.Empty v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAny() => $_has(6);
  @$pb.TagNumber(7)
  void clearAny() => clearField(7);
  @$pb.TagNumber(7)
  $10.Empty ensureAny() => $_ensure(6);

  @$pb.TagNumber(8)
  $10.Empty get streamExists => $_getN(7);
  @$pb.TagNumber(8)
  set streamExists($10.Empty v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStreamExists() => $_has(7);
  @$pb.TagNumber(8)
  void clearStreamExists() => clearField(8);
  @$pb.TagNumber(8)
  $10.Empty ensureStreamExists() => $_ensure(7);
}

enum DeleteReq_Options_ExpectedStreamRevision {
  revision,
  noStream,
  any,
  streamExists,
  notSet
}

class DeleteReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DeleteReq_Options_ExpectedStreamRevision>
      _DeleteReq_Options_ExpectedStreamRevisionByTag = {
    2: DeleteReq_Options_ExpectedStreamRevision.revision,
    3: DeleteReq_Options_ExpectedStreamRevision.noStream,
    4: DeleteReq_Options_ExpectedStreamRevision.any,
    5: DeleteReq_Options_ExpectedStreamRevision.streamExists,
    0: DeleteReq_Options_ExpectedStreamRevision.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5])
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
            : 'noStream',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'any',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamExists',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  DeleteReq_Options._() : super();
  factory DeleteReq_Options({
    $1.StreamIdentifier? streamIdentifier,
    $fixnum.Int64? revision,
    $1.Empty? noStream,
    $1.Empty? any,
    $1.Empty? streamExists,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (revision != null) {
      _result.revision = revision;
    }
    if (noStream != null) {
      _result.noStream = noStream;
    }
    if (any != null) {
      _result.any = any;
    }
    if (streamExists != null) {
      _result.streamExists = streamExists;
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

  DeleteReq_Options_ExpectedStreamRevision whichExpectedStreamRevision() =>
      _DeleteReq_Options_ExpectedStreamRevisionByTag[$_whichOneof(0)]!;
  void clearExpectedStreamRevision() => clearField($_whichOneof(0));

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
  $1.Empty get noStream => $_getN(2);
  @$pb.TagNumber(3)
  set noStream($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNoStream() => $_has(2);
  @$pb.TagNumber(3)
  void clearNoStream() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureNoStream() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Empty get any => $_getN(3);
  @$pb.TagNumber(4)
  set any($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAny() => $_has(3);
  @$pb.TagNumber(4)
  void clearAny() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureAny() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Empty get streamExists => $_getN(4);
  @$pb.TagNumber(5)
  set streamExists($1.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStreamExists() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamExists() => clearField(5);
  @$pb.TagNumber(5)
  $1.Empty ensureStreamExists() => $_ensure(4);
}

class DeleteReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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

class DeleteResp_Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteResp.Position',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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

  DeleteResp_Position._() : super();
  factory DeleteResp_Position({
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
  factory DeleteResp_Position.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeleteResp_Position.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeleteResp_Position clone() => DeleteResp_Position()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeleteResp_Position copyWith(void Function(DeleteResp_Position) updates) =>
      super.copyWith((message) => updates(message as DeleteResp_Position))
          as DeleteResp_Position; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteResp_Position create() => DeleteResp_Position._();
  DeleteResp_Position createEmptyInstance() => create();
  static $pb.PbList<DeleteResp_Position> createRepeated() =>
      $pb.PbList<DeleteResp_Position>();
  @$core.pragma('dart2js:noInline')
  static DeleteResp_Position getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteResp_Position>(create);
  static DeleteResp_Position? _defaultInstance;

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

enum DeleteResp_PositionOption { position, noPosition, notSet }

class DeleteResp extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DeleteResp_PositionOption>
      _DeleteResp_PositionOptionByTag = {
    1: DeleteResp_PositionOption.position,
    2: DeleteResp_PositionOption.noPosition,
    0: DeleteResp_PositionOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DeleteResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<DeleteResp_Position>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        subBuilder: DeleteResp_Position.create)
    ..aOM<$1.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noPosition',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  DeleteResp._() : super();
  factory DeleteResp({
    DeleteResp_Position? position,
    $1.Empty? noPosition,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (noPosition != null) {
      _result.noPosition = noPosition;
    }
    return _result;
  }
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

  DeleteResp_PositionOption whichPositionOption() =>
      _DeleteResp_PositionOptionByTag[$_whichOneof(0)]!;
  void clearPositionOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  DeleteResp_Position get position => $_getN(0);
  @$pb.TagNumber(1)
  set position(DeleteResp_Position v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);
  @$pb.TagNumber(1)
  DeleteResp_Position ensurePosition() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Empty get noPosition => $_getN(1);
  @$pb.TagNumber(2)
  set noPosition($1.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNoPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoPosition() => clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureNoPosition() => $_ensure(1);
}

enum TombstoneReq_Options_ExpectedStreamRevision {
  revision,
  noStream,
  any,
  streamExists,
  notSet
}

class TombstoneReq_Options extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TombstoneReq_Options_ExpectedStreamRevision>
      _TombstoneReq_Options_ExpectedStreamRevisionByTag = {
    2: TombstoneReq_Options_ExpectedStreamRevision.revision,
    3: TombstoneReq_Options_ExpectedStreamRevision.noStream,
    4: TombstoneReq_Options_ExpectedStreamRevision.any,
    5: TombstoneReq_Options_ExpectedStreamRevision.streamExists,
    0: TombstoneReq_Options_ExpectedStreamRevision.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TombstoneReq.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5])
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
            : 'noStream',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'any',
        subBuilder: $1.Empty.create)
    ..aOM<$1.Empty>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamExists',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  TombstoneReq_Options._() : super();
  factory TombstoneReq_Options({
    $1.StreamIdentifier? streamIdentifier,
    $fixnum.Int64? revision,
    $1.Empty? noStream,
    $1.Empty? any,
    $1.Empty? streamExists,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    if (revision != null) {
      _result.revision = revision;
    }
    if (noStream != null) {
      _result.noStream = noStream;
    }
    if (any != null) {
      _result.any = any;
    }
    if (streamExists != null) {
      _result.streamExists = streamExists;
    }
    return _result;
  }
  factory TombstoneReq_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TombstoneReq_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TombstoneReq_Options clone() =>
      TombstoneReq_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TombstoneReq_Options copyWith(void Function(TombstoneReq_Options) updates) =>
      super.copyWith((message) => updates(message as TombstoneReq_Options))
          as TombstoneReq_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TombstoneReq_Options create() => TombstoneReq_Options._();
  TombstoneReq_Options createEmptyInstance() => create();
  static $pb.PbList<TombstoneReq_Options> createRepeated() =>
      $pb.PbList<TombstoneReq_Options>();
  @$core.pragma('dart2js:noInline')
  static TombstoneReq_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TombstoneReq_Options>(create);
  static TombstoneReq_Options? _defaultInstance;

  TombstoneReq_Options_ExpectedStreamRevision whichExpectedStreamRevision() =>
      _TombstoneReq_Options_ExpectedStreamRevisionByTag[$_whichOneof(0)]!;
  void clearExpectedStreamRevision() => clearField($_whichOneof(0));

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
  $1.Empty get noStream => $_getN(2);
  @$pb.TagNumber(3)
  set noStream($1.Empty v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNoStream() => $_has(2);
  @$pb.TagNumber(3)
  void clearNoStream() => clearField(3);
  @$pb.TagNumber(3)
  $1.Empty ensureNoStream() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Empty get any => $_getN(3);
  @$pb.TagNumber(4)
  set any($1.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAny() => $_has(3);
  @$pb.TagNumber(4)
  void clearAny() => clearField(4);
  @$pb.TagNumber(4)
  $1.Empty ensureAny() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Empty get streamExists => $_getN(4);
  @$pb.TagNumber(5)
  set streamExists($1.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStreamExists() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamExists() => clearField(5);
  @$pb.TagNumber(5)
  $1.Empty ensureStreamExists() => $_ensure(4);
}

class TombstoneReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TombstoneReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..aOM<TombstoneReq_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        subBuilder: TombstoneReq_Options.create)
    ..hasRequiredFields = false;

  TombstoneReq._() : super();
  factory TombstoneReq({
    TombstoneReq_Options? options,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    return _result;
  }
  factory TombstoneReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TombstoneReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TombstoneReq clone() => TombstoneReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TombstoneReq copyWith(void Function(TombstoneReq) updates) =>
      super.copyWith((message) => updates(message as TombstoneReq))
          as TombstoneReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TombstoneReq create() => TombstoneReq._();
  TombstoneReq createEmptyInstance() => create();
  static $pb.PbList<TombstoneReq> createRepeated() =>
      $pb.PbList<TombstoneReq>();
  @$core.pragma('dart2js:noInline')
  static TombstoneReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TombstoneReq>(create);
  static TombstoneReq? _defaultInstance;

  @$pb.TagNumber(1)
  TombstoneReq_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(TombstoneReq_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  TombstoneReq_Options ensureOptions() => $_ensure(0);
}

class TombstoneResp_Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TombstoneResp.Position',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
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

  TombstoneResp_Position._() : super();
  factory TombstoneResp_Position({
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
  factory TombstoneResp_Position.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TombstoneResp_Position.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TombstoneResp_Position clone() =>
      TombstoneResp_Position()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TombstoneResp_Position copyWith(
          void Function(TombstoneResp_Position) updates) =>
      super.copyWith((message) => updates(message as TombstoneResp_Position))
          as TombstoneResp_Position; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TombstoneResp_Position create() => TombstoneResp_Position._();
  TombstoneResp_Position createEmptyInstance() => create();
  static $pb.PbList<TombstoneResp_Position> createRepeated() =>
      $pb.PbList<TombstoneResp_Position>();
  @$core.pragma('dart2js:noInline')
  static TombstoneResp_Position getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TombstoneResp_Position>(create);
  static TombstoneResp_Position? _defaultInstance;

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

enum TombstoneResp_PositionOption { position, noPosition, notSet }

class TombstoneResp extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TombstoneResp_PositionOption>
      _TombstoneResp_PositionOptionByTag = {
    1: TombstoneResp_PositionOption.position,
    2: TombstoneResp_PositionOption.noPosition,
    0: TombstoneResp_PositionOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TombstoneResp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.streams'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<TombstoneResp_Position>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        subBuilder: TombstoneResp_Position.create)
    ..aOM<$1.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noPosition',
        subBuilder: $1.Empty.create)
    ..hasRequiredFields = false;

  TombstoneResp._() : super();
  factory TombstoneResp({
    TombstoneResp_Position? position,
    $1.Empty? noPosition,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (noPosition != null) {
      _result.noPosition = noPosition;
    }
    return _result;
  }
  factory TombstoneResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TombstoneResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TombstoneResp clone() => TombstoneResp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TombstoneResp copyWith(void Function(TombstoneResp) updates) =>
      super.copyWith((message) => updates(message as TombstoneResp))
          as TombstoneResp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TombstoneResp create() => TombstoneResp._();
  TombstoneResp createEmptyInstance() => create();
  static $pb.PbList<TombstoneResp> createRepeated() =>
      $pb.PbList<TombstoneResp>();
  @$core.pragma('dart2js:noInline')
  static TombstoneResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TombstoneResp>(create);
  static TombstoneResp? _defaultInstance;

  TombstoneResp_PositionOption whichPositionOption() =>
      _TombstoneResp_PositionOptionByTag[$_whichOneof(0)]!;
  void clearPositionOption() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TombstoneResp_Position get position => $_getN(0);
  @$pb.TagNumber(1)
  set position(TombstoneResp_Position v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);
  @$pb.TagNumber(1)
  TombstoneResp_Position ensurePosition() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Empty get noPosition => $_getN(1);
  @$pb.TagNumber(2)
  set noPosition($1.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNoPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoPosition() => clearField(2);
  @$pb.TagNumber(2)
  $1.Empty ensureNoPosition() => $_ensure(1);
}
