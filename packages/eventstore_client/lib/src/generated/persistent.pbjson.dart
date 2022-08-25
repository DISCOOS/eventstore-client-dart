///
//  Generated code. Do not modify.
//  source: persistent.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq$json = const {
  '1': 'ReadReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.ReadReq.Options',
      '9': 0,
      '10': 'options'
    },
    const {
      '1': 'ack',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.ReadReq.Ack',
      '9': 0,
      '10': 'ack'
    },
    const {
      '1': 'nack',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.ReadReq.Nack',
      '9': 0,
      '10': 'nack'
    },
  ],
  '3': const [ReadReq_Options$json, ReadReq_Ack$json, ReadReq_Nack$json],
  '8': const [
    const {'1': 'content'},
  ],
};

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '9': 0,
      '10': 'streamIdentifier'
    },
    const {
      '1': 'all',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'all'
    },
    const {'1': 'group_name', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
    const {'1': 'buffer_size', '3': 3, '4': 1, '5': 5, '10': 'bufferSize'},
    const {
      '1': 'uuid_option',
      '3': 4,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.ReadReq.Options.UUIDOption',
      '10': 'uuidOption'
    },
  ],
  '3': const [ReadReq_Options_UUIDOption$json],
  '8': const [
    const {'1': 'stream_option'},
  ],
};

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Options_UUIDOption$json = const {
  '1': 'UUIDOption',
  '2': const [
    const {
      '1': 'structured',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'structured'
    },
    const {
      '1': 'string',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'string'
    },
  ],
  '8': const [
    const {'1': 'content'},
  ],
};

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Ack$json = const {
  '1': 'Ack',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    const {
      '1': 'ids',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'ids'
    },
  ],
};

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Nack$json = const {
  '1': 'Nack',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    const {
      '1': 'ids',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'ids'
    },
    const {
      '1': 'action',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.event_store.client.persistent_subscriptions.ReadReq.Nack.Action',
      '10': 'action'
    },
    const {'1': 'reason', '3': 4, '4': 1, '5': 9, '10': 'reason'},
  ],
  '4': const [ReadReq_Nack_Action$json],
};

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Nack_Action$json = const {
  '1': 'Action',
  '2': const [
    const {'1': 'Unknown', '2': 0},
    const {'1': 'Park', '2': 1},
    const {'1': 'Retry', '2': 2},
    const {'1': 'Skip', '2': 3},
    const {'1': 'Stop', '2': 4},
  ],
};

/// Descriptor for `ReadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readReqDescriptor = $convert.base64Decode(
    'CgdSZWFkUmVxElgKB29wdGlvbnMYASABKAsyPC5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlJlYWRSZXEuT3B0aW9uc0gAUgdvcHRpb25zEkwKA2FjaxgCIAEoCzI4LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuUmVhZFJlcS5BY2tIAFIDYWNrEk8KBG5hY2sYAyABKAsyOS5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlJlYWRSZXEuTmFja0gAUgRuYWNrGtQDCgdPcHRpb25zElMKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJIAFIQc3RyZWFtSWRlbnRpZmllchItCgNhbGwYBSABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIDYWxsEh0KCmdyb3VwX25hbWUYAiABKAlSCWdyb3VwTmFtZRIfCgtidWZmZXJfc2l6ZRgDIAEoBVIKYnVmZmVyU2l6ZRJoCgt1dWlkX29wdGlvbhgEIAEoCzJHLmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuUmVhZFJlcS5PcHRpb25zLlVVSURPcHRpb25SCnV1aWRPcHRpb24aiQEKClVVSURPcHRpb24SOwoKc3RydWN0dXJlZBgBIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgpzdHJ1Y3R1cmVkEjMKBnN0cmluZxgCIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgZzdHJpbmdCCQoHY29udGVudEIPCg1zdHJlYW1fb3B0aW9uGkEKA0FjaxIOCgJpZBgBIAEoDFICaWQSKgoDaWRzGAIgAygLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSA2lkcxr0AQoETmFjaxIOCgJpZBgBIAEoDFICaWQSKgoDaWRzGAIgAygLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSA2lkcxJYCgZhY3Rpb24YAyABKA4yQC5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlJlYWRSZXEuTmFjay5BY3Rpb25SBmFjdGlvbhIWCgZyZWFzb24YBCABKAlSBnJlYXNvbiI+CgZBY3Rpb24SCwoHVW5rbm93bhAAEggKBFBhcmsQARIJCgVSZXRyeRACEggKBFNraXAQAxIICgRTdG9wEARCCQoHY29udGVudA==');
@$core.Deprecated('Use readRespDescriptor instead')
const ReadResp$json = const {
  '1': 'ReadResp',
  '2': const [
    const {
      '1': 'event',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.ReadResp.ReadEvent',
      '9': 0,
      '10': 'event'
    },
    const {
      '1': 'subscription_confirmation',
      '3': 2,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.ReadResp.SubscriptionConfirmation',
      '9': 0,
      '10': 'subscriptionConfirmation'
    },
  ],
  '3': const [ReadResp_ReadEvent$json, ReadResp_SubscriptionConfirmation$json],
  '8': const [
    const {'1': 'content'},
  ],
};

@$core.Deprecated('Use readRespDescriptor instead')
const ReadResp_ReadEvent$json = const {
  '1': 'ReadEvent',
  '2': const [
    const {
      '1': 'event',
      '3': 1,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.ReadResp.ReadEvent.RecordedEvent',
      '10': 'event'
    },
    const {
      '1': 'link',
      '3': 2,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.ReadResp.ReadEvent.RecordedEvent',
      '10': 'link'
    },
    const {
      '1': 'commit_position',
      '3': 3,
      '4': 1,
      '5': 4,
      '9': 0,
      '10': 'commitPosition'
    },
    const {
      '1': 'no_position',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'noPosition'
    },
    const {
      '1': 'retry_count',
      '3': 5,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'retryCount'
    },
    const {
      '1': 'no_retry_count',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 1,
      '10': 'noRetryCount'
    },
  ],
  '3': const [ReadResp_ReadEvent_RecordedEvent$json],
  '8': const [
    const {'1': 'position'},
    const {'1': 'count'},
  ],
};

