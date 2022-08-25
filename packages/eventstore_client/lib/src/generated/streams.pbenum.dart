///
//  Generated code. Do not modify.
//  source: streams.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ReadReq_Options_ReadDirection extends $pb.ProtobufEnum {
  static const ReadReq_Options_ReadDirection Forwards =
      ReadReq_Options_ReadDirection._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'Forwards');
  static const ReadReq_Options_ReadDirection Backwards =
      ReadReq_Options_ReadDirection._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'Backwards');

  static const $core.List<ReadReq_Options_ReadDirection> values =
      <ReadReq_Options_ReadDirection>[
    Forwards,
    Backwards,
  ];

  static final $core.Map<$core.int, ReadReq_Options_ReadDirection> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ReadReq_Options_ReadDirection? valueOf($core.int value) =>
      _byValue[value];

  const ReadReq_Options_ReadDirection._($core.int v, $core.String n)
      : super(v, n);
}
