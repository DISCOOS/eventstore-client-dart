///
//  Generated code. Do not modify.
//  source: shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use uUIDDescriptor instead')
const UUID$json = const {
  '1': 'UUID',
  '2': const [
    const {
      '1': 'structured',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.UUID.Structured',
      '9': 0,
      '10': 'structured'
    },
    const {'1': 'string', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'string'},
  ],
  '3': const [UUID_Structured$json],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use uUIDDescriptor instead')
const UUID_Structured$json = const {
  '1': 'Structured',
  '2': const [
    const {
      '1': 'most_significant_bits',
      '3': 1,
      '4': 1,
      '5': 3,
      '10': 'mostSignificantBits'
    },
    const {
      '1': 'least_significant_bits',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'leastSignificantBits'
    },
  ],
};

/// Descriptor for `UUID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uUIDDescriptor = $convert.base64Decode(
    'CgRVVUlEEkwKCnN0cnVjdHVyZWQYASABKAsyKi5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLlVVSUQuU3RydWN0dXJlZEgAUgpzdHJ1Y3R1cmVkEhgKBnN0cmluZxgCIAEoCUgAUgZzdHJpbmcadgoKU3RydWN0dXJlZBIyChVtb3N0X3NpZ25pZmljYW50X2JpdHMYASABKANSE21vc3RTaWduaWZpY2FudEJpdHMSNAoWbGVhc3Rfc2lnbmlmaWNhbnRfYml0cxgCIAEoA1IUbGVhc3RTaWduaWZpY2FudEJpdHNCBwoFdmFsdWU=');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use streamIdentifierDescriptor instead')
const StreamIdentifier$json = const {
  '1': 'StreamIdentifier',
  '2': const [
    const {'1': 'streamName', '3': 3, '4': 1, '5': 12, '10': 'streamName'},
  ],
  '9': const [
    const {'1': 1, '2': 3},
  ],
};

/// Descriptor for `StreamIdentifier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamIdentifierDescriptor = $convert.base64Decode(
    'ChBTdHJlYW1JZGVudGlmaWVyEh4KCnN0cmVhbU5hbWUYAyABKAxSCnN0cmVhbU5hbWVKBAgBEAM=');