@$core.Deprecated('Use readRespDescriptor instead')
const ReadResp_ReadEvent_RecordedEvent$json = const {
  '1': 'RecordedEvent',
  '2': const [
    const {
      '1': 'id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'id'
    },
    const {
      '1': 'stream_identifier',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '10': 'streamIdentifier'
    },
    const {
      '1': 'stream_revision',
      '3': 3,
      '4': 1,
      '5': 4,
      '10': 'streamRevision'
    },
    const {
      '1': 'prepare_position',
      '3': 4,
      '4': 1,
      '5': 4,
      '10': 'preparePosition'
    },
    const {
      '1': 'commit_position',
      '3': 5,
      '4': 1,
      '5': 4,
      '10': 'commitPosition'
    },
    const {
      '1': 'metadata',
      '3': 6,
      '4': 3,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.ReadResp.ReadEvent.RecordedEvent.MetadataEntry',
      '10': 'metadata'
    },
    const {
      '1': 'custom_metadata',
      '3': 7,
      '4': 1,
      '5': 12,
      '10': 'customMetadata'
    },
    const {'1': 'data', '3': 8, '4': 1, '5': 12, '10': 'data'},
  ],
  '3': const [ReadResp_ReadEvent_RecordedEvent_MetadataEntry$json],
};

@$core.Deprecated('Use readRespDescriptor instead')
const ReadResp_ReadEvent_RecordedEvent_MetadataEntry$json = const {
  '1': 'MetadataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use readRespDescriptor instead')
const ReadResp_SubscriptionConfirmation$json = const {
  '1': 'SubscriptionConfirmation',
  '2': const [
    const {
      '1': 'subscription_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'subscriptionId'
    },
  ],
};

/// Descriptor for `ReadResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readRespDescriptor = $convert.base64Decode(
    'CghSZWFkUmVzcBJXCgVldmVudBgBIAEoCzI/LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuUmVhZFJlc3AuUmVhZEV2ZW50SABSBWV2ZW50Eo0BChlzdWJzY3JpcHRpb25fY29uZmlybWF0aW9uGAIgASgLMk4uZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5SZWFkUmVzcC5TdWJzY3JpcHRpb25Db25maXJtYXRpb25IAFIYc3Vic2NyaXB0aW9uQ29uZmlybWF0aW9uGrYHCglSZWFkRXZlbnQSYwoFZXZlbnQYASABKAsyTS5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlJlYWRSZXNwLlJlYWRFdmVudC5SZWNvcmRlZEV2ZW50UgVldmVudBJhCgRsaW5rGAIgASgLMk0uZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5SZWFkUmVzcC5SZWFkRXZlbnQuUmVjb3JkZWRFdmVudFIEbGluaxIpCg9jb21taXRfcG9zaXRpb24YAyABKARIAFIOY29tbWl0UG9zaXRpb24SPAoLbm9fcG9zaXRpb24YBCABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIKbm9Qb3NpdGlvbhIhCgtyZXRyeV9jb3VudBgFIAEoBUgBUgpyZXRyeUNvdW50EkEKDm5vX3JldHJ5X2NvdW50GAYgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SAFSDG5vUmV0cnlDb3VudBr8AwoNUmVjb3JkZWRFdmVudBIoCgJpZBgBIAEoCzIYLmV2ZW50X3N0b3JlLmNsaWVudC5VVUlEUgJpZBJRChFzdHJlYW1faWRlbnRpZmllchgCIAEoCzIkLmV2ZW50X3N0b3JlLmNsaWVudC5TdHJlYW1JZGVudGlmaWVyUhBzdHJlYW1JZGVudGlmaWVyEicKD3N0cmVhbV9yZXZpc2lvbhgDIAEoBFIOc3RyZWFtUmV2aXNpb24SKQoQcHJlcGFyZV9wb3NpdGlvbhgEIAEoBFIPcHJlcGFyZVBvc2l0aW9uEicKD2NvbW1pdF9wb3NpdGlvbhgFIAEoBFIOY29tbWl0UG9zaXRpb24SdwoIbWV0YWRhdGEYBiADKAsyWy5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlJlYWRSZXNwLlJlYWRFdmVudC5SZWNvcmRlZEV2ZW50Lk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhEicKD2N1c3RvbV9tZXRhZGF0YRgHIAEoDFIOY3VzdG9tTWV0YWRhdGESEgoEZGF0YRgIIAEoDFIEZGF0YRo7Cg1NZXRhZGF0YUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAFCCgoIcG9zaXRpb25CBwoFY291bnQaQwoYU3Vic2NyaXB0aW9uQ29uZmlybWF0aW9uEicKD3N1YnNjcmlwdGlvbl9pZBgBIAEoCVIOc3Vic2NyaXB0aW9uSWRCCQoHY29udGVudA==');
