///
//  Generated code. Do not modify.
//  source: operations.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use startScavengeReqDescriptor instead')
const StartScavengeReq$json = const {
  '1': 'StartScavengeReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.operations.StartScavengeReq.Options',
      '10': 'options'
    },
  ],
  '3': const [StartScavengeReq_Options$json],
};

@$core.Deprecated('Use startScavengeReqDescriptor instead')
const StartScavengeReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'thread_count', '3': 1, '4': 1, '5': 5, '10': 'threadCount'},
    const {
      '1': 'start_from_chunk',
      '3': 2,
      '4': 1,
      '5': 5,
      '10': 'startFromChunk'
    },
  ],
};

/// Descriptor for `StartScavengeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startScavengeReqDescriptor = $convert.base64Decode(
    'ChBTdGFydFNjYXZlbmdlUmVxElEKB29wdGlvbnMYASABKAsyNy5ldmVudF9zdG9yZS5jbGllbnQub3BlcmF0aW9ucy5TdGFydFNjYXZlbmdlUmVxLk9wdGlvbnNSB29wdGlvbnMaVgoHT3B0aW9ucxIhCgx0aHJlYWRfY291bnQYASABKAVSC3RocmVhZENvdW50EigKEHN0YXJ0X2Zyb21fY2h1bmsYAiABKAVSDnN0YXJ0RnJvbUNodW5r');
@$core.Deprecated('Use stopScavengeReqDescriptor instead')
const StopScavengeReq$json = const {
  '1': 'StopScavengeReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.operations.StopScavengeReq.Options',
      '10': 'options'
    },
  ],
  '3': const [StopScavengeReq_Options$json],
};

@$core.Deprecated('Use stopScavengeReqDescriptor instead')
const StopScavengeReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'scavenge_id', '3': 1, '4': 1, '5': 9, '10': 'scavengeId'},
  ],
};

/// Descriptor for `StopScavengeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopScavengeReqDescriptor = $convert.base64Decode(
    'Cg9TdG9wU2NhdmVuZ2VSZXESUAoHb3B0aW9ucxgBIAEoCzI2LmV2ZW50X3N0b3JlLmNsaWVudC5vcGVyYXRpb25zLlN0b3BTY2F2ZW5nZVJlcS5PcHRpb25zUgdvcHRpb25zGioKB09wdGlvbnMSHwoLc2NhdmVuZ2VfaWQYASABKAlSCnNjYXZlbmdlSWQ=');
@$core.Deprecated('Use scavengeRespDescriptor instead')
const ScavengeResp$json = const {
  '1': 'ScavengeResp',
  '2': const [
    const {'1': 'scavenge_id', '3': 1, '4': 1, '5': 9, '10': 'scavengeId'},
    const {
      '1': 'scavenge_result',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.event_store.client.operations.ScavengeResp.ScavengeResult',
      '10': 'scavengeResult'
    },
  ],
  '4': const [ScavengeResp_ScavengeResult$json],
};

@$core.Deprecated('Use scavengeRespDescriptor instead')
const ScavengeResp_ScavengeResult$json = const {
  '1': 'ScavengeResult',
  '2': const [
    const {'1': 'Started', '2': 0},
    const {'1': 'InProgress', '2': 1},
    const {'1': 'Stopped', '2': 2},
  ],
};

/// Descriptor for `ScavengeResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scavengeRespDescriptor = $convert.base64Decode(
    'CgxTY2F2ZW5nZVJlc3ASHwoLc2NhdmVuZ2VfaWQYASABKAlSCnNjYXZlbmdlSWQSYwoPc2NhdmVuZ2VfcmVzdWx0GAIgASgOMjouZXZlbnRfc3RvcmUuY2xpZW50Lm9wZXJhdGlvbnMuU2NhdmVuZ2VSZXNwLlNjYXZlbmdlUmVzdWx0Ug5zY2F2ZW5nZVJlc3VsdCI6Cg5TY2F2ZW5nZVJlc3VsdBILCgdTdGFydGVkEAASDgoKSW5Qcm9ncmVzcxABEgsKB1N0b3BwZWQQAg==');
@$core.Deprecated('Use setNodePriorityReqDescriptor instead')
const SetNodePriorityReq$json = const {
  '1': 'SetNodePriorityReq',
  '2': const [
    const {'1': 'priority', '3': 1, '4': 1, '5': 5, '10': 'priority'},
  ],
};

/// Descriptor for `SetNodePriorityReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setNodePriorityReqDescriptor =
    $convert.base64Decode(
        'ChJTZXROb2RlUHJpb3JpdHlSZXESGgoIcHJpb3JpdHkYASABKAVSCHByaW9yaXR5');
