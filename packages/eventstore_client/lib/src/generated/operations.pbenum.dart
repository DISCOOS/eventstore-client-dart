///
//  Generated code. Do not modify.
//  source: operations.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ScavengeResp_ScavengeResult extends $pb.ProtobufEnum {
  static const ScavengeResp_ScavengeResult Started =
      ScavengeResp_ScavengeResult._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'Started');
  static const ScavengeResp_ScavengeResult InProgress =
      ScavengeResp_ScavengeResult._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'InProgress');
  static const ScavengeResp_ScavengeResult Stopped =
      ScavengeResp_ScavengeResult._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'Stopped');

  static const $core.List<ScavengeResp_ScavengeResult> values =
      <ScavengeResp_ScavengeResult>[
    Started,
    InProgress,
    Stopped,
  ];

  static final $core.Map<$core.int, ScavengeResp_ScavengeResult> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ScavengeResp_ScavengeResult? valueOf($core.int value) =>
      _byValue[value];

  const ScavengeResp_ScavengeResult._($core.int v, $core.String n)
      : super(v, n);
}