@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq$json = const {
  '1': 'CreateReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.CreateReq.Options',
      '10': 'options'
    },
  ],
  '3': const [
    CreateReq_Options$json,
    CreateReq_StreamOptions$json,
    CreateReq_AllOptions$json,
    CreateReq_Position$json,
    CreateReq_Settings$json
  ],
  '4': const [CreateReq_ConsumerStrategy$json],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {
      '1': 'stream',
      '3': 4,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.CreateReq.StreamOptions',
      '9': 0,
      '10': 'stream'
    },
    const {
      '1': 'all',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.CreateReq.AllOptions',
      '9': 0,
      '10': 'all'
    },
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '8': const {'3': true},
      '10': 'streamIdentifier',
    },
    const {'1': 'group_name', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
    const {
      '1': 'settings',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.CreateReq.Settings',
      '10': 'settings'
    },
  ],
  '8': const [
    const {'1': 'stream_option'},
  ],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_StreamOptions$json = const {
  '1': 'StreamOptions',
  '2': const [
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '10': 'streamIdentifier'
    },
    const {'1': 'revision', '3': 2, '4': 1, '5': 4, '9': 0, '10': 'revision'},
    const {
      '1': 'start',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'start'
    },
    const {
      '1': 'end',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'end'
    },
  ],
  '8': const [
    const {'1': 'revision_option'},
  ],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_AllOptions$json = const {
  '1': 'AllOptions',
  '2': const [
    const {
      '1': 'position',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.CreateReq.Position',
      '9': 0,
      '10': 'position'
    },
    const {
      '1': 'start',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'start'
    },
    const {
      '1': 'end',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'end'
    },
    const {
      '1': 'filter',
      '3': 4,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.CreateReq.AllOptions.FilterOptions',
      '9': 1,
      '10': 'filter'
    },
    const {
      '1': 'no_filter',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 1,
      '10': 'noFilter'
    },
  ],
  '3': const [CreateReq_AllOptions_FilterOptions$json],
  '8': const [
    const {'1': 'all_option'},
    const {'1': 'filter_option'},
  ],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_AllOptions_FilterOptions$json = const {
  '1': 'FilterOptions',
  '2': const [
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.CreateReq.AllOptions.FilterOptions.Expression',
      '9': 0,
      '10': 'streamIdentifier'
    },
    const {
      '1': 'event_type',
      '3': 2,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.CreateReq.AllOptions.FilterOptions.Expression',
      '9': 0,
      '10': 'eventType'
    },
    const {'1': 'max', '3': 3, '4': 1, '5': 13, '9': 1, '10': 'max'},
    const {
      '1': 'count',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 1,
      '10': 'count'
    },
    const {
      '1': 'checkpointIntervalMultiplier',
      '3': 5,
      '4': 1,
      '5': 13,
      '10': 'checkpointIntervalMultiplier'
    },
  ],
  '3': const [CreateReq_AllOptions_FilterOptions_Expression$json],
  '8': const [
    const {'1': 'filter'},
    const {'1': 'window'},
  ],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_AllOptions_FilterOptions_Expression$json = const {
  '1': 'Expression',
  '2': const [
    const {'1': 'regex', '3': 1, '4': 1, '5': 9, '10': 'regex'},
    const {'1': 'prefix', '3': 2, '4': 3, '5': 9, '10': 'prefix'},
  ],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_Position$json = const {
  '1': 'Position',
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

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_Settings$json = const {
  '1': 'Settings',
  '2': const [
    const {'1': 'resolve_links', '3': 1, '4': 1, '5': 8, '10': 'resolveLinks'},
    const {
      '1': 'revision',
      '3': 2,
      '4': 1,
      '5': 4,
      '8': const {'3': true},
      '10': 'revision',
    },
    const {
      '1': 'extra_statistics',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'extraStatistics'
    },
    const {
      '1': 'max_retry_count',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'maxRetryCount'
    },
    const {
      '1': 'min_checkpoint_count',
      '3': 7,
      '4': 1,
      '5': 5,
      '10': 'minCheckpointCount'
    },
    const {
      '1': 'max_checkpoint_count',
      '3': 8,
      '4': 1,
      '5': 5,
      '10': 'maxCheckpointCount'
    },
    const {
      '1': 'max_subscriber_count',
      '3': 9,
      '4': 1,
      '5': 5,
      '10': 'maxSubscriberCount'
    },
    const {
      '1': 'live_buffer_size',
      '3': 10,
      '4': 1,
      '5': 5,
      '10': 'liveBufferSize'
    },
    const {
      '1': 'read_batch_size',
      '3': 11,
      '4': 1,
      '5': 5,
      '10': 'readBatchSize'
    },
    const {
      '1': 'history_buffer_size',
      '3': 12,
      '4': 1,
      '5': 5,
      '10': 'historyBufferSize'
    },
    const {
      '1': 'named_consumer_strategy',
      '3': 13,
      '4': 1,
      '5': 14,
      '6':
          '.event_store.client.persistent_subscriptions.CreateReq.ConsumerStrategy',
      '8': const {'3': true},
      '10': 'namedConsumerStrategy',
    },
    const {
      '1': 'message_timeout_ticks',
      '3': 4,
      '4': 1,
      '5': 3,
      '9': 0,
      '10': 'messageTimeoutTicks'
    },
    const {
      '1': 'message_timeout_ms',
      '3': 14,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'messageTimeoutMs'
    },
    const {
      '1': 'checkpoint_after_ticks',
      '3': 6,
      '4': 1,
      '5': 3,
      '9': 1,
      '10': 'checkpointAfterTicks'
    },
    const {
      '1': 'checkpoint_after_ms',
      '3': 15,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'checkpointAfterMs'
    },
    const {
      '1': 'consumer_strategy',
      '3': 16,
      '4': 1,
      '5': 9,
      '10': 'consumerStrategy'
    },
  ],
  '8': const [
    const {'1': 'message_timeout'},
    const {'1': 'checkpoint_after'},
  ],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_ConsumerStrategy$json = const {
  '1': 'ConsumerStrategy',
  '2': const [
    const {'1': 'DispatchToSingle', '2': 0},
    const {'1': 'RoundRobin', '2': 1},
    const {'1': 'Pinned', '2': 2},
  ],
};

/// Descriptor for `CreateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReqDescriptor = $convert.base64Decode(
    'CglDcmVhdGVSZXESWAoHb3B0aW9ucxgBIAEoCzI+LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuQ3JlYXRlUmVxLk9wdGlvbnNSB29wdGlvbnMapAMKB09wdGlvbnMSXgoGc3RyZWFtGAQgASgLMkQuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuU3RyZWFtT3B0aW9uc0gAUgZzdHJlYW0SVQoDYWxsGAUgASgLMkEuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuQWxsT3B0aW9uc0gAUgNhbGwSVQoRc3RyZWFtX2lkZW50aWZpZXIYASABKAsyJC5ldmVudF9zdG9yZS5jbGllbnQuU3RyZWFtSWRlbnRpZmllckICGAFSEHN0cmVhbUlkZW50aWZpZXISHQoKZ3JvdXBfbmFtZRgCIAEoCVIJZ3JvdXBOYW1lElsKCHNldHRpbmdzGAMgASgLMj8uZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuU2V0dGluZ3NSCHNldHRpbmdzQg8KDXN0cmVhbV9vcHRpb24a9QEKDVN0cmVhbU9wdGlvbnMSUQoRc3RyZWFtX2lkZW50aWZpZXIYASABKAsyJC5ldmVudF9zdG9yZS5jbGllbnQuU3RyZWFtSWRlbnRpZmllclIQc3RyZWFtSWRlbnRpZmllchIcCghyZXZpc2lvbhgCIAEoBEgAUghyZXZpc2lvbhIxCgVzdGFydBgDIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgVzdGFydBItCgNlbmQYBCABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIDZW5kQhEKD3JldmlzaW9uX29wdGlvbhqHBwoKQWxsT3B0aW9ucxJdCghwb3NpdGlvbhgBIAEoCzI/LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuQ3JlYXRlUmVxLlBvc2l0aW9uSABSCHBvc2l0aW9uEjEKBXN0YXJ0GAIgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSBXN0YXJ0Ei0KA2VuZBgDIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgNlbmQSaQoGZmlsdGVyGAQgASgLMk8uZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuQWxsT3B0aW9ucy5GaWx0ZXJPcHRpb25zSAFSBmZpbHRlchI4Cglub19maWx0ZXIYBSABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAVIIbm9GaWx0ZXIa8wMKDUZpbHRlck9wdGlvbnMSiQEKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMlouZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuQWxsT3B0aW9ucy5GaWx0ZXJPcHRpb25zLkV4cHJlc3Npb25IAFIQc3RyZWFtSWRlbnRpZmllchJ7CgpldmVudF90eXBlGAIgASgLMlouZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuQWxsT3B0aW9ucy5GaWx0ZXJPcHRpb25zLkV4cHJlc3Npb25IAFIJZXZlbnRUeXBlEhIKA21heBgDIAEoDUgBUgNtYXgSMQoFY291bnQYBCABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAVIFY291bnQSQgocY2hlY2twb2ludEludGVydmFsTXVsdGlwbGllchgFIAEoDVIcY2hlY2twb2ludEludGVydmFsTXVsdGlwbGllcho6CgpFeHByZXNzaW9uEhQKBXJlZ2V4GAEgASgJUgVyZWdleBIWCgZwcmVmaXgYAiADKAlSBnByZWZpeEIICgZmaWx0ZXJCCAoGd2luZG93QgwKCmFsbF9vcHRpb25CDwoNZmlsdGVyX29wdGlvbhpeCghQb3NpdGlvbhInCg9jb21taXRfcG9zaXRpb24YASABKARSDmNvbW1pdFBvc2l0aW9uEikKEHByZXBhcmVfcG9zaXRpb24YAiABKARSD3ByZXBhcmVQb3NpdGlvbhrkBgoIU2V0dGluZ3MSIwoNcmVzb2x2ZV9saW5rcxgBIAEoCFIMcmVzb2x2ZUxpbmtzEh4KCHJldmlzaW9uGAIgASgEQgIYAVIIcmV2aXNpb24SKQoQZXh0cmFfc3RhdGlzdGljcxgDIAEoCFIPZXh0cmFTdGF0aXN0aWNzEiYKD21heF9yZXRyeV9jb3VudBgFIAEoBVINbWF4UmV0cnlDb3VudBIwChRtaW5fY2hlY2twb2ludF9jb3VudBgHIAEoBVISbWluQ2hlY2twb2ludENvdW50EjAKFG1heF9jaGVja3BvaW50X2NvdW50GAggASgFUhJtYXhDaGVja3BvaW50Q291bnQSMAoUbWF4X3N1YnNjcmliZXJfY291bnQYCSABKAVSEm1heFN1YnNjcmliZXJDb3VudBIoChBsaXZlX2J1ZmZlcl9zaXplGAogASgFUg5saXZlQnVmZmVyU2l6ZRImCg9yZWFkX2JhdGNoX3NpemUYCyABKAVSDXJlYWRCYXRjaFNpemUSLgoTaGlzdG9yeV9idWZmZXJfc2l6ZRgMIAEoBVIRaGlzdG9yeUJ1ZmZlclNpemUSgwEKF25hbWVkX2NvbnN1bWVyX3N0cmF0ZWd5GA0gASgOMkcuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuQ29uc3VtZXJTdHJhdGVneUICGAFSFW5hbWVkQ29uc3VtZXJTdHJhdGVneRI0ChVtZXNzYWdlX3RpbWVvdXRfdGlja3MYBCABKANIAFITbWVzc2FnZVRpbWVvdXRUaWNrcxIuChJtZXNzYWdlX3RpbWVvdXRfbXMYDiABKAVIAFIQbWVzc2FnZVRpbWVvdXRNcxI2ChZjaGVja3BvaW50X2FmdGVyX3RpY2tzGAYgASgDSAFSFGNoZWNrcG9pbnRBZnRlclRpY2tzEjAKE2NoZWNrcG9pbnRfYWZ0ZXJfbXMYDyABKAVIAVIRY2hlY2twb2ludEFmdGVyTXMSKwoRY29uc3VtZXJfc3RyYXRlZ3kYECABKAlSEGNvbnN1bWVyU3RyYXRlZ3lCEQoPbWVzc2FnZV90aW1lb3V0QhIKEGNoZWNrcG9pbnRfYWZ0ZXIiRAoQQ29uc3VtZXJTdHJhdGVneRIUChBEaXNwYXRjaFRvU2luZ2xlEAASDgoKUm91bmRSb2JpbhABEgoKBlBpbm5lZBAC');
@$core.Deprecated('Use createRespDescriptor instead')
const CreateResp$json = const {
  '1': 'CreateResp',
};

/// Descriptor for `CreateResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRespDescriptor =
    $convert.base64Decode('CgpDcmVhdGVSZXNw');
@$core.Deprecated('Use updateReqDescriptor instead')
const UpdateReq$json = const {
  '1': 'UpdateReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.UpdateReq.Options',
      '10': 'options'
    },
  ],
  '3': const [
    UpdateReq_Options$json,
    UpdateReq_StreamOptions$json,
    UpdateReq_AllOptions$json,
    UpdateReq_Position$json,
    UpdateReq_Settings$json
  ],
  '4': const [UpdateReq_ConsumerStrategy$json],
};

@$core.Deprecated('Use updateReqDescriptor instead')
const UpdateReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {
      '1': 'stream',
      '3': 4,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.UpdateReq.StreamOptions',
      '9': 0,
      '10': 'stream'
    },
    const {
      '1': 'all',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.UpdateReq.AllOptions',
      '9': 0,
      '10': 'all'
    },
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '8': const {'3': true},
      '10': 'streamIdentifier',
    },
    const {'1': 'group_name', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
    const {
      '1': 'settings',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.UpdateReq.Settings',
      '10': 'settings'
    },
  ],
  '8': const [
    const {'1': 'stream_option'},
  ],
};

