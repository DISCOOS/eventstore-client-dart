///
//  Generated code. Do not modify.
//  source: cluster.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use gossipRequestDescriptor instead')
const GossipRequest$json = const {
  '1': 'GossipRequest',
  '2': const [
    const {
      '1': 'info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.ClusterInfo',
      '10': 'info'
    },
    const {
      '1': 'server',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'server'
    },
  ],
};

/// Descriptor for `GossipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gossipRequestDescriptor = $convert.base64Decode(
    'Cg1Hb3NzaXBSZXF1ZXN0EjQKBGluZm8YASABKAsyIC5ldmVudF9zdG9yZS5jbHVzdGVyLkNsdXN0ZXJJbmZvUgRpbmZvEjUKBnNlcnZlchgCIAEoCzIdLmV2ZW50X3N0b3JlLmNsdXN0ZXIuRW5kUG9pbnRSBnNlcnZlcg==');
@$core.Deprecated('Use viewChangeRequestDescriptor instead')
const ViewChangeRequest$json = const {
  '1': 'ViewChangeRequest',
  '2': const [
    const {
      '1': 'server_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'serverId'
    },
    const {
      '1': 'server_http',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'serverHttp'
    },
    const {
      '1': 'attempted_view',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'attemptedView'
    },
  ],
};

/// Descriptor for `ViewChangeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List viewChangeRequestDescriptor = $convert.base64Decode(
    'ChFWaWV3Q2hhbmdlUmVxdWVzdBI1CglzZXJ2ZXJfaWQYASABKAsyGC5ldmVudF9zdG9yZS5jbGllbnQuVVVJRFIIc2VydmVySWQSPgoLc2VydmVyX2h0dHAYAiABKAsyHS5ldmVudF9zdG9yZS5jbHVzdGVyLkVuZFBvaW50UgpzZXJ2ZXJIdHRwEiUKDmF0dGVtcHRlZF92aWV3GAMgASgFUg1hdHRlbXB0ZWRWaWV3');
@$core.Deprecated('Use viewChangeProofRequestDescriptor instead')
const ViewChangeProofRequest$json = const {
  '1': 'ViewChangeProofRequest',
  '2': const [
    const {
      '1': 'server_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'serverId'
    },
    const {
      '1': 'server_http',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'serverHttp'
    },
    const {
      '1': 'installed_view',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'installedView'
    },
  ],
};

/// Descriptor for `ViewChangeProofRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List viewChangeProofRequestDescriptor =
    $convert.base64Decode(
        'ChZWaWV3Q2hhbmdlUHJvb2ZSZXF1ZXN0EjUKCXNlcnZlcl9pZBgBIAEoCzIYLmV2ZW50X3N0b3JlLmNsaWVudC5VVUlEUghzZXJ2ZXJJZBI+CgtzZXJ2ZXJfaHR0cBgCIAEoCzIdLmV2ZW50X3N0b3JlLmNsdXN0ZXIuRW5kUG9pbnRSCnNlcnZlckh0dHASJQoOaW5zdGFsbGVkX3ZpZXcYAyABKAVSDWluc3RhbGxlZFZpZXc=');
@$core.Deprecated('Use prepareRequestDescriptor instead')
const PrepareRequest$json = const {
  '1': 'PrepareRequest',
  '2': const [
    const {
      '1': 'server_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'serverId'
    },
    const {
      '1': 'server_http',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'serverHttp'
    },
    const {'1': 'view', '3': 3, '4': 1, '5': 5, '10': 'view'},
  ],
};

/// Descriptor for `PrepareRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareRequestDescriptor = $convert.base64Decode(
    'Cg5QcmVwYXJlUmVxdWVzdBI1CglzZXJ2ZXJfaWQYASABKAsyGC5ldmVudF9zdG9yZS5jbGllbnQuVVVJRFIIc2VydmVySWQSPgoLc2VydmVyX2h0dHAYAiABKAsyHS5ldmVudF9zdG9yZS5jbHVzdGVyLkVuZFBvaW50UgpzZXJ2ZXJIdHRwEhIKBHZpZXcYAyABKAVSBHZpZXc=');
