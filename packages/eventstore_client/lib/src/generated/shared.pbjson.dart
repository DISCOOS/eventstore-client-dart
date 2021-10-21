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
      '6': '.event_store.client.UUID.Structured',
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
    'CgRVVUlEEkUKCnN0cnVjdHVyZWQYASABKAsyIy5ldmVudF9zdG9yZS5jbGllbnQuVVVJRC5TdHJ1Y3R1cmVkSABSCnN0cnVjdHVyZWQSGAoGc3RyaW5nGAIgASgJSABSBnN0cmluZxp2CgpTdHJ1Y3R1cmVkEjIKFW1vc3Rfc2lnbmlmaWNhbnRfYml0cxgBIAEoA1ITbW9zdFNpZ25pZmljYW50Qml0cxI0ChZsZWFzdF9zaWduaWZpY2FudF9iaXRzGAIgASgDUhRsZWFzdFNpZ25pZmljYW50Qml0c0IHCgV2YWx1ZQ==');
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
    const {'1': 'stream_name', '3': 3, '4': 1, '5': 12, '10': 'streamId'},
  ],
  '9': const [
    const {'1': 1, '2': 3},
  ],
};

/// Descriptor for `StreamIdentifier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamIdentifierDescriptor = $convert.base64Decode(
    'ChBTdHJlYW1JZGVudGlmaWVyEh8KC3N0cmVhbV9uYW1lGAMgASgMUgpzdHJlYW1OYW1lSgQIARAD');
@$core.Deprecated('Use allStreamPositionDescriptor instead')
const AllStreamPosition$json = const {
  '1': 'AllStreamPosition',
  '2': const [
    const {
      '1': 'commit_position',
      '3': 1,
      '4': 1,
      '5': 4,
      '10': 'commitPosition'
    },
    const {
      '1': 'prepare_position',
      '3': 2,
      '4': 1,
      '5': 4,
      '10': 'preparePosition'
    },
  ],
};

/// Descriptor for `AllStreamPosition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List allStreamPositionDescriptor = $convert.base64Decode(
    'ChFBbGxTdHJlYW1Qb3NpdGlvbhInCg9jb21taXRfcG9zaXRpb24YASABKARSDmNvbW1pdFBvc2l0aW9uEikKEHByZXBhcmVfcG9zaXRpb24YAiABKARSD3ByZXBhcmVQb3NpdGlvbg==');
@$core.Deprecated('Use wrongExpectedVersionDescriptor instead')
const WrongExpectedVersion$json = const {
  '1': 'WrongExpectedVersion',
  '2': const [
    const {
      '1': 'current_stream_revision',
      '3': 1,
      '4': 1,
      '5': 4,
      '9': 0,
      '10': 'currentStreamRevision'
    },
    const {
      '1': 'current_no_stream',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'currentNoStream'
    },
    const {
      '1': 'expected_stream_position',
      '3': 3,
      '4': 1,
      '5': 4,
      '9': 1,
      '10': 'expectedStreamPosition'
    },
    const {
      '1': 'expected_any',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 1,
      '10': 'expectedAny'
    },
    const {
      '1': 'expected_stream_exists',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 1,
      '10': 'expectedStreamExists'
    },
    const {
      '1': 'expected_no_stream',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 1,
      '10': 'expectedNoStream'
    },
  ],
  '8': const [
    const {'1': 'current_stream_revision_option'},
    const {'1': 'expected_stream_position_option'},
  ],
};

/// Descriptor for `WrongExpectedVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wrongExpectedVersionDescriptor = $convert.base64Decode(
    'ChRXcm9uZ0V4cGVjdGVkVmVyc2lvbhI4ChdjdXJyZW50X3N0cmVhbV9yZXZpc2lvbhgBIAEoBEgAUhVjdXJyZW50U3RyZWFtUmV2aXNpb24SRAoRY3VycmVudF9ub19zdHJlYW0YAiABKAsyFi5nb29nbGUucHJvdG9idWYuRW1wdHlIAFIPY3VycmVudE5vU3RyZWFtEjoKGGV4cGVjdGVkX3N0cmVhbV9wb3NpdGlvbhgDIAEoBEgBUhZleHBlY3RlZFN0cmVhbVBvc2l0aW9uEjsKDGV4cGVjdGVkX2FueRgEIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgBUgtleHBlY3RlZEFueRJOChZleHBlY3RlZF9zdHJlYW1fZXhpc3RzGAUgASgLMhYuZ29vZ2xlLnByb3RvYnVmLkVtcHR5SAFSFGV4cGVjdGVkU3RyZWFtRXhpc3RzEkYKEmV4cGVjdGVkX25vX3N0cmVhbRgGIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgBUhBleHBlY3RlZE5vU3RyZWFtQiAKHmN1cnJlbnRfc3RyZWFtX3JldmlzaW9uX29wdGlvbkIhCh9leHBlY3RlZF9zdHJlYW1fcG9zaXRpb25fb3B0aW9u');
@$core.Deprecated('Use accessDeniedDescriptor instead')
const AccessDenied$json = const {
  '1': 'AccessDenied',
};

/// Descriptor for `AccessDenied`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessDeniedDescriptor =
    $convert.base64Decode('CgxBY2Nlc3NEZW5pZWQ=');
@$core.Deprecated('Use streamDeletedDescriptor instead')
const StreamDeleted$json = const {
  '1': 'StreamDeleted',
  '2': const [
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '10': 'streamIdentifier'
    },
  ],
};

/// Descriptor for `StreamDeleted`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamDeletedDescriptor = $convert.base64Decode(
    'Cg1TdHJlYW1EZWxldGVkElEKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJSEHN0cmVhbUlkZW50aWZpZXI=');
@$core.Deprecated('Use timeoutDescriptor instead')
const Timeout$json = const {
  '1': 'Timeout',
};

/// Descriptor for `Timeout`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeoutDescriptor =
    $convert.base64Decode('CgdUaW1lb3V0');
@$core.Deprecated('Use unknownDescriptor instead')
const Unknown$json = const {
  '1': 'Unknown',
};

/// Descriptor for `Unknown`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unknownDescriptor =
    $convert.base64Decode('CgdVbmtub3du');
@$core.Deprecated('Use invalidTransactionDescriptor instead')
const InvalidTransaction$json = const {
  '1': 'InvalidTransaction',
};

/// Descriptor for `InvalidTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invalidTransactionDescriptor =
    $convert.base64Decode('ChJJbnZhbGlkVHJhbnNhY3Rpb24=');
@$core.Deprecated('Use maximumAppendSizeExceededDescriptor instead')
const MaximumAppendSizeExceeded$json = const {
  '1': 'MaximumAppendSizeExceeded',
  '2': const [
    const {
      '1': 'maxAppendSize',
      '3': 1,
      '4': 1,
      '5': 13,
      '10': 'maxAppendSize'
    },
  ],
};

/// Descriptor for `MaximumAppendSizeExceeded`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List maximumAppendSizeExceededDescriptor =
    $convert.base64Decode(
        'ChlNYXhpbXVtQXBwZW5kU2l6ZUV4Y2VlZGVkEiQKDW1heEFwcGVuZFNpemUYASABKA1SDW1heEFwcGVuZFNpemU=');
@$core.Deprecated('Use badRequestDescriptor instead')
const BadRequest$json = const {
  '1': 'BadRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `BadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List badRequestDescriptor = $convert
    .base64Decode('CgpCYWRSZXF1ZXN0EhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
