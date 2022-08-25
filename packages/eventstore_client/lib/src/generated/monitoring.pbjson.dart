///
//  Generated code. Do not modify.
//  source: monitoring.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use statsReqDescriptor instead')
const StatsReq$json = const {
  '1': 'StatsReq',
  '2': const [
    const {'1': 'use_metadata', '3': 1, '4': 1, '5': 8, '10': 'useMetadata'},
    const {
      '1': 'refresh_time_period_in_ms',
      '3': 4,
      '4': 1,
      '5': 4,
      '10': 'refreshTimePeriodInMs'
    },
  ],
};

/// Descriptor for `StatsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statsReqDescriptor = $convert.base64Decode(
    'CghTdGF0c1JlcRIhCgx1c2VfbWV0YWRhdGEYASABKAhSC3VzZU1ldGFkYXRhEjgKGXJlZnJlc2hfdGltZV9wZXJpb2RfaW5fbXMYBCABKARSFXJlZnJlc2hUaW1lUGVyaW9kSW5Ncw==');
@$core.Deprecated('Use statsRespDescriptor instead')
const StatsResp$json = const {
  '1': 'StatsResp',
  '2': const [
    const {
      '1': 'stats',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.event_store.client.monitoring.StatsResp.StatsEntry',
      '10': 'stats'
    },
  ],
  '3': const [StatsResp_StatsEntry$json],
};

@$core.Deprecated('Use statsRespDescriptor instead')
const StatsResp_StatsEntry$json = const {
  '1': 'StatsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `StatsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statsRespDescriptor = $convert.base64Decode(
    'CglTdGF0c1Jlc3ASSQoFc3RhdHMYASADKAsyMy5ldmVudF9zdG9yZS5jbGllbnQubW9uaXRvcmluZy5TdGF0c1Jlc3AuU3RhdHNFbnRyeVIFc3RhdHMaOAoKU3RhdHNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');