@$core.Deprecated('Use prepareOkRequestDescriptor instead')
const PrepareOkRequest$json = const {
  '1': 'PrepareOkRequest',
  '2': const [
    const {'1': 'view', '3': 1, '4': 1, '5': 5, '10': 'view'},
    const {
      '1': 'server_id',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'serverId'
    },
    const {
      '1': 'server_http',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'serverHttp'
    },
    const {'1': 'epoch_number', '3': 4, '4': 1, '5': 5, '10': 'epochNumber'},
    const {
      '1': 'epoch_position',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'epochPosition'
    },
    const {
      '1': 'epoch_id',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'epochId'
    },
    const {
      '1': 'epoch_leader_instance_id',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'epochLeaderInstanceId'
    },
    const {
      '1': 'last_commit_position',
      '3': 8,
      '4': 1,
      '5': 3,
      '10': 'lastCommitPosition'
    },
    const {
      '1': 'writer_checkpoint',
      '3': 9,
      '4': 1,
      '5': 3,
      '10': 'writerCheckpoint'
    },
    const {
      '1': 'chaser_checkpoint',
      '3': 10,
      '4': 1,
      '5': 3,
      '10': 'chaserCheckpoint'
    },
    const {'1': 'node_priority', '3': 11, '4': 1, '5': 5, '10': 'nodePriority'},
    const {
      '1': 'cluster_info',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.ClusterInfo',
      '10': 'clusterInfo'
    },
  ],
};

/// Descriptor for `PrepareOkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prepareOkRequestDescriptor = $convert.base64Decode(
    'ChBQcmVwYXJlT2tSZXF1ZXN0EhIKBHZpZXcYASABKAVSBHZpZXcSNQoJc2VydmVyX2lkGAIgASgLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSCHNlcnZlcklkEj4KC3NlcnZlcl9odHRwGAMgASgLMh0uZXZlbnRfc3RvcmUuY2x1c3Rlci5FbmRQb2ludFIKc2VydmVySHR0cBIhCgxlcG9jaF9udW1iZXIYBCABKAVSC2Vwb2NoTnVtYmVyEiUKDmVwb2NoX3Bvc2l0aW9uGAUgASgDUg1lcG9jaFBvc2l0aW9uEjMKCGVwb2NoX2lkGAYgASgLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSB2Vwb2NoSWQSUQoYZXBvY2hfbGVhZGVyX2luc3RhbmNlX2lkGAcgASgLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSFWVwb2NoTGVhZGVySW5zdGFuY2VJZBIwChRsYXN0X2NvbW1pdF9wb3NpdGlvbhgIIAEoA1ISbGFzdENvbW1pdFBvc2l0aW9uEisKEXdyaXRlcl9jaGVja3BvaW50GAkgASgDUhB3cml0ZXJDaGVja3BvaW50EisKEWNoYXNlcl9jaGVja3BvaW50GAogASgDUhBjaGFzZXJDaGVja3BvaW50EiMKDW5vZGVfcHJpb3JpdHkYCyABKAVSDG5vZGVQcmlvcml0eRJDCgxjbHVzdGVyX2luZm8YDCABKAsyIC5ldmVudF9zdG9yZS5jbHVzdGVyLkNsdXN0ZXJJbmZvUgtjbHVzdGVySW5mbw==');
@$core.Deprecated('Use proposalRequestDescriptor instead')
const ProposalRequest$json = const {
  '1': 'ProposalRequest',
  '2': const [
    const {
      '1': 'server_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'serverId'
    },
    const {
      '1': 'server_http',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'serverHttp'
    },
    const {
      '1': 'leader_id',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'leaderId'
    },
    const {
      '1': 'leader_http',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'leaderHttp'
    },
    const {'1': 'view', '3': 5, '4': 1, '5': 5, '10': 'view'},
    const {'1': 'epoch_number', '3': 6, '4': 1, '5': 5, '10': 'epochNumber'},
    const {
      '1': 'epoch_position',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'epochPosition'
    },
    const {
      '1': 'epoch_id',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'epochId'
    },
    const {
      '1': 'epoch_leader_instance_id',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'epochLeaderInstanceId'
    },
    const {
      '1': 'last_commit_position',
      '3': 10,
      '4': 1,
      '5': 3,
      '10': 'lastCommitPosition'
    },
    const {
      '1': 'writer_checkpoint',
      '3': 11,
      '4': 1,
      '5': 3,
      '10': 'writerCheckpoint'
    },
    const {
      '1': 'chaser_checkpoint',
      '3': 12,
      '4': 1,
      '5': 3,
      '10': 'chaserCheckpoint'
    },
    const {'1': 'node_priority', '3': 13, '4': 1, '5': 5, '10': 'nodePriority'},
  ],
};