@$core.Deprecated('Use updateReqDescriptor instead')
const UpdateReq_StreamOptions$json = const {
  '1': 'StreamOptions',
  '2': const [
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '10': 'streamIdentifier'
    },
    const {'1': 'revision', '3': 2, '4': 1, '5': 4, '9': 0, '10': 'revision'},
    const {
      '1': 'start',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'start'
    },
    const {
      '1': 'end',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'end'
    },
  ],
  '8': const [
    const {'1': 'revision_option'},
  ],
};

@$core.Deprecated('Use updateReqDescriptor instead')
const UpdateReq_AllOptions$json = const {
  '1': 'AllOptions',
  '2': const [
    const {
      '1': 'position',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.UpdateReq.Position',
      '9': 0,
      '10': 'position'
    },
    const {
      '1': 'start',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'start'
    },
    const {
      '1': 'end',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'end'
    },
  ],
  '8': const [
    const {'1': 'all_option'},
  ],
};

@$core.Deprecated('Use updateReqDescriptor instead')
const UpdateReq_Position$json = const {
  '1': 'Position',
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

@$core.Deprecated('Use updateReqDescriptor instead')
const UpdateReq_Settings$json = const {
  '1': 'Settings',
  '2': const [
    const {'1': 'resolve_links', '3': 1, '4': 1, '5': 8, '10': 'resolveLinks'},
    const {
      '1': 'revision',
      '3': 2,
      '4': 1,
      '5': 4,
      '8': const {'3': true},
      '10': 'revision',
    },
    const {
      '1': 'extra_statistics',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'extraStatistics'
    },
    const {
      '1': 'max_retry_count',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'maxRetryCount'
    },
    const {
      '1': 'min_checkpoint_count',
      '3': 7,
      '4': 1,
      '5': 5,
      '10': 'minCheckpointCount'
    },
    const {
      '1': 'max_checkpoint_count',
      '3': 8,
      '4': 1,
      '5': 5,
      '10': 'maxCheckpointCount'
    },
    const {
      '1': 'max_subscriber_count',
      '3': 9,
      '4': 1,
      '5': 5,
      '10': 'maxSubscriberCount'
    },
    const {
      '1': 'live_buffer_size',
      '3': 10,
      '4': 1,
      '5': 5,
      '10': 'liveBufferSize'
    },
    const {
      '1': 'read_batch_size',
      '3': 11,
      '4': 1,
      '5': 5,
      '10': 'readBatchSize'
    },
    const {
      '1': 'history_buffer_size',
      '3': 12,
      '4': 1,
      '5': 5,
      '10': 'historyBufferSize'
    },
    const {
      '1': 'named_consumer_strategy',
      '3': 13,
      '4': 1,
      '5': 14,
      '6':
          '.event_store.client.persistent_subscriptions.UpdateReq.ConsumerStrategy',
      '10': 'namedConsumerStrategy'
    },
    const {
      '1': 'message_timeout_ticks',
      '3': 4,
      '4': 1,
      '5': 3,
      '9': 0,
      '10': 'messageTimeoutTicks'
    },
    const {
      '1': 'message_timeout_ms',
      '3': 14,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'messageTimeoutMs'
    },
    const {
      '1': 'checkpoint_after_ticks',
      '3': 6,
      '4': 1,
      '5': 3,
      '9': 1,
      '10': 'checkpointAfterTicks'
    },
    const {
      '1': 'checkpoint_after_ms',
      '3': 15,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'checkpointAfterMs'
    },
  ],
  '8': const [
    const {'1': 'message_timeout'},
    const {'1': 'checkpoint_after'},
  ],
};

@$core.Deprecated('Use updateReqDescriptor instead')
const UpdateReq_ConsumerStrategy$json = const {
  '1': 'ConsumerStrategy',
  '2': const [
    const {'1': 'DispatchToSingle', '2': 0},
    const {'1': 'RoundRobin', '2': 1},
    const {'1': 'Pinned', '2': 2},
  ],
};

/// Descriptor for `UpdateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateReqDescriptor = $convert.base64Decode(
    'CglVcGRhdGVSZXESWAoHb3B0aW9ucxgBIAEoCzI+LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuVXBkYXRlUmVxLk9wdGlvbnNSB29wdGlvbnMapAMKB09wdGlvbnMSXgoGc3RyZWFtGAQgASgLMkQuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5VcGRhdGVSZXEuU3RyZWFtT3B0aW9uc0gAUgZzdHJlYW0SVQoDYWxsGAUgASgLMkEuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5VcGRhdGVSZXEuQWxsT3B0aW9uc0gAUgNhbGwSVQoRc3RyZWFtX2lkZW50aWZpZXIYASABKAsyJC5ldmVudF9zdG9yZS5jbGllbnQuU3RyZWFtSWRlbnRpZmllckICGAFSEHN0cmVhbUlkZW50aWZpZXISHQoKZ3JvdXBfbmFtZRgCIAEoCVIJZ3JvdXBOYW1lElsKCHNldHRpbmdzGAMgASgLMj8uZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5VcGRhdGVSZXEuU2V0dGluZ3NSCHNldHRpbmdzQg8KDXN0cmVhbV9vcHRpb24a9QEKDVN0cmVhbU9wdGlvbnMSUQoRc3RyZWFtX2lkZW50aWZpZXIYASABKAsyJC5ldmVudF9zdG9yZS5jbGllbnQuU3RyZWFtSWRlbnRpZmllclIQc3RyZWFtSWRlbnRpZmllchIcCghyZXZpc2lvbhgCIAEoBEgAUghyZXZpc2lvbhIxCgVzdGFydBgDIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgVzdGFydBItCgNlbmQYBCABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIDZW5kQhEKD3JldmlzaW9uX29wdGlvbhrbAQoKQWxsT3B0aW9ucxJdCghwb3NpdGlvbhgBIAEoCzI/LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuVXBkYXRlUmVxLlBvc2l0aW9uSABSCHBvc2l0aW9uEjEKBXN0YXJ0GAIgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSBXN0YXJ0Ei0KA2VuZBgDIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgNlbmRCDAoKYWxsX29wdGlvbhpeCghQb3NpdGlvbhInCg9jb21taXRfcG9zaXRpb24YASABKARSDmNvbW1pdFBvc2l0aW9uEikKEHByZXBhcmVfcG9zaXRpb24YAiABKARSD3ByZXBhcmVQb3NpdGlvbhqyBgoIU2V0dGluZ3MSIwoNcmVzb2x2ZV9saW5rcxgBIAEoCFIMcmVzb2x2ZUxpbmtzEh4KCHJldmlzaW9uGAIgASgEQgIYAVIIcmV2aXNpb24SKQoQZXh0cmFfc3RhdGlzdGljcxgDIAEoCFIPZXh0cmFTdGF0aXN0aWNzEiYKD21heF9yZXRyeV9jb3VudBgFIAEoBVINbWF4UmV0cnlDb3VudBIwChRtaW5fY2hlY2twb2ludF9jb3VudBgHIAEoBVISbWluQ2hlY2twb2ludENvdW50EjAKFG1heF9jaGVja3BvaW50X2NvdW50GAggASgFUhJtYXhDaGVja3BvaW50Q291bnQSMAoUbWF4X3N1YnNjcmliZXJfY291bnQYCSABKAVSEm1heFN1YnNjcmliZXJDb3VudBIoChBsaXZlX2J1ZmZlcl9zaXplGAogASgFUg5saXZlQnVmZmVyU2l6ZRImCg9yZWFkX2JhdGNoX3NpemUYCyABKAVSDXJlYWRCYXRjaFNpemUSLgoTaGlzdG9yeV9idWZmZXJfc2l6ZRgMIAEoBVIRaGlzdG9yeUJ1ZmZlclNpemUSfwoXbmFtZWRfY29uc3VtZXJfc3RyYXRlZ3kYDSABKA4yRy5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlVwZGF0ZVJlcS5Db25zdW1lclN0cmF0ZWd5UhVuYW1lZENvbnN1bWVyU3RyYXRlZ3kSNAoVbWVzc2FnZV90aW1lb3V0X3RpY2tzGAQgASgDSABSE21lc3NhZ2VUaW1lb3V0VGlja3MSLgoSbWVzc2FnZV90aW1lb3V0X21zGA4gASgFSABSEG1lc3NhZ2VUaW1lb3V0TXMSNgoWY2hlY2twb2ludF9hZnRlcl90aWNrcxgGIAEoA0gBUhRjaGVja3BvaW50QWZ0ZXJUaWNrcxIwChNjaGVja3BvaW50X2FmdGVyX21zGA8gASgFSAFSEWNoZWNrcG9pbnRBZnRlck1zQhEKD21lc3NhZ2VfdGltZW91dEISChBjaGVja3BvaW50X2FmdGVyIkQKEENvbnN1bWVyU3RyYXRlZ3kSFAoQRGlzcGF0Y2hUb1NpbmdsZRAAEg4KClJvdW5kUm9iaW4QARIKCgZQaW5uZWQQAg==');
