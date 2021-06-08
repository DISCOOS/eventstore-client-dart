///
//  Generated code. Do not modify.
//  source: persistent.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

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
      '6': '.event_store.client.shared.StreamIdentifier',
      '9': 0,
      '10': 'streamIdentifier'
    },
    const {
      '1': 'all',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.Empty',
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
      '6': '.event_store.client.shared.Empty',
      '9': 0,
      '10': 'structured'
    },
    const {
      '1': 'string',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.Empty',
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
      '6': '.event_store.client.shared.UUID',
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
      '6': '.event_store.client.shared.UUID',
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
    'CgdSZWFkUmVxElgKB29wdGlvbnMYASABKAsyPC5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlJlYWRSZXEuT3B0aW9uc0gAUgdvcHRpb25zEkwKA2FjaxgCIAEoCzI4LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuUmVhZFJlcS5BY2tIAFIDYWNrEk8KBG5hY2sYAyABKAsyOS5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlJlYWRSZXEuTmFja0gAUgRuYWNrGvADCgdPcHRpb25zEloKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMisuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5TdHJlYW1JZGVudGlmaWVySABSEHN0cmVhbUlkZW50aWZpZXISNAoDYWxsGAUgASgLMiAuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5FbXB0eUgAUgNhbGwSHQoKZ3JvdXBfbmFtZRgCIAEoCVIJZ3JvdXBOYW1lEh8KC2J1ZmZlcl9zaXplGAMgASgFUgpidWZmZXJTaXplEmgKC3V1aWRfb3B0aW9uGAQgASgLMkcuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5SZWFkUmVxLk9wdGlvbnMuVVVJRE9wdGlvblIKdXVpZE9wdGlvbhqXAQoKVVVJRE9wdGlvbhJCCgpzdHJ1Y3R1cmVkGAEgASgLMiAuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5FbXB0eUgAUgpzdHJ1Y3R1cmVkEjoKBnN0cmluZxgCIAEoCzIgLmV2ZW50X3N0b3JlLmNsaWVudC5zaGFyZWQuRW1wdHlIAFIGc3RyaW5nQgkKB2NvbnRlbnRCDwoNc3RyZWFtX29wdGlvbhpICgNBY2sSDgoCaWQYASABKAxSAmlkEjEKA2lkcxgCIAMoCzIfLmV2ZW50X3N0b3JlLmNsaWVudC5zaGFyZWQuVVVJRFIDaWRzGvsBCgROYWNrEg4KAmlkGAEgASgMUgJpZBIxCgNpZHMYAiADKAsyHy5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLlVVSURSA2lkcxJYCgZhY3Rpb24YAyABKA4yQC5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlJlYWRSZXEuTmFjay5BY3Rpb25SBmFjdGlvbhIWCgZyZWFzb24YBCABKAlSBnJlYXNvbiI+CgZBY3Rpb24SCwoHVW5rbm93bhAAEggKBFBhcmsQARIJCgVSZXRyeRACEggKBFNraXAQAxIICgRTdG9wEARCCQoHY29udGVudA==');
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
      '6': '.event_store.client.shared.Empty',
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
      '6': '.event_store.client.shared.Empty',
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
      '6': '.event_store.client.shared.UUID',
      '10': 'id'
    },
    const {
      '1': 'stream_identifier',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.StreamIdentifier',
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
    'CghSZWFkUmVzcBJXCgVldmVudBgBIAEoCzI/LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuUmVhZFJlc3AuUmVhZEV2ZW50SABSBWV2ZW50Eo0BChlzdWJzY3JpcHRpb25fY29uZmlybWF0aW9uGAIgASgLMk4uZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5SZWFkUmVzcC5TdWJzY3JpcHRpb25Db25maXJtYXRpb25IAFIYc3Vic2NyaXB0aW9uQ29uZmlybWF0aW9uGtIHCglSZWFkRXZlbnQSYwoFZXZlbnQYASABKAsyTS5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlJlYWRSZXNwLlJlYWRFdmVudC5SZWNvcmRlZEV2ZW50UgVldmVudBJhCgRsaW5rGAIgASgLMk0uZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5SZWFkUmVzcC5SZWFkRXZlbnQuUmVjb3JkZWRFdmVudFIEbGluaxIpCg9jb21taXRfcG9zaXRpb24YAyABKARIAFIOY29tbWl0UG9zaXRpb24SQwoLbm9fcG9zaXRpb24YBCABKAsyIC5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLkVtcHR5SABSCm5vUG9zaXRpb24SIQoLcmV0cnlfY291bnQYBSABKAVIAVIKcmV0cnlDb3VudBJICg5ub19yZXRyeV9jb3VudBgGIAEoCzIgLmV2ZW50X3N0b3JlLmNsaWVudC5zaGFyZWQuRW1wdHlIAVIMbm9SZXRyeUNvdW50GooECg1SZWNvcmRlZEV2ZW50Ei8KAmlkGAEgASgLMh8uZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5VVUlEUgJpZBJYChFzdHJlYW1faWRlbnRpZmllchgCIAEoCzIrLmV2ZW50X3N0b3JlLmNsaWVudC5zaGFyZWQuU3RyZWFtSWRlbnRpZmllclIQc3RyZWFtSWRlbnRpZmllchInCg9zdHJlYW1fcmV2aXNpb24YAyABKARSDnN0cmVhbVJldmlzaW9uEikKEHByZXBhcmVfcG9zaXRpb24YBCABKARSD3ByZXBhcmVQb3NpdGlvbhInCg9jb21taXRfcG9zaXRpb24YBSABKARSDmNvbW1pdFBvc2l0aW9uEncKCG1ldGFkYXRhGAYgAygLMlsuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5SZWFkUmVzcC5SZWFkRXZlbnQuUmVjb3JkZWRFdmVudC5NZXRhZGF0YUVudHJ5UghtZXRhZGF0YRInCg9jdXN0b21fbWV0YWRhdGEYByABKAxSDmN1c3RvbU1ldGFkYXRhEhIKBGRhdGEYCCABKAxSBGRhdGEaOwoNTWV0YWRhdGFFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBQgoKCHBvc2l0aW9uQgcKBWNvdW50GkMKGFN1YnNjcmlwdGlvbkNvbmZpcm1hdGlvbhInCg9zdWJzY3JpcHRpb25faWQYASABKAlSDnN1YnNjcmlwdGlvbklkQgkKB2NvbnRlbnQ=');
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
      '6': '.event_store.client.shared.StreamIdentifier',
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
      '6': '.event_store.client.shared.StreamIdentifier',
      '10': 'streamIdentifier'
    },
    const {'1': 'revision', '3': 2, '4': 1, '5': 4, '9': 0, '10': 'revision'},
    const {
      '1': 'start',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.Empty',
      '9': 0,
      '10': 'start'
    },
    const {
      '1': 'end',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.Empty',
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
      '6': '.event_store.client.shared.Empty',
      '9': 0,
      '10': 'start'
    },
    const {
      '1': 'end',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.Empty',
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
      '6': '.event_store.client.shared.Empty',
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
      '6': '.event_store.client.shared.Empty',
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
    'CglDcmVhdGVSZXESWAoHb3B0aW9ucxgBIAEoCzI+LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuQ3JlYXRlUmVxLk9wdGlvbnNSB29wdGlvbnMaqwMKB09wdGlvbnMSXgoGc3RyZWFtGAQgASgLMkQuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuU3RyZWFtT3B0aW9uc0gAUgZzdHJlYW0SVQoDYWxsGAUgASgLMkEuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuQWxsT3B0aW9uc0gAUgNhbGwSXAoRc3RyZWFtX2lkZW50aWZpZXIYASABKAsyKy5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLlN0cmVhbUlkZW50aWZpZXJCAhgBUhBzdHJlYW1JZGVudGlmaWVyEh0KCmdyb3VwX25hbWUYAiABKAlSCWdyb3VwTmFtZRJbCghzZXR0aW5ncxgDIAEoCzI/LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuQ3JlYXRlUmVxLlNldHRpbmdzUghzZXR0aW5nc0IPCg1zdHJlYW1fb3B0aW9uGooCCg1TdHJlYW1PcHRpb25zElgKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMisuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5TdHJlYW1JZGVudGlmaWVyUhBzdHJlYW1JZGVudGlmaWVyEhwKCHJldmlzaW9uGAIgASgESABSCHJldmlzaW9uEjgKBXN0YXJ0GAMgASgLMiAuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5FbXB0eUgAUgVzdGFydBI0CgNlbmQYBCABKAsyIC5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLkVtcHR5SABSA2VuZEIRCg9yZXZpc2lvbl9vcHRpb24aowcKCkFsbE9wdGlvbnMSXQoIcG9zaXRpb24YASABKAsyPy5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLkNyZWF0ZVJlcS5Qb3NpdGlvbkgAUghwb3NpdGlvbhI4CgVzdGFydBgCIAEoCzIgLmV2ZW50X3N0b3JlLmNsaWVudC5zaGFyZWQuRW1wdHlIAFIFc3RhcnQSNAoDZW5kGAMgASgLMiAuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5FbXB0eUgAUgNlbmQSaQoGZmlsdGVyGAQgASgLMk8uZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5DcmVhdGVSZXEuQWxsT3B0aW9ucy5GaWx0ZXJPcHRpb25zSAFSBmZpbHRlchI/Cglub19maWx0ZXIYBSABKAsyIC5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLkVtcHR5SAFSCG5vRmlsdGVyGvoDCg1GaWx0ZXJPcHRpb25zEokBChFzdHJlYW1faWRlbnRpZmllchgBIAEoCzJaLmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuQ3JlYXRlUmVxLkFsbE9wdGlvbnMuRmlsdGVyT3B0aW9ucy5FeHByZXNzaW9uSABSEHN0cmVhbUlkZW50aWZpZXISewoKZXZlbnRfdHlwZRgCIAEoCzJaLmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuQ3JlYXRlUmVxLkFsbE9wdGlvbnMuRmlsdGVyT3B0aW9ucy5FeHByZXNzaW9uSABSCWV2ZW50VHlwZRISCgNtYXgYAyABKA1IAVIDbWF4EjgKBWNvdW50GAQgASgLMiAuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5FbXB0eUgBUgVjb3VudBJCChxjaGVja3BvaW50SW50ZXJ2YWxNdWx0aXBsaWVyGAUgASgNUhxjaGVja3BvaW50SW50ZXJ2YWxNdWx0aXBsaWVyGjoKCkV4cHJlc3Npb24SFAoFcmVnZXgYASABKAlSBXJlZ2V4EhYKBnByZWZpeBgCIAMoCVIGcHJlZml4QggKBmZpbHRlckIICgZ3aW5kb3dCDAoKYWxsX29wdGlvbkIPCg1maWx0ZXJfb3B0aW9uGl4KCFBvc2l0aW9uEicKD2NvbW1pdF9wb3NpdGlvbhgBIAEoBFIOY29tbWl0UG9zaXRpb24SKQoQcHJlcGFyZV9wb3NpdGlvbhgCIAEoBFIPcHJlcGFyZVBvc2l0aW9uGrIGCghTZXR0aW5ncxIjCg1yZXNvbHZlX2xpbmtzGAEgASgIUgxyZXNvbHZlTGlua3MSHgoIcmV2aXNpb24YAiABKARCAhgBUghyZXZpc2lvbhIpChBleHRyYV9zdGF0aXN0aWNzGAMgASgIUg9leHRyYVN0YXRpc3RpY3MSJgoPbWF4X3JldHJ5X2NvdW50GAUgASgFUg1tYXhSZXRyeUNvdW50EjAKFG1pbl9jaGVja3BvaW50X2NvdW50GAcgASgFUhJtaW5DaGVja3BvaW50Q291bnQSMAoUbWF4X2NoZWNrcG9pbnRfY291bnQYCCABKAVSEm1heENoZWNrcG9pbnRDb3VudBIwChRtYXhfc3Vic2NyaWJlcl9jb3VudBgJIAEoBVISbWF4U3Vic2NyaWJlckNvdW50EigKEGxpdmVfYnVmZmVyX3NpemUYCiABKAVSDmxpdmVCdWZmZXJTaXplEiYKD3JlYWRfYmF0Y2hfc2l6ZRgLIAEoBVINcmVhZEJhdGNoU2l6ZRIuChNoaXN0b3J5X2J1ZmZlcl9zaXplGAwgASgFUhFoaXN0b3J5QnVmZmVyU2l6ZRJ/ChduYW1lZF9jb25zdW1lcl9zdHJhdGVneRgNIAEoDjJHLmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuQ3JlYXRlUmVxLkNvbnN1bWVyU3RyYXRlZ3lSFW5hbWVkQ29uc3VtZXJTdHJhdGVneRI0ChVtZXNzYWdlX3RpbWVvdXRfdGlja3MYBCABKANIAFITbWVzc2FnZVRpbWVvdXRUaWNrcxIuChJtZXNzYWdlX3RpbWVvdXRfbXMYDiABKAVIAFIQbWVzc2FnZVRpbWVvdXRNcxI2ChZjaGVja3BvaW50X2FmdGVyX3RpY2tzGAYgASgDSAFSFGNoZWNrcG9pbnRBZnRlclRpY2tzEjAKE2NoZWNrcG9pbnRfYWZ0ZXJfbXMYDyABKAVIAVIRY2hlY2twb2ludEFmdGVyTXNCEQoPbWVzc2FnZV90aW1lb3V0QhIKEGNoZWNrcG9pbnRfYWZ0ZXIiRAoQQ29uc3VtZXJTdHJhdGVneRIUChBEaXNwYXRjaFRvU2luZ2xlEAASDgoKUm91bmRSb2JpbhABEgoKBlBpbm5lZBAC');
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
      '6': '.event_store.client.shared.StreamIdentifier',
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
      '6': '.event_store.client.shared.StreamIdentifier',
      '10': 'streamIdentifier'
    },
    const {'1': 'revision', '3': 2, '4': 1, '5': 4, '9': 0, '10': 'revision'},
    const {
      '1': 'start',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.Empty',
      '9': 0,
      '10': 'start'
    },
    const {
      '1': 'end',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.Empty',
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
      '6': '.event_store.client.shared.Empty',
      '9': 0,
      '10': 'start'
    },
    const {
      '1': 'end',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.Empty',
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
    'CglVcGRhdGVSZXESWAoHb3B0aW9ucxgBIAEoCzI+LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuVXBkYXRlUmVxLk9wdGlvbnNSB29wdGlvbnMaqwMKB09wdGlvbnMSXgoGc3RyZWFtGAQgASgLMkQuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5VcGRhdGVSZXEuU3RyZWFtT3B0aW9uc0gAUgZzdHJlYW0SVQoDYWxsGAUgASgLMkEuZXZlbnRfc3RvcmUuY2xpZW50LnBlcnNpc3RlbnRfc3Vic2NyaXB0aW9ucy5VcGRhdGVSZXEuQWxsT3B0aW9uc0gAUgNhbGwSXAoRc3RyZWFtX2lkZW50aWZpZXIYASABKAsyKy5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLlN0cmVhbUlkZW50aWZpZXJCAhgBUhBzdHJlYW1JZGVudGlmaWVyEh0KCmdyb3VwX25hbWUYAiABKAlSCWdyb3VwTmFtZRJbCghzZXR0aW5ncxgDIAEoCzI/LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuVXBkYXRlUmVxLlNldHRpbmdzUghzZXR0aW5nc0IPCg1zdHJlYW1fb3B0aW9uGooCCg1TdHJlYW1PcHRpb25zElgKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMisuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5TdHJlYW1JZGVudGlmaWVyUhBzdHJlYW1JZGVudGlmaWVyEhwKCHJldmlzaW9uGAIgASgESABSCHJldmlzaW9uEjgKBXN0YXJ0GAMgASgLMiAuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5FbXB0eUgAUgVzdGFydBI0CgNlbmQYBCABKAsyIC5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLkVtcHR5SABSA2VuZEIRCg9yZXZpc2lvbl9vcHRpb24a6QEKCkFsbE9wdGlvbnMSXQoIcG9zaXRpb24YASABKAsyPy5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlVwZGF0ZVJlcS5Qb3NpdGlvbkgAUghwb3NpdGlvbhI4CgVzdGFydBgCIAEoCzIgLmV2ZW50X3N0b3JlLmNsaWVudC5zaGFyZWQuRW1wdHlIAFIFc3RhcnQSNAoDZW5kGAMgASgLMiAuZXZlbnRfc3RvcmUuY2xpZW50LnNoYXJlZC5FbXB0eUgAUgNlbmRCDAoKYWxsX29wdGlvbhpeCghQb3NpdGlvbhInCg9jb21taXRfcG9zaXRpb24YASABKARSDmNvbW1pdFBvc2l0aW9uEikKEHByZXBhcmVfcG9zaXRpb24YAiABKARSD3ByZXBhcmVQb3NpdGlvbhqyBgoIU2V0dGluZ3MSIwoNcmVzb2x2ZV9saW5rcxgBIAEoCFIMcmVzb2x2ZUxpbmtzEh4KCHJldmlzaW9uGAIgASgEQgIYAVIIcmV2aXNpb24SKQoQZXh0cmFfc3RhdGlzdGljcxgDIAEoCFIPZXh0cmFTdGF0aXN0aWNzEiYKD21heF9yZXRyeV9jb3VudBgFIAEoBVINbWF4UmV0cnlDb3VudBIwChRtaW5fY2hlY2twb2ludF9jb3VudBgHIAEoBVISbWluQ2hlY2twb2ludENvdW50EjAKFG1heF9jaGVja3BvaW50X2NvdW50GAggASgFUhJtYXhDaGVja3BvaW50Q291bnQSMAoUbWF4X3N1YnNjcmliZXJfY291bnQYCSABKAVSEm1heFN1YnNjcmliZXJDb3VudBIoChBsaXZlX2J1ZmZlcl9zaXplGAogASgFUg5saXZlQnVmZmVyU2l6ZRImCg9yZWFkX2JhdGNoX3NpemUYCyABKAVSDXJlYWRCYXRjaFNpemUSLgoTaGlzdG9yeV9idWZmZXJfc2l6ZRgMIAEoBVIRaGlzdG9yeUJ1ZmZlclNpemUSfwoXbmFtZWRfY29uc3VtZXJfc3RyYXRlZ3kYDSABKA4yRy5ldmVudF9zdG9yZS5jbGllbnQucGVyc2lzdGVudF9zdWJzY3JpcHRpb25zLlVwZGF0ZVJlcS5Db25zdW1lclN0cmF0ZWd5UhVuYW1lZENvbnN1bWVyU3RyYXRlZ3kSNAoVbWVzc2FnZV90aW1lb3V0X3RpY2tzGAQgASgDSABSE21lc3NhZ2VUaW1lb3V0VGlja3MSLgoSbWVzc2FnZV90aW1lb3V0X21zGA4gASgFSABSEG1lc3NhZ2VUaW1lb3V0TXMSNgoWY2hlY2twb2ludF9hZnRlcl90aWNrcxgGIAEoA0gBUhRjaGVja3BvaW50QWZ0ZXJUaWNrcxIwChNjaGVja3BvaW50X2FmdGVyX21zGA8gASgFSAFSEWNoZWNrcG9pbnRBZnRlck1zQhEKD21lc3NhZ2VfdGltZW91dEISChBjaGVja3BvaW50X2FmdGVyIkQKEENvbnN1bWVyU3RyYXRlZ3kSFAoQRGlzcGF0Y2hUb1NpbmdsZRAAEg4KClJvdW5kUm9iaW4QARIKCgZQaW5uZWQQAg==');
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
      '6': '.event_store.client.shared.StreamIdentifier',
      '9': 0,
      '10': 'streamIdentifier'
    },
    const {
      '1': 'all',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.shared.Empty',
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
    'CglEZWxldGVSZXESWAoHb3B0aW9ucxgBIAEoCzI+LmV2ZW50X3N0b3JlLmNsaWVudC5wZXJzaXN0ZW50X3N1YnNjcmlwdGlvbnMuRGVsZXRlUmVxLk9wdGlvbnNSB29wdGlvbnMaywEKB09wdGlvbnMSWgoRc3RyZWFtX2lkZW50aWZpZXIYASABKAsyKy5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLlN0cmVhbUlkZW50aWZpZXJIAFIQc3RyZWFtSWRlbnRpZmllchI0CgNhbGwYAyABKAsyIC5ldmVudF9zdG9yZS5jbGllbnQuc2hhcmVkLkVtcHR5SABSA2FsbBIdCgpncm91cF9uYW1lGAIgASgJUglncm91cE5hbWVCDwoNc3RyZWFtX29wdGlvbg==');
@$core.Deprecated('Use deleteRespDescriptor instead')
const DeleteResp$json = const {
  '1': 'DeleteResp',
};

/// Descriptor for `DeleteResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRespDescriptor =
    $convert.base64Decode('CgpEZWxldGVSZXNw');
