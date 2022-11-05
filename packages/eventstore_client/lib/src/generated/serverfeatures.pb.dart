///
//  Generated code. Do not modify.
//  source: serverfeatures.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SupportedMethods extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SupportedMethods',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.server_features'),
      createEmptyInstance: create)
    ..pc<SupportedMethod>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'methods',
        $pb.PbFieldType.PM,
        subBuilder: SupportedMethod.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'eventStoreServerVersion')
    ..hasRequiredFields = false;

  SupportedMethods._() : super();
  factory SupportedMethods({
    $core.Iterable<SupportedMethod>? methods,
    $core.String? eventStoreServerVersion,
  }) {
    final _result = create();
    if (methods != null) {
      _result.methods.addAll(methods);
    }
    if (eventStoreServerVersion != null) {
      _result.eventStoreServerVersion = eventStoreServerVersion;
    }
    return _result;
  }
  factory SupportedMethods.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SupportedMethods.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SupportedMethods clone() => SupportedMethods()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SupportedMethods copyWith(void Function(SupportedMethods) updates) =>
      super.copyWith((message) => updates(message as SupportedMethods))
          as SupportedMethods; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SupportedMethods create() => SupportedMethods._();
  SupportedMethods createEmptyInstance() => create();
  static $pb.PbList<SupportedMethods> createRepeated() =>
      $pb.PbList<SupportedMethods>();
  @$core.pragma('dart2js:noInline')
  static SupportedMethods getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportedMethods>(create);
  static SupportedMethods? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SupportedMethod> get methods => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get eventStoreServerVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set eventStoreServerVersion($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEventStoreServerVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventStoreServerVersion() => clearField(2);
}

class SupportedMethod extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SupportedMethod',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'event_store.client.server_features'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'methodName')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serviceName')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'features')
    ..hasRequiredFields = false;

  SupportedMethod._() : super();
  factory SupportedMethod({
    $core.String? methodName,
    $core.String? serviceName,
    $core.Iterable<$core.String>? features,
  }) {
    final _result = create();
    if (methodName != null) {
      _result.methodName = methodName;
    }
    if (serviceName != null) {
      _result.serviceName = serviceName;
    }
    if (features != null) {
      _result.features.addAll(features);
    }
    return _result;
  }
  factory SupportedMethod.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SupportedMethod.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SupportedMethod clone() => SupportedMethod()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SupportedMethod copyWith(void Function(SupportedMethod) updates) =>
      super.copyWith((message) => updates(message as SupportedMethod))
          as SupportedMethod; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SupportedMethod create() => SupportedMethod._();
  SupportedMethod createEmptyInstance() => create();
  static $pb.PbList<SupportedMethod> createRepeated() =>
      $pb.PbList<SupportedMethod>();
  @$core.pragma('dart2js:noInline')
  static SupportedMethod getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportedMethod>(create);
  static SupportedMethod? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get methodName => $_getSZ(0);
  @$pb.TagNumber(1)
  set methodName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMethodName() => $_has(0);
  @$pb.TagNumber(1)
  void clearMethodName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serviceName => $_getSZ(1);
  @$pb.TagNumber(2)
  set serviceName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServiceName() => $_has(1);
  @$pb.TagNumber(2)
  void clearServiceName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get features => $_getList(2);
}