@$core.Deprecated('Use updateRespDescriptor instead')
const UpdateResp$json = const {
  '1': 'UpdateResp',
};

/// Descriptor for `UpdateResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRespDescriptor =
    $convert.base64Decode('CgpVcGRhdGVSZXNw');
@$core.Deprecated('Use deleteReqDescriptor instead')
const DeleteReq$json = const {
  '1': 'DeleteReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.DeleteReq.Options',
      '10': 'options'
    },
  ],
  '3': const [DeleteReq_Options$json],
};

@$core.Deprecated('Use deleteReqDescriptor instead')
const DeleteReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '9': 0,
      '10': 'streamIdentifier'
    },
    const {
      '1': 'all',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'all'
    },
    const {'1': 'group_name', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
  ],
  '8': const [
    const {'1': 'stream_option'},
  ],
};

/// Descriptor for `DeleteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteReqDescriptor = $convert.base64Decode(
    'CglEZWxldGVSZXESWAoHb3B0aW9ucxgBIAEoCzI+LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuRGVsZXRlUmVxLk9wdGlvbnNSB29wdGlvbnMavQEKB09wdGlvbnMSUwoRc3RyZWFtX2lkZW50aWZpZXIYASABKAsyJC5ldmVudF9zdG9yZS5jbGllbnQuU3RyZWFtSWRlbnRpZmllckgAUhBzdHJlYW1JZGVudGlmaWVyEi0KA2FsbBgDIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgNhbGwSHQoKZ3JvdXBfbmFtZRgCIAEoCVIJZ3JvdXBOYW1lQg8KDXN0cmVhbV9vcHRpb24=');