/// Descriptor for `ProposalRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proposalRequestDescriptor = $convert.base64Decode(
    'Cg9Qcm9wb3NhbFJlcXVlc3QSNQoJc2VydmVyX2lkGAEgASgLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSCHNlcnZlcklkEj4KC3NlcnZlcl9odHRwGAIgASgLMh0uZXZlbnRfc3RvcmUuY2x1c3Rlci5FbmRQb2ludFIKc2VydmVySHR0cBI1CglsZWFkZXJfaWQYAyABKAsyGC5ldmVudF9zdG9yZS5jbGllbnQuVVVJRFIIbGVhZGVySWQSPgoLbGVhZGVyX2h0dHAYBCABKAsyHS5ldmVudF9zdG9yZS5jbHVzdGVyLkVuZFBvaW50UgpsZWFkZXJIdHRwEhIKBHZpZXcYBSABKAVSBHZpZXcSIQoMZXBvY2hfbnVtYmVyGAYgASgFUgtlcG9jaE51bWJlchIlCg5lcG9jaF9wb3NpdGlvbhgHIAEoA1INZXBvY2hQb3NpdGlvbhIzCghlcG9jaF9pZBgIIAEoCzIYLmV2ZW50X3N0b3JlLmNsaWVudC5VVUlEUgdlcG9jaElkElEKGGVwb2NoX2xlYWRlcl9pbnN0YW5jZV9pZBgJIAEoCzIYLmV2ZW50X3N0b3JlLmNsaWVudC5VVUlEUhVlcG9jaExlYWRlckluc3RhbmNlSWQSMAoUbGFzdF9jb21taXRfcG9zaXRpb24YCiABKANSEmxhc3RDb21taXRQb3NpdGlvbhIrChF3cml0ZXJfY2hlY2twb2ludBgLIAEoA1IQd3JpdGVyQ2hlY2twb2ludBIrChFjaGFzZXJfY2hlY2twb2ludBgMIAEoA1IQY2hhc2VyQ2hlY2twb2ludBIjCg1ub2RlX3ByaW9yaXR5GA0gASgFUgxub2RlUHJpb3JpdHk=');
@$core.Deprecated('Use acceptRequestDescriptor instead')
const AcceptRequest$json = const {
  '1': 'AcceptRequest',
  '2': const [
    const {
      '1': 'server_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'serverId'
    },
    const {
      '1': 'server_http',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'serverHttp'
    },
    const {
      '1': 'leader_id',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'leaderId'
    },
    const {
      '1': 'leader_http',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'leaderHttp'
    },
    const {'1': 'view', '3': 5, '4': 1, '5': 5, '10': 'view'},
  ],
};

/// Descriptor for `AcceptRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptRequestDescriptor = $convert.base64Decode(
    'Cg1BY2NlcHRSZXF1ZXN0EjUKCXNlcnZlcl9pZBgBIAEoCzIYLmV2ZW50X3N0b3JlLmNsaWVudC5VVUlEUghzZXJ2ZXJJZBI+CgtzZXJ2ZXJfaHR0cBgCIAEoCzIdLmV2ZW50X3N0b3JlLmNsdXN0ZXIuRW5kUG9pbnRSCnNlcnZlckh0dHASNQoJbGVhZGVyX2lkGAMgASgLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSCGxlYWRlcklkEj4KC2xlYWRlcl9odHRwGAQgASgLMh0uZXZlbnRfc3RvcmUuY2x1c3Rlci5FbmRQb2ludFIKbGVhZGVySHR0cBISCgR2aWV3GAUgASgFUgR2aWV3');
@$core.Deprecated('Use leaderIsResigningRequestDescriptor instead')
const LeaderIsResigningRequest$json = const {
  '1': 'LeaderIsResigningRequest',
  '2': const [
    const {
      '1': 'leader_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'leaderId'
    },
    const {
      '1': 'leader_http',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'leaderHttp'
    },
  ],
};

/// Descriptor for `LeaderIsResigningRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaderIsResigningRequestDescriptor =
    $convert.base64Decode(
        'ChhMZWFkZXJJc1Jlc2lnbmluZ1JlcXVlc3QSNQoJbGVhZGVyX2lkGAEgASgLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSCGxlYWRlcklkEj4KC2xlYWRlcl9odHRwGAIgASgLMh0uZXZlbnRfc3RvcmUuY2x1c3Rlci5FbmRQb2ludFIKbGVhZGVySHR0cA==');
