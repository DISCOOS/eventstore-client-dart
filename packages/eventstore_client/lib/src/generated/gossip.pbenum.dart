///
//  Generated code. Do not modify.
//  source: gossip.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class MemberInfo_VNodeState extends $pb.ProtobufEnum {
  static const MemberInfo_VNodeState Initializing = MemberInfo_VNodeState._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Initializing');
  static const MemberInfo_VNodeState DiscoverLeader = MemberInfo_VNodeState._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DiscoverLeader');
  static const MemberInfo_VNodeState Unknown = MemberInfo_VNodeState._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Unknown');
  static const MemberInfo_VNodeState PreReplica = MemberInfo_VNodeState._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PreReplica');
  static const MemberInfo_VNodeState CatchingUp = MemberInfo_VNodeState._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CatchingUp');
  static const MemberInfo_VNodeState Clone = MemberInfo_VNodeState._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Clone');
  static const MemberInfo_VNodeState Follower = MemberInfo_VNodeState._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Follower');
  static const MemberInfo_VNodeState PreLeader = MemberInfo_VNodeState._(
      7,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PreLeader');
  static const MemberInfo_VNodeState Leader = MemberInfo_VNodeState._(
      8,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Leader');
  static const MemberInfo_VNodeState Manager = MemberInfo_VNodeState._(
      9,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Manager');
  static const MemberInfo_VNodeState ShuttingDown = MemberInfo_VNodeState._(
      10,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ShuttingDown');
  static const MemberInfo_VNodeState Shutdown = MemberInfo_VNodeState._(
      11,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Shutdown');
  static const MemberInfo_VNodeState ReadOnlyLeaderless =
      MemberInfo_VNodeState._(
          12,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ReadOnlyLeaderless');
  static const MemberInfo_VNodeState PreReadOnlyReplica =
      MemberInfo_VNodeState._(
          13,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'PreReadOnlyReplica');
  static const MemberInfo_VNodeState ReadOnlyReplica = MemberInfo_VNodeState._(
      14,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ReadOnlyReplica');
  static const MemberInfo_VNodeState ResigningLeader = MemberInfo_VNodeState._(
      15,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ResigningLeader');

  static const $core.List<MemberInfo_VNodeState> values =
      <MemberInfo_VNodeState>[
    Initializing,
    DiscoverLeader,
    Unknown,
    PreReplica,
    CatchingUp,
    Clone,
    Follower,
    PreLeader,
    Leader,
    Manager,
    ShuttingDown,
    Shutdown,
    ReadOnlyLeaderless,
    PreReadOnlyReplica,
    ReadOnlyReplica,
    ResigningLeader,
  ];

  static final $core.Map<$core.int, MemberInfo_VNodeState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static MemberInfo_VNodeState? valueOf($core.int value) => _byValue[value];

  const MemberInfo_VNodeState._($core.int v, $core.String n) : super(v, n);
}