@$core.Deprecated('Use deleteRespDescriptor instead')
const DeleteResp$json = const {
  '1': 'DeleteResp',
};

/// Descriptor for `DeleteResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRespDescriptor =
    $convert.base64Decode('CgpEZWxldGVSZXNw');
@$core.Deprecated('Use getInfoReqDescriptor instead')
const GetInfoReq$json = const {
  '1': 'GetInfoReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.GetInfoReq.Options',
      '10': 'options'
    },
  ],
  '3': const [GetInfoReq_Options$json],
};

@$core.Deprecated('Use getInfoReqDescriptor instead')
const GetInfoReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '9': 0,
      '10': 'streamIdentifier'
    },
    const {
      '1': 'all',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'all'
    },
    const {'1': 'group_name', '3': 3, '4': 1, '5': 9, '10': 'groupName'},
  ],
  '8': const [
    const {'1': 'stream_option'},
  ],
};

/// Descriptor for `GetInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInfoReqDescriptor = $convert.base64Decode(
    'CgpHZXRJbmZvUmVxElkKB29wdGlvbnMYASABKAsyPy5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLkdldEluZm9SZXEuT3B0aW9uc1IHb3B0aW9ucxq9AQoHT3B0aW9ucxJTChFzdHJlYW1faWRlbnRpZmllchgBIAEoCzIkLmV2ZW50X3N0b3JlLmNsaWVudC5TdHJlYW1JZGVudGlmaWVySABSEHN0cmVhbUlkZW50aWZpZXISLQoDYWxsGAIgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSA2FsbBIdCgpncm91cF9uYW1lGAMgASgJUglncm91cE5hbWVCDwoNc3RyZWFtX29wdGlvbg==');
@$core.Deprecated('Use getInfoRespDescriptor instead')
const GetInfoResp$json = const {
  '1': 'GetInfoResp',
  '2': const [
    const {
      '1': 'subscription_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.SubscriptionInfo',
      '10': 'subscriptionInfo'
    },
  ],
};

/// Descriptor for `GetInfoResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInfoRespDescriptor = $convert.base64Decode(
    'CgtHZXRJbmZvUmVzcBJqChFzdWJzY3JpcHRpb25faW5mbxgBIAEoCzI9LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuU3Vic2NyaXB0aW9uSW5mb1IQc3Vic2NyaXB0aW9uSW5mbw==');