@$core.Deprecated('Use leaderIsResigningOkRequestDescriptor instead')
const LeaderIsResigningOkRequest$json = const {
  '1': 'LeaderIsResigningOkRequest',
  '2': const [
    const {
      '1': 'leader_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'leaderId'
    },
    const {
      '1': 'leader_http',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'leaderHttp'
    },
    const {
      '1': 'server_id',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'serverId'
    },
    const {
      '1': 'server_http',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'serverHttp'
    },
  ],
};

/// Descriptor for `LeaderIsResigningOkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaderIsResigningOkRequestDescriptor =
    $convert.base64Decode(
        'ChpMZWFkZXJJc1Jlc2lnbmluZ09rUmVxdWVzdBI1CglsZWFkZXJfaWQYASABKAsyGC5ldmVudF9zdG9yZS5jbGllbnQuVVVJRFIIbGVhZGVySWQSPgoLbGVhZGVyX2h0dHAYAiABKAsyHS5ldmVudF9zdG9yZS5jbHVzdGVyLkVuZFBvaW50UgpsZWFkZXJIdHRwEjUKCXNlcnZlcl9pZBgDIAEoCzIYLmV2ZW50X3N0b3JlLmNsaWVudC5VVUlEUghzZXJ2ZXJJZBI+CgtzZXJ2ZXJfaHR0cBgEIAEoCzIdLmV2ZW50X3N0b3JlLmNsdXN0ZXIuRW5kUG9pbnRSCnNlcnZlckh0dHA=');
@$core.Deprecated('Use clusterInfoDescriptor instead')
const ClusterInfo$json = const {
  '1': 'ClusterInfo',
  '2': const [
    const {
      '1': 'members',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.event_store.cluster.MemberInfo',
      '10': 'members'
    },
  ],
};

