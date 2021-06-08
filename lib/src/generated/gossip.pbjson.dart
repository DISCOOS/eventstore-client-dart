///
//  Generated code. Do not modify.
//  source: gossip.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use clusterInfoDescriptor instead')
const ClusterInfo$json = const {
  '1': 'ClusterInfo',
  '2': const [
    const {
      '1': 'members',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.event_store.client.gossip.MemberInfo',
      '10': 'members'
    },
  ],
};

/// Descriptor for `ClusterInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clusterInfoDescriptor = $convert.base64Decode(
    'CgtDbHVzdGVySW5mbxI/CgdtZW1iZXJzGAEgAygLMiUuZXZlbnRfc3RvcmUuY2xpZW50Lmdvc3NpcC5NZW1iZXJJbmZvUgdtZW1iZXJz');
@$core.Deprecated('Use endPointDescriptor instead')
const EndPoint$json = const {
  '1': 'EndPoint',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'port', '3': 2, '4': 1, '5': 13, '10': 'port'},
  ],
};

/// Descriptor for `EndPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endPointDescriptor = $convert.base64Decode(
    'CghFbmRQb2ludBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEhIKBHBvcnQYAiABKA1SBHBvcnQ=');
@$core.Deprecated('Use memberInfoDescriptor instead')
const MemberInfo$json = const {
  '1': 'MemberInfo',
  '2': const [
    const {
      '1': 'instance_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.UUID',
      '10': 'instanceId'
    },
    const {'1': 'time_stamp', '3': 2, '4': 1, '5': 3, '10': 'timeStamp'},
    const {
      '1': 'state',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.event_store.client.gossip.MemberInfo.VNodeState',
      '10': 'state'
    },
    const {'1': 'is_alive', '3': 4, '4': 1, '5': 8, '10': 'isAlive'},
    const {
      '1': 'http_end_point',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.gossip.EndPoint',
      '10': 'httpEndPoint'
    },
  ],
  '4': const [MemberInfo_VNodeState$json],
};

@$core.Deprecated('Use memberInfoDescriptor instead')
const MemberInfo_VNodeState$json = const {
  '1': 'VNodeState',
  '2': const [
    const {'1': 'Initializing', '2': 0},
    const {'1': 'DiscoverLeader', '2': 1},
    const {'1': 'Unknown', '2': 2},
    const {'1': 'PreReplica', '2': 3},
    const {'1': 'CatchingUp', '2': 4},
    const {'1': 'Clone', '2': 5},
    const {'1': 'Follower', '2': 6},
    const {'1': 'PreLeader', '2': 7},
    const {'1': 'Leader', '2': 8},
    const {'1': 'Manager', '2': 9},
    const {'1': 'ShuttingDown', '2': 10},
    const {'1': 'Shutdown', '2': 11},
    const {'1': 'ReadOnlyLeaderless', '2': 12},
    const {'1': 'PreReadOnlyReplica', '2': 13},
    const {'1': 'ReadOnlyReplica', '2': 14},
    const {'1': 'ResigningLeader', '2': 15},
  ],
};

/// Descriptor for `MemberInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberInfoDescriptor = $convert.base64Decode(
    'CgpNZW1iZXJJbmZvEkAKC2luc3RhbmNlX2lkGAEgASgLMh8uZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5VVUlEUgppbnN0YW5jZUlkEh0KCnRpbWVfc3RhbXAYAiABKANSCXRpbWVTdGFtcBJGCgVzdGF0ZRgDIAEoDjIwLmV2ZW50X3N0b3JlLmNsaWVudC5nb3NzaXAuTWVtYmVySW5mby5WTm9kZVN0YXRlUgVzdGF0ZRIZCghpc19hbGl2ZRgEIAEoCFIHaXNBbGl2ZRJJCg5odHRwX2VuZF9wb2ludBgFIAEoCzIjLmV2ZW50X3N0b3JlLmNsaWVudC5nb3NzaXAuRW5kUG9pbnRSDGh0dHBFbmRQb2ludCKaAgoKVk5vZGVTdGF0ZRIQCgxJbml0aWFsaXppbmcQABISCg5EaXNjb3ZlckxlYWRlchABEgsKB1Vua25vd24QAhIOCgpQcmVSZXBsaWNhEAMSDgoKQ2F0Y2hpbmdVcBAEEgkKBUNsb25lEAUSDAoIRm9sbG93ZXIQBhINCglQcmVMZWFkZXIQBxIKCgZMZWFkZXIQCBILCgdNYW5hZ2VyEAkSEAoMU2h1dHRpbmdEb3duEAoSDAoIU2h1dGRvd24QCxIWChJSZWFkT25seUxlYWRlcmxlc3MQDBIWChJQcmVSZWFkT25seVJlcGxpY2EQDRITCg9SZWFkT25seVJlcGxpY2EQDhITCg9SZXNpZ25pbmdMZWFkZXIQDw==');