@$core.Deprecated('Use subscriptionInfoDescriptor instead')
const SubscriptionInfo$json = const {
  '1': 'SubscriptionInfo',
  '2': const [
    const {'1': 'event_source', '3': 1, '4': 1, '5': 9, '10': 'eventSource'},
    const {'1': 'group_name', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
    const {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
    const {
      '1': 'connections',
      '3': 4,
      '4': 3,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.SubscriptionInfo.ConnectionInfo',
      '10': 'connections'
    },
    const {
      '1': 'average_per_second',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'averagePerSecond'
    },
    const {'1': 'total_items', '3': 6, '4': 1, '5': 3, '10': 'totalItems'},
    const {
      '1': 'count_since_last_measurement',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'countSinceLastMeasurement'
    },
    const {
      '1': 'last_checkpointed_event_position',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'lastCheckpointedEventPosition'
    },
    const {
      '1': 'last_known_event_position',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'lastKnownEventPosition'
    },
    const {
      '1': 'resolve_link_tos',
      '3': 10,
      '4': 1,
      '5': 8,
      '10': 'resolveLinkTos'
    },
    const {'1': 'start_from', '3': 11, '4': 1, '5': 9, '10': 'startFrom'},
    const {
      '1': 'message_timeout_milliseconds',
      '3': 12,
      '4': 1,
      '5': 5,
      '10': 'messageTimeoutMilliseconds'
    },
    const {
      '1': 'extra_statistics',
      '3': 13,
      '4': 1,
      '5': 8,
      '10': 'extraStatistics'
    },
    const {
      '1': 'max_retry_count',
      '3': 14,
      '4': 1,
      '5': 5,
      '10': 'maxRetryCount'
    },
    const {
      '1': 'live_buffer_size',
      '3': 15,
      '4': 1,
      '5': 5,
      '10': 'liveBufferSize'
    },
    const {'1': 'buffer_size', '3': 16, '4': 1, '5': 5, '10': 'bufferSize'},
    const {
      '1': 'read_batch_size',
      '3': 17,
      '4': 1,
      '5': 5,
      '10': 'readBatchSize'
    },
    const {
      '1': 'check_point_after_milliseconds',
      '3': 18,
      '4': 1,
      '5': 5,
      '10': 'checkPointAfterMilliseconds'
    },
    const {
      '1': 'min_check_point_count',
      '3': 19,
      '4': 1,
      '5': 5,
      '10': 'minCheckPointCount'
    },
    const {
      '1': 'max_check_point_count',
      '3': 20,
      '4': 1,
      '5': 5,
      '10': 'maxCheckPointCount'
    },
    const {
      '1': 'read_buffer_count',
      '3': 21,
      '4': 1,
      '5': 5,
      '10': 'readBufferCount'
    },
    const {
      '1': 'live_buffer_count',
      '3': 22,
      '4': 1,
      '5': 3,
      '10': 'liveBufferCount'
    },
    const {
      '1': 'retry_buffer_count',
      '3': 23,
      '4': 1,
      '5': 5,
      '10': 'retryBufferCount'
    },
    const {
      '1': 'total_in_flight_messages',
      '3': 24,
      '4': 1,
      '5': 5,
      '10': 'totalInFlightMessages'
    },
    const {
      '1': 'outstanding_messages_count',
      '3': 25,
      '4': 1,
      '5': 5,
      '10': 'outstandingMessagesCount'
    },
    const {
      '1': 'named_consumer_strategy',
      '3': 26,
      '4': 1,
      '5': 9,
      '10': 'namedConsumerStrategy'
    },
    const {
      '1': 'max_subscriber_count',
      '3': 27,
      '4': 1,
      '5': 5,
      '10': 'maxSubscriberCount'
    },
    const {
      '1': 'parked_message_count',
      '3': 28,
      '4': 1,
      '5': 3,
      '10': 'parkedMessageCount'
    },
  ],
  '3': const [
    SubscriptionInfo_ConnectionInfo$json,
    SubscriptionInfo_Measurement$json
  ],
};

@$core.Deprecated('Use subscriptionInfoDescriptor instead')
const SubscriptionInfo_ConnectionInfo$json = const {
  '1': 'ConnectionInfo',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {
      '1': 'average_items_per_second',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'averageItemsPerSecond'
    },
    const {'1': 'total_items', '3': 4, '4': 1, '5': 3, '10': 'totalItems'},
    const {
      '1': 'count_since_last_measurement',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'countSinceLastMeasurement'
    },
    const {
      '1': 'observed_measurements',
      '3': 6,
      '4': 3,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.SubscriptionInfo.Measurement',
      '10': 'observedMeasurements'
    },
    const {
      '1': 'available_slots',
      '3': 7,
      '4': 1,
      '5': 5,
      '10': 'availableSlots'
    },
    const {
      '1': 'in_flight_messages',
      '3': 8,
      '4': 1,
      '5': 5,
      '10': 'inFlightMessages'
    },
    const {
      '1': 'connection_name',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'connectionName'
    },
  ],
};

@$core.Deprecated('Use subscriptionInfoDescriptor instead')
const SubscriptionInfo_Measurement$json = const {
  '1': 'Measurement',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
};

/// Descriptor for `SubscriptionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionInfoDescriptor = $convert.base64Decode(
    'ChBTdWJzY3JpcHRpb25JbmZvEiEKDGV2ZW50X3NvdXJjZRgBIAEoCVILZXZlbnRTb3VyY2USHQoKZ3JvdXBfbmFtZRgCIAEoCVIJZ3JvdXBOYW1lEhYKBnN0YXR1cxgDIAEoCVIGc3RhdHVzEm4KC2Nvbm5lY3Rpb25zGAQgAygLMkwuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5TdWJzY3JpcHRpb25JbmZvLkNvbm5lY3Rpb25JbmZvUgtjb25uZWN0aW9ucxIsChJhdmVyYWdlX3Blcl9zZWNvbmQYBSABKAVSEGF2ZXJhZ2VQZXJTZWNvbmQSHwoLdG90YWxfaXRlbXMYBiABKANSCnRvdGFsSXRlbXMSPwocY291bnRfc2luY2VfbGFzdF9tZWFzdXJlbWVudBgHIAEoA1IZY291bnRTaW5jZUxhc3RNZWFzdXJlbWVudBJHCiBsYXN0X2NoZWNrcG9pbnRlZF9ldmVudF9wb3NpdGlvbhgIIAEoCVIdbGFzdENoZWNrcG9pbnRlZEV2ZW50UG9zaXRpb24SOQoZbGFzdF9rbm93bl9ldmVudF9wb3NpdGlvbhgJIAEoCVIWbGFzdEtub3duRXZlbnRQb3NpdGlvbhIoChByZXNvbHZlX2xpbmtfdG9zGAogASgIUg5yZXNvbHZlTGlua1RvcxIdCgpzdGFydF9mcm9tGAsgASgJUglzdGFydEZyb20SQAocbWVzc2FnZV90aW1lb3V0X21pbGxpc2Vjb25kcxgMIAEoBVIabWVzc2FnZVRpbWVvdXRNaWxsaXNlY29uZHMSKQoQZXh0cmFfc3RhdGlzdGljcxgNIAEoCFIPZXh0cmFTdGF0aXN0aWNzEiYKD21heF9yZXRyeV9jb3VudBgOIAEoBVINbWF4UmV0cnlDb3VudBIoChBsaXZlX2J1ZmZlcl9zaXplGA8gASgFUg5saXZlQnVmZmVyU2l6ZRIfCgtidWZmZXJfc2l6ZRgQIAEoBVIKYnVmZmVyU2l6ZRImCg9yZWFkX2JhdGNoX3NpemUYESABKAVSDXJlYWRCYXRjaFNpemUSQwoeY2hlY2tfcG9pbnRfYWZ0ZXJfbWlsbGlzZWNvbmRzGBIgASgFUhtjaGVja1BvaW50QWZ0ZXJNaWxsaXNlY29uZHMSMQoVbWluX2NoZWNrX3BvaW50X2NvdW50GBMgASgFUhJtaW5DaGVja1BvaW50Q291bnQSMQoVbWF4X2NoZWNrX3BvaW50X2NvdW50GBQgASgFUhJtYXhDaGVja1BvaW50Q291bnQSKgoRcmVhZF9idWZmZXJfY291bnQYFSABKAVSD3JlYWRCdWZmZXJDb3VudBIqChFsaXZlX2J1ZmZlcl9jb3VudBgWIAEoA1IPbGl2ZUJ1ZmZlckNvdW50EiwKEnJldHJ5X2J1ZmZlcl9jb3VudBgXIAEoBVIQcmV0cnlCdWZmZXJDb3VudBI3Chh0b3RhbF9pbl9mbGlnaHRfbWVzc2FnZXMYGCABKAVSFXRvdGFsSW5GbGlnaHRNZXNzYWdlcxI8ChpvdXRzdGFuZGluZ19tZXNzYWdlc19jb3VudBgZIAEoBVIYb3V0c3RhbmRpbmdNZXNzYWdlc0NvdW50EjYKF25hbWVkX2NvbnN1bWVyX3N0cmF0ZWd5GBogASgJUhVuYW1lZENvbnN1bWVyU3RyYXRlZ3kSMAoUbWF4X3N1YnNjcmliZXJfY291bnQYGyABKAVSEm1heFN1YnNjcmliZXJDb3VudBIwChRwYXJrZWRfbWVzc2FnZV9jb3VudBgcIAEoA1IScGFya2VkTWVzc2FnZUNvdW50GtsDCg5Db25uZWN0aW9uSW5mbxISCgRmcm9tGAEgASgJUgRmcm9tEhoKCHVzZXJuYW1lGAIgASgJUgh1c2VybmFtZRI3ChhhdmVyYWdlX2l0ZW1zX3Blcl9zZWNvbmQYAyABKAVSFWF2ZXJhZ2VJdGVtc1BlclNlY29uZBIfCgt0b3RhbF9pdGVtcxgEIAEoA1IKdG90YWxJdGVtcxI/Chxjb3VudF9zaW5jZV9sYXN0X21lYXN1cmVtZW50GAUgASgDUhljb3VudFNpbmNlTGFzdE1lYXN1cmVtZW50En4KFW9ic2VydmVkX21lYXN1cmVtZW50cxgGIAMoCzJJLmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuU3Vic2NyaXB0aW9uSW5mby5NZWFzdXJlbWVudFIUb2JzZXJ2ZWRNZWFzdXJlbWVudHMSJwoPYXZhaWxhYmxlX3Nsb3RzGAcgASgFUg5hdmFpbGFibGVTbG90cxIsChJpbl9mbGlnaHRfbWVzc2FnZXMYCCABKAVSEGluRmxpZ2h0TWVzc2FnZXMSJwoPY29ubmVjdGlvbl9uYW1lGAkgASgJUg5jb25uZWN0aW9uTmFtZRo1CgtNZWFzdXJlbWVudBIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWU=');