/// Descriptor for `ClusterInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clusterInfoDescriptor = $convert.base64Decode(
    'CgtDbHVzdGVySW5mbxI5CgdtZW1iZXJzGAEgAygLMh8uZXZlbnRfc3RvcmUuY2x1c3Rlci5NZW1iZXJJbmZvUgdtZW1iZXJz');
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
      '6': '.event_store.client.UUID',
      '10': 'instanceId'
    },
    const {'1': 'time_stamp', '3': 2, '4': 1, '5': 3, '10': 'timeStamp'},
    const {
      '1': 'state',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.event_store.cluster.MemberInfo.VNodeState',
      '10': 'state'
    },
    const {'1': 'is_alive', '3': 4, '4': 1, '5': 8, '10': 'isAlive'},
    const {
      '1': 'http_end_point',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'httpEndPoint'
    },
    const {
      '1': 'internal_tcp',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'internalTcp'
    },
    const {
      '1': 'external_tcp',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.event_store.cluster.EndPoint',
      '10': 'externalTcp'
    },
    const {
      '1': 'internal_tcp_uses_tls',
      '3': 8,
      '4': 1,
      '5': 8,
      '10': 'internalTcpUsesTls'
    },
    const {
      '1': 'external_tcp_uses_tls',
      '3': 9,
      '4': 1,
      '5': 8,
      '10': 'externalTcpUsesTls'
    },
    const {
      '1': 'last_commit_position',
      '3': 10,
      '4': 1,
      '5': 3,
      '10': 'lastCommitPosition'
    },
    const {
      '1': 'writer_checkpoint',
      '3': 11,
      '4': 1,
      '5': 3,
      '10': 'writerCheckpoint'
    },
    const {
      '1': 'chaser_checkpoint',
      '3': 12,
      '4': 1,
      '5': 3,
      '10': 'chaserCheckpoint'
    },
    const {
      '1': 'epoch_position',
      '3': 13,
      '4': 1,
      '5': 3,
      '10': 'epochPosition'
    },
    const {'1': 'epoch_number', '3': 14, '4': 1, '5': 5, '10': 'epochNumber'},
    const {
      '1': 'epoch_id',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'epochId'
    },
    const {'1': 'node_priority', '3': 16, '4': 1, '5': 5, '10': 'nodePriority'},
    const {
      '1': 'is_read_only_replica',
      '3': 17,
      '4': 1,
      '5': 8,
      '10': 'isReadOnlyReplica'
    },
    const {
      '1': 'advertise_host_to_client_as',
      '3': 18,
      '4': 1,
      '5': 9,
      '10': 'advertiseHostToClientAs'
    },
    const {
      '1': 'advertise_http_port_to_client_as',
      '3': 19,
      '4': 1,
      '5': 13,
      '10': 'advertiseHttpPortToClientAs'
    },
    const {
      '1': 'advertise_tcp_port_to_client_as',
      '3': 20,
      '4': 1,
      '5': 13,
      '10': 'advertiseTcpPortToClientAs'
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
    'CgpNZW1iZXJJbmZvEjkKC2luc3RhbmNlX2lkGAEgASgLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSCmluc3RhbmNlSWQSHQoKdGltZV9zdGFtcBgCIAEoA1IJdGltZVN0YW1wEkAKBXN0YXRlGAMgASgOMiouZXZlbnRfc3RvcmUuY2x1c3Rlci5NZW1iZXJJbmZvLlZOb2RlU3RhdGVSBXN0YXRlEhkKCGlzX2FsaXZlGAQgASgIUgdpc0FsaXZlEkMKDmh0dHBfZW5kX3BvaW50GAUgASgLMh0uZXZlbnRfc3RvcmUuY2x1c3Rlci5FbmRQb2ludFIMaHR0cEVuZFBvaW50EkAKDGludGVybmFsX3RjcBgGIAEoCzIdLmV2ZW50X3N0b3JlLmNsdXN0ZXIuRW5kUG9pbnRSC2ludGVybmFsVGNwEkAKDGV4dGVybmFsX3RjcBgHIAEoCzIdLmV2ZW50X3N0b3JlLmNsdXN0ZXIuRW5kUG9pbnRSC2V4dGVybmFsVGNwEjEKFWludGVybmFsX3RjcF91c2VzX3RscxgIIAEoCFISaW50ZXJuYWxUY3BVc2VzVGxzEjEKFWV4dGVybmFsX3RjcF91c2VzX3RscxgJIAEoCFISZXh0ZXJuYWxUY3BVc2VzVGxzEjAKFGxhc3RfY29tbWl0X3Bvc2l0aW9uGAogASgDUhJsYXN0Q29tbWl0UG9zaXRpb24SKwoRd3JpdGVyX2NoZWNrcG9pbnQYCyABKANSEHdyaXRlckNoZWNrcG9pbnQSKwoRY2hhc2VyX2NoZWNrcG9pbnQYDCABKANSEGNoYXNlckNoZWNrcG9pbnQSJQoOZXBvY2hfcG9zaXRpb24YDSABKANSDWVwb2NoUG9zaXRpb24SIQoMZXBvY2hfbnVtYmVyGA4gASgFUgtlcG9jaE51bWJlchIzCghlcG9jaF9pZBgPIAEoCzIYLmV2ZW50X3N0b3JlLmNsaWVudC5VVUlEUgdlcG9jaElkEiMKDW5vZGVfcHJpb3JpdHkYECABKAVSDG5vZGVQcmlvcml0eRIvChRpc19yZWFkX29ubHlfcmVwbGljYRgRIAEoCFIRaXNSZWFkT25seVJlcGxpY2ESPAobYWR2ZXJ0aXNlX2hvc3RfdG9fY2xpZW50X2FzGBIgASgJUhdhZHZlcnRpc2VIb3N0VG9DbGllbnRBcxJFCiBhZHZlcnRpc2VfaHR0cF9wb3J0X3RvX2NsaWVudF9hcxgTIAEoDVIbYWR2ZXJ0aXNlSHR0cFBvcnRUb0NsaWVudEFzEkMKH2FkdmVydGlzZV90Y3BfcG9ydF90b19jbGllbnRfYXMYFCABKA1SGmFkdmVydGlzZVRjcFBvcnRUb0NsaWVudEFzIpoCCgpWTm9kZVN0YXRlEhAKDEluaXRpYWxpemluZxAAEhIKDkRpc2NvdmVyTGVhZGVyEAESCwoHVW5rbm93bhACEg4KClByZVJlcGxpY2EQAxIOCgpDYXRjaGluZ1VwEAQSCQoFQ2xvbmUQBRIMCghGb2xsb3dlchAGEg0KCVByZUxlYWRlchAHEgoKBkxlYWRlchAIEgsKB01hbmFnZXIQCRIQCgxTaHV0dGluZ0Rvd24QChIMCghTaHV0ZG93bhALEhYKElJlYWRPbmx5TGVhZGVybGVzcxAMEhYKElByZVJlYWRPbmx5UmVwbGljYRANEhMKD1JlYWRPbmx5UmVwbGljYRAOEhMKD1Jlc2lnbmluZ0xlYWRlchAP');
