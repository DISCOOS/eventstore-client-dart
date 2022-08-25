///
//  Generated code. Do not modify.
//  source: persistent.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ReadReq_Nack_Action extends $pb.ProtobufEnum {
  static const ReadReq_Nack_Action Unknown = ReadReq_Nack_Action._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Unknown');
  static const ReadReq_Nack_Action Park = ReadReq_Nack_Action._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Park');
  static const ReadReq_Nack_Action Retry = ReadReq_Nack_Action._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Retry');
  static const ReadReq_Nack_Action Skip = ReadReq_Nack_Action._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Skip');
  static const ReadReq_Nack_Action Stop = ReadReq_Nack_Action._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Stop');

  static const $core.List<ReadReq_Nack_Action> values = <ReadReq_Nack_Action>[
    Unknown,
    Park,
    Retry,
    Skip,
    Stop,
  ];

  static final $core.Map<$core.int, ReadReq_Nack_Action> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ReadReq_Nack_Action? valueOf($core.int value) => _byValue[value];

  const ReadReq_Nack_Action._($core.int v, $core.String n) : super(v, n);
}

class CreateReq_ConsumerStrategy extends $pb.ProtobufEnum {
  static const CreateReq_ConsumerStrategy DispatchToSingle =
      CreateReq_ConsumerStrategy._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'DispatchToSingle');
  static const CreateReq_ConsumerStrategy RoundRobin =
      CreateReq_ConsumerStrategy._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RoundRobin');
  static const CreateReq_ConsumerStrategy Pinned = CreateReq_ConsumerStrategy._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Pinned');

  static const $core.List<CreateReq_ConsumerStrategy> values =
      <CreateReq_ConsumerStrategy>[
    DispatchToSingle,
    RoundRobin,
    Pinned,
  ];

  static final $core.Map<$core.int, CreateReq_ConsumerStrategy> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CreateReq_ConsumerStrategy? valueOf($core.int value) =>
      _byValue[value];

  const CreateReq_ConsumerStrategy._($core.int v, $core.String n) : super(v, n);
}

class UpdateReq_ConsumerStrategy extends $pb.ProtobufEnum {
  static const UpdateReq_ConsumerStrategy DispatchToSingle =
      UpdateReq_ConsumerStrategy._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'DispatchToSingle');
  static const UpdateReq_ConsumerStrategy RoundRobin =
      UpdateReq_ConsumerStrategy._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RoundRobin');
  static const UpdateReq_ConsumerStrategy Pinned = UpdateReq_ConsumerStrategy._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Pinned');

  static const $core.List<UpdateReq_ConsumerStrategy> values =
      <UpdateReq_ConsumerStrategy>[
    DispatchToSingle,
    RoundRobin,
    Pinned,
  ];

  static final $core.Map<$core.int, UpdateReq_ConsumerStrategy> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static UpdateReq_ConsumerStrategy? valueOf($core.int value) =>
      _byValue[value];

  const UpdateReq_ConsumerStrategy._($core.int v, $core.String n) : super(v, n);
}