@$core.Deprecated('Use replayParkedReqDescriptor instead')
const ReplayParkedReq$json = const {
  '1': 'ReplayParkedReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.persistent_subscriptions.ReplayParkedReq.Options',
      '10': 'options'
    },
  ],
  '3': const [ReplayParkedReq_Options$json],
};

@$core.Deprecated('Use replayParkedReqDescriptor instead')
const ReplayParkedReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'group_name', '3': 1, '4': 1, '5': 9, '10': 'groupName'},
    const {
      '1': 'stream_identifier',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '9': 0,
      '10': 'streamIdentifier'
    },
    const {
      '1': 'all',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'all'
    },
    const {'1': 'stop_at', '3': 4, '4': 1, '5': 3, '9': 1, '10': 'stopAt'},
    const {
      '1': 'no_limit',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 1,
      '10': 'noLimit'
    },
  ],
  '8': const [
    const {'1': 'stream_option'},
    const {'1': 'stop_at_option'},
  ],
};

/// Descriptor for `ReplayParkedReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replayParkedReqDescriptor = $convert.base64Decode(
    'Cg9SZXBsYXlQYXJrZWRSZXESXgoHb3B0aW9ucxgBIAEoCzJELmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuUmVwbGF5UGFya2VkUmVxLk9wdGlvbnNSB29wdGlvbnMaogIKB09wdGlvbnMSHQoKZ3JvdXBfbmFtZRgBIAEoCVIJZ3JvdXBOYW1lElMKEXN0cmVhbV9pZGVudGlmaWVyGAIgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJIAFIQc3RyZWFtSWRlbnRpZmllchItCgNhbGwYAyABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIDYWxsEhkKB3N0b3BfYXQYBCABKANIAVIGc3RvcEF0EjYKCG5vX2xpbWl0GAUgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SAFSB25vTGltaXRCDwoNc3RyZWFtX29wdGlvbkIQCg5zdG9wX2F0X29wdGlvbg==');
@$core.Deprecated('Use replayParkedRespDescriptor instead')
const ReplayParkedResp$json = const {
  '1': 'ReplayParkedResp',
};

/// Descriptor for `ReplayParkedResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replayParkedRespDescriptor =
    $convert.base64Decode('ChBSZXBsYXlQYXJrZWRSZXNw');
@$core.Deprecated('Use listReqDescriptor instead')
const ListReq$json = const {
  '1': 'ListReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.ListReq.Options',
      '10': 'options'
    },
  ],
  '3': const [ListReq_Options$json, ListReq_StreamOption$json],
};

@$core.Deprecated('Use listReqDescriptor instead')
const ListReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {
      '1': 'list_all_subscriptions',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'listAllSubscriptions'
    },
    const {
      '1': 'list_for_stream',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.ListReq.StreamOption',
      '9': 0,
      '10': 'listForStream'
    },
  ],
  '8': const [
    const {'1': 'list_option'},
  ],
};

@$core.Deprecated('Use listReqDescriptor instead')
const ListReq_StreamOption$json = const {
  '1': 'StreamOption',
  '2': const [
    const {
      '1': 'stream',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '9': 0,
      '10': 'stream'
    },
    const {
      '1': 'all',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'all'
    },
  ],
  '8': const [
    const {'1': 'stream_option'},
  ],
};

/// Descriptor for `ListReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReqDescriptor = $convert.base64Decode(
    'CgdMaXN0UmVxElYKB29wdGlvbnMYASABKAsyPC5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLkxpc3RSZXEuT3B0aW9uc1IHb3B0aW9ucxrYAQoHT3B0aW9ucxJRChZsaXN0X2FsbF9zdWJzY3JpcHRpb25zGAEgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSFGxpc3RBbGxTdWJzY3JpcHRpb25zEmsKD2xpc3RfZm9yX3N0cmVhbRgCIAEoCzJBLmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuTGlzdFJlcS5TdHJlYW1PcHRpb25IAFINbGlzdEZvclN0cmVhbUINCgtsaXN0X29wdGlvbhqOAQoMU3RyZWFtT3B0aW9uEj4KBnN0cmVhbRgBIAEoCzIkLmV2ZW50X3N0b3JlLmNsaWVudC5TdHJlYW1JZGVudGlmaWVySABSBnN0cmVhbRItCgNhbGwYAiABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIDYWxsQg8KDXN0cmVhbV9vcHRpb24=');
@$core.Deprecated('Use listRespDescriptor instead')
const ListResp$json = const {
  '1': 'ListResp',
  '2': const [
    const {
      '1': 'subscriptions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.event_store.client.persistent_subscriptions.SubscriptionInfo',
      '10': 'subscriptions'
    },
  ],
};

/// Descriptor for `ListResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRespDescriptor = $convert.base64Decode(
    'CghMaXN0UmVzcBJjCg1zdWJzY3JpcHRpb25zGAEgAygLMj0uZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5TdWJzY3JpcHRpb25JbmZvUg1zdWJzY3JpcHRpb25z');
