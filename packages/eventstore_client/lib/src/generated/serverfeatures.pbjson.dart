///
//  Generated code. Do not modify.
//  source: serverfeatures.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use supportedMethodsDescriptor instead')
const SupportedMethods$json = const {
  '1': 'SupportedMethods',
  '2': const [
    const {
      '1': 'methods',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.event_store.client.server_features.SupportedMethod',
      '10': 'methods'
    },
    const {
      '1': 'event_store_server_version',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'eventStoreServerVersion'
    },
  ],
};

/// Descriptor for `SupportedMethods`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportedMethodsDescriptor = $convert.base64Decode(
    'ChBTdXBwb3J0ZWRNZXRob2RzEk0KB21ldGhvZHMYASADKAsyMy5ldmVudF9zdG9yZS5jbGllbnQuc2VydmVyX2ZlYXR1cmVzLlN1cHBvcnRlZE1ldGhvZFIHbWV0aG9kcxI7ChpldmVudF9zdG9yZV9zZXJ2ZXJfdmVyc2lvbhgCIAEoCVIXZXZlbnRTdG9yZVNlcnZlclZlcnNpb24=');
@$core.Deprecated('Use supportedMethodDescriptor instead')
const SupportedMethod$json = const {
  '1': 'SupportedMethod',
  '2': const [
    const {'1': 'method_name', '3': 1, '4': 1, '5': 9, '10': 'methodName'},
    const {'1': 'service_name', '3': 2, '4': 1, '5': 9, '10': 'serviceName'},
    const {'1': 'features', '3': 3, '4': 3, '5': 9, '10': 'features'},
  ],
};

/// Descriptor for `SupportedMethod`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportedMethodDescriptor = $convert.base64Decode(
    'Cg9TdXBwb3J0ZWRNZXRob2QSHwoLbWV0aG9kX25hbWUYASABKAlSCm1ldGhvZE5hbWUSIQoMc2VydmljZV9uYW1lGAIgASgJUgtzZXJ2aWNlTmFtZRIaCghmZWF0dXJlcxgDIAMoCVIIZmVhdHVyZXM=');
