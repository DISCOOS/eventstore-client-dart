///
//  Generated code. Do not modify.
//  source: shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/empty.pb.dart' as $9;

class UUID_Structured extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UUID.Structured',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mostSignificantBits')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leastSignificantBits')
    ..hasRequiredFields = false;

  UUID_Structured._() : super();
  factory UUID_Structured({
    $fixnum.Int64? mostSignificantBits,
    $fixnum.Int64? leastSignificantBits,
  }) {
    final _result = create();
    if (mostSignificantBits != null) {
      _result.mostSignificantBits = mostSignificantBits;
    }
    if (leastSignificantBits != null) {
      _result.leastSignificantBits = leastSignificantBits;
    }
    return _result;
  }
  factory UUID_Structured.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UUID_Structured.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UUID_Structured clone() => UUID_Structured()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UUID_Structured copyWith(void Function(UUID_Structured) updates) =>
      super.copyWith((message) => updates(message as UUID_Structured))
          as UUID_Structured; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UUID_Structured create() => UUID_Structured._();
  UUID_Structured createEmptyInstance() => create();
  static $pb.PbList<UUID_Structured> createRepeated() =>
      $pb.PbList<UUID_Structured>();
  @$core.pragma('dart2js:noInline')
  static UUID_Structured getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UUID_Structured>(create);
  static UUID_Structured? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get mostSignificantBits => $_getI64(0);
  @$pb.TagNumber(1)
  set mostSignificantBits($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMostSignificantBits() => $_has(0);
  @$pb.TagNumber(1)
  void clearMostSignificantBits() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get leastSignificantBits => $_getI64(1);
  @$pb.TagNumber(2)
  set leastSignificantBits($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeastSignificantBits() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeastSignificantBits() => clearField(2);
}

enum UUID_Value { structured, string, notSet }

class UUID extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UUID_Value> _UUID_ValueByTag = {
    1: UUID_Value.structured,
    2: UUID_Value.string,
    0: UUID_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UUID',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<UUID_Structured>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'structured',
        subBuilder: UUID_Structured.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'string')
    ..hasRequiredFields = false;

  UUID._() : super();
  factory UUID({
    UUID_Structured? structured,
    $core.String? string,
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
  factory UUID.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UUID.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UUID clone() => UUID()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UUID copyWith(void Function(UUID) updates) =>
      super.copyWith((message) => updates(message as UUID))
          as UUID; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UUID create() => UUID._();
  UUID createEmptyInstance() => create();
  static $pb.PbList<UUID> createRepeated() => $pb.PbList<UUID>();
  @$core.pragma('dart2js:noInline')
  static UUID getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UUID>(create);
  static UUID? _defaultInstance;

  UUID_Value whichValue() => _UUID_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UUID_Structured get structured => $_getN(0);
  @$pb.TagNumber(1)
  set structured(UUID_Structured v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStructured() => $_has(0);
  @$pb.TagNumber(1)
  void clearStructured() => clearField(1);
  @$pb.TagNumber(1)
  UUID_Structured ensureStructured() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get string => $_getSZ(1);
  @$pb.TagNumber(2)
  set string($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasString() => $_has(1);
  @$pb.TagNumber(2)
  void clearString() => clearField(2);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Empty',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty))
          as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class StreamIdentifier extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StreamIdentifier',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamId',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  StreamIdentifier._() : super();
  factory StreamIdentifier({
    $core.List<$core.int>? streamId,
  }) {
    final _result = create();
    if (streamId != null) {
      _result.streamId = streamId;
    }
    return _result;
  }
  factory StreamIdentifier.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StreamIdentifier.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StreamIdentifier clone() => StreamIdentifier()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StreamIdentifier copyWith(void Function(StreamIdentifier) updates) =>
      super.copyWith((message) => updates(message as StreamIdentifier))
          as StreamIdentifier; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamIdentifier create() => StreamIdentifier._();
  StreamIdentifier createEmptyInstance() => create();
  static $pb.PbList<StreamIdentifier> createRepeated() =>
      $pb.PbList<StreamIdentifier>();
  @$core.pragma('dart2js:noInline')
  static StreamIdentifier getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamIdentifier>(create);
  static StreamIdentifier? _defaultInstance;

  @$pb.TagNumber(3)
  $core.List<$core.int> get streamId => $_getN(0);
  @$pb.TagNumber(3)
  set streamId($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStreamName() => $_has(0);
  @$pb.TagNumber(3)
  void clearStreamName() => clearField(3);
}

class AllStreamPosition extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AllStreamPosition',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
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

  AllStreamPosition._() : super();
  factory AllStreamPosition({
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
  factory AllStreamPosition.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AllStreamPosition.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AllStreamPosition clone() => AllStreamPosition()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AllStreamPosition copyWith(void Function(AllStreamPosition) updates) =>
      super.copyWith((message) => updates(message as AllStreamPosition))
          as AllStreamPosition; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AllStreamPosition create() => AllStreamPosition._();
  AllStreamPosition createEmptyInstance() => create();
  static $pb.PbList<AllStreamPosition> createRepeated() =>
      $pb.PbList<AllStreamPosition>();
  @$core.pragma('dart2js:noInline')
  static AllStreamPosition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AllStreamPosition>(create);
  static AllStreamPosition? _defaultInstance;

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

enum WrongExpectedVersion_CurrentStreamRevisionOption {
  currentStreamRevision,
  currentNoStream,
  notSet
}

enum WrongExpectedVersion_ExpectedStreamPositionOption {
  expectedStreamPosition,
  expectedAny,
  expectedStreamExists,
  expectedNoStream,
  notSet
}

class WrongExpectedVersion extends $pb.GeneratedMessage {
  static const $core
          .Map<$core.int, WrongExpectedVersion_CurrentStreamRevisionOption>
      _WrongExpectedVersion_CurrentStreamRevisionOptionByTag = {
    1: WrongExpectedVersion_CurrentStreamRevisionOption.currentStreamRevision,
    2: WrongExpectedVersion_CurrentStreamRevisionOption.currentNoStream,
    0: WrongExpectedVersion_CurrentStreamRevisionOption.notSet
  };
  static const $core
          .Map<$core.int, WrongExpectedVersion_ExpectedStreamPositionOption>
      _WrongExpectedVersion_ExpectedStreamPositionOptionByTag = {
    3: WrongExpectedVersion_ExpectedStreamPositionOption.expectedStreamPosition,
    4: WrongExpectedVersion_ExpectedStreamPositionOption.expectedAny,
    5: WrongExpectedVersion_ExpectedStreamPositionOption.expectedStreamExists,
    6: WrongExpectedVersion_ExpectedStreamPositionOption.expectedNoStream,
    0: WrongExpectedVersion_ExpectedStreamPositionOption.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WrongExpectedVersion',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..oo(1, [3, 4, 5, 6])
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentStreamRevision',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$9.Empty>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentNoStream',
        subBuilder: $9.Empty.create)
    ..a<$fixnum.Int64>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expectedStreamPosition',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$9.Empty>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expectedAny',
        subBuilder: $9.Empty.create)
    ..aOM<$9.Empty>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expectedStreamExists',
        subBuilder: $9.Empty.create)
    ..aOM<$9.Empty>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expectedNoStream',
        subBuilder: $9.Empty.create)
    ..hasRequiredFields = false;

  WrongExpectedVersion._() : super();
  factory WrongExpectedVersion({
    $fixnum.Int64? currentStreamRevision,
    $9.Empty? currentNoStream,
    $fixnum.Int64? expectedStreamPosition,
    $9.Empty? expectedAny,
    $9.Empty? expectedStreamExists,
    $9.Empty? expectedNoStream,
  }) {
    final _result = create();
    if (currentStreamRevision != null) {
      _result.currentStreamRevision = currentStreamRevision;
    }
    if (currentNoStream != null) {
      _result.currentNoStream = currentNoStream;
    }
    if (expectedStreamPosition != null) {
      _result.expectedStreamPosition = expectedStreamPosition;
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
  factory WrongExpectedVersion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WrongExpectedVersion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WrongExpectedVersion clone() =>
      WrongExpectedVersion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WrongExpectedVersion copyWith(void Function(WrongExpectedVersion) updates) =>
      super.copyWith((message) => updates(message as WrongExpectedVersion))
          as WrongExpectedVersion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WrongExpectedVersion create() => WrongExpectedVersion._();
  WrongExpectedVersion createEmptyInstance() => create();
  static $pb.PbList<WrongExpectedVersion> createRepeated() =>
      $pb.PbList<WrongExpectedVersion>();
  @$core.pragma('dart2js:noInline')
  static WrongExpectedVersion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WrongExpectedVersion>(create);
  static WrongExpectedVersion? _defaultInstance;

  WrongExpectedVersion_CurrentStreamRevisionOption
      whichCurrentStreamRevisionOption() =>
          _WrongExpectedVersion_CurrentStreamRevisionOptionByTag[
              $_whichOneof(0)]!;
  void clearCurrentStreamRevisionOption() => clearField($_whichOneof(0));

  WrongExpectedVersion_ExpectedStreamPositionOption
      whichExpectedStreamPositionOption() =>
          _WrongExpectedVersion_ExpectedStreamPositionOptionByTag[
              $_whichOneof(1)]!;
  void clearExpectedStreamPositionOption() => clearField($_whichOneof(1));

  @$pb.TagNumber(1)
  $fixnum.Int64 get currentStreamRevision => $_getI64(0);
  @$pb.TagNumber(1)
  set currentStreamRevision($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrentStreamRevision() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentStreamRevision() => clearField(1);

  @$pb.TagNumber(2)
  $9.Empty get currentNoStream => $_getN(1);
  @$pb.TagNumber(2)
  set currentNoStream($9.Empty v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrentNoStream() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentNoStream() => clearField(2);
  @$pb.TagNumber(2)
  $9.Empty ensureCurrentNoStream() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expectedStreamPosition => $_getI64(2);
  @$pb.TagNumber(3)
  set expectedStreamPosition($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExpectedStreamPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpectedStreamPosition() => clearField(3);

  @$pb.TagNumber(4)
  $9.Empty get expectedAny => $_getN(3);
  @$pb.TagNumber(4)
  set expectedAny($9.Empty v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExpectedAny() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpectedAny() => clearField(4);
  @$pb.TagNumber(4)
  $9.Empty ensureExpectedAny() => $_ensure(3);

  @$pb.TagNumber(5)
  $9.Empty get expectedStreamExists => $_getN(4);
  @$pb.TagNumber(5)
  set expectedStreamExists($9.Empty v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasExpectedStreamExists() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpectedStreamExists() => clearField(5);
  @$pb.TagNumber(5)
  $9.Empty ensureExpectedStreamExists() => $_ensure(4);

  @$pb.TagNumber(6)
  $9.Empty get expectedNoStream => $_getN(5);
  @$pb.TagNumber(6)
  set expectedNoStream($9.Empty v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasExpectedNoStream() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpectedNoStream() => clearField(6);
  @$pb.TagNumber(6)
  $9.Empty ensureExpectedNoStream() => $_ensure(5);
}

class AccessDenied extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccessDenied',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  AccessDenied._() : super();
  factory AccessDenied() => create();
  factory AccessDenied.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccessDenied.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccessDenied clone() => AccessDenied()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccessDenied copyWith(void Function(AccessDenied) updates) =>
      super.copyWith((message) => updates(message as AccessDenied))
          as AccessDenied; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccessDenied create() => AccessDenied._();
  AccessDenied createEmptyInstance() => create();
  static $pb.PbList<AccessDenied> createRepeated() =>
      $pb.PbList<AccessDenied>();
  @$core.pragma('dart2js:noInline')
  static AccessDenied getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccessDenied>(create);
  static AccessDenied? _defaultInstance;
}

class StreamDeleted extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'StreamDeleted',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..aOM<StreamIdentifier>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamIdentifier',
        subBuilder: StreamIdentifier.create)
    ..hasRequiredFields = false;

  StreamDeleted._() : super();
  factory StreamDeleted({
    StreamIdentifier? streamIdentifier,
  }) {
    final _result = create();
    if (streamIdentifier != null) {
      _result.streamIdentifier = streamIdentifier;
    }
    return _result;
  }
  factory StreamDeleted.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StreamDeleted.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StreamDeleted clone() => StreamDeleted()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StreamDeleted copyWith(void Function(StreamDeleted) updates) =>
      super.copyWith((message) => updates(message as StreamDeleted))
          as StreamDeleted; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamDeleted create() => StreamDeleted._();
  StreamDeleted createEmptyInstance() => create();
  static $pb.PbList<StreamDeleted> createRepeated() =>
      $pb.PbList<StreamDeleted>();
  @$core.pragma('dart2js:noInline')
  static StreamDeleted getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamDeleted>(create);
  static StreamDeleted? _defaultInstance;

  @$pb.TagNumber(1)
  StreamIdentifier get streamIdentifier => $_getN(0);
  @$pb.TagNumber(1)
  set streamIdentifier(StreamIdentifier v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStreamIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamIdentifier() => clearField(1);
  @$pb.TagNumber(1)
  StreamIdentifier ensureStreamIdentifier() => $_ensure(0);
}

class Timeout extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Timeout',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  Timeout._() : super();
  factory Timeout() => create();
  factory Timeout.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Timeout.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Timeout clone() => Timeout()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Timeout copyWith(void Function(Timeout) updates) =>
      super.copyWith((message) => updates(message as Timeout))
          as Timeout; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Timeout create() => Timeout._();
  Timeout createEmptyInstance() => create();
  static $pb.PbList<Timeout> createRepeated() => $pb.PbList<Timeout>();
  @$core.pragma('dart2js:noInline')
  static Timeout getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Timeout>(create);
  static Timeout? _defaultInstance;
}

class Unknown extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Unknown',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  Unknown._() : super();
  factory Unknown() => create();
  factory Unknown.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Unknown.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Unknown clone() => Unknown()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Unknown copyWith(void Function(Unknown) updates) =>
      super.copyWith((message) => updates(message as Unknown))
          as Unknown; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Unknown create() => Unknown._();
  Unknown createEmptyInstance() => create();
  static $pb.PbList<Unknown> createRepeated() => $pb.PbList<Unknown>();
  @$core.pragma('dart2js:noInline')
  static Unknown getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Unknown>(create);
  static Unknown? _defaultInstance;
}

class InvalidTransaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InvalidTransaction',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  InvalidTransaction._() : super();
  factory InvalidTransaction() => create();
  factory InvalidTransaction.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InvalidTransaction.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InvalidTransaction clone() => InvalidTransaction()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InvalidTransaction copyWith(void Function(InvalidTransaction) updates) =>
      super.copyWith((message) => updates(message as InvalidTransaction))
          as InvalidTransaction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InvalidTransaction create() => InvalidTransaction._();
  InvalidTransaction createEmptyInstance() => create();
  static $pb.PbList<InvalidTransaction> createRepeated() =>
      $pb.PbList<InvalidTransaction>();
  @$core.pragma('dart2js:noInline')
  static InvalidTransaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvalidTransaction>(create);
  static InvalidTransaction? _defaultInstance;
}

class MaximumAppendSizeExceeded extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MaximumAppendSizeExceeded',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxAppendSize',
        $pb.PbFieldType.OU3,
        protoName: 'maxAppendSize')
    ..hasRequiredFields = false;

  MaximumAppendSizeExceeded._() : super();
  factory MaximumAppendSizeExceeded({
    $core.int? maxAppendSize,
  }) {
    final _result = create();
    if (maxAppendSize != null) {
      _result.maxAppendSize = maxAppendSize;
    }
    return _result;
  }
  factory MaximumAppendSizeExceeded.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MaximumAppendSizeExceeded.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MaximumAppendSizeExceeded clone() =>
      MaximumAppendSizeExceeded()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MaximumAppendSizeExceeded copyWith(
          void Function(MaximumAppendSizeExceeded) updates) =>
      super.copyWith((message) => updates(message as MaximumAppendSizeExceeded))
          as MaximumAppendSizeExceeded; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MaximumAppendSizeExceeded create() => MaximumAppendSizeExceeded._();
  MaximumAppendSizeExceeded createEmptyInstance() => create();
  static $pb.PbList<MaximumAppendSizeExceeded> createRepeated() =>
      $pb.PbList<MaximumAppendSizeExceeded>();
  @$core.pragma('dart2js:noInline')
  static MaximumAppendSizeExceeded getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MaximumAppendSizeExceeded>(create);
  static MaximumAppendSizeExceeded? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxAppendSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxAppendSize($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMaxAppendSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxAppendSize() => clearField(1);
}

class BadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BadRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..hasRequiredFields = false;

  BadRequest._() : super();
  factory BadRequest({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory BadRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BadRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BadRequest clone() => BadRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BadRequest copyWith(void Function(BadRequest) updates) =>
      super.copyWith((message) => updates(message as BadRequest))
          as BadRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BadRequest create() => BadRequest._();
  BadRequest createEmptyInstance() => create();
  static $pb.PbList<BadRequest> createRepeated() => $pb.PbList<BadRequest>();
  @$core.pragma('dart2js:noInline')
  static BadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BadRequest>(create);
  static BadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}
