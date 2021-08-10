///
//  Generated code. Do not modify.
//  source: streams.proto
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
      '6': '.event_store.client.streams.ReadReq.Options',
      '10': 'options'
    },
  ],
  '3': const [ReadReq_Options$json],
};

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {
      '1': 'stream',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadReq.Options.StreamOptions',
      '9': 0,
      '10': 'stream'
    },
    const {
      '1': 'all',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadReq.Options.AllOptions',
      '9': 0,
      '10': 'all'
    },
    const {
      '1': 'read_direction',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.event_store.client.streams.ReadReq.Options.ReadDirection',
      '10': 'readDirection'
    },
    const {'1': 'resolve_links', '3': 4, '4': 1, '5': 8, '10': 'resolveLinks'},
    const {'1': 'count', '3': 5, '4': 1, '5': 4, '9': 1, '10': 'count'},
    const {
      '1': 'subscription',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadReq.Options.SubscriptionOptions',
      '9': 1,
      '10': 'subscription'
    },
    const {
      '1': 'filter',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadReq.Options.FilterOptions',
      '9': 2,
      '10': 'filter'
    },
    const {
      '1': 'no_filter',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 2,
      '10': 'noFilter'
    },
    const {
      '1': 'uuid_option',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadReq.Options.UUIDOption',
      '10': 'uuidOption'
    },
  ],
  '3': const [
    ReadReq_Options_StreamOptions$json,
    ReadReq_Options_AllOptions$json,
    ReadReq_Options_SubscriptionOptions$json,
    ReadReq_Options_Position$json,
    ReadReq_Options_FilterOptions$json,
    ReadReq_Options_UUIDOption$json
  ],
  '4': const [ReadReq_Options_ReadDirection$json],
  '8': const [
    const {'1': 'stream_option'},
    const {'1': 'count_option'},
    const {'1': 'filter_option'},
  ],
};

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Options_StreamOptions$json = const {
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

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Options_AllOptions$json = const {
  '1': 'AllOptions',
  '2': const [
    const {
      '1': 'position',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadReq.Options.Position',
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

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Options_SubscriptionOptions$json = const {
  '1': 'SubscriptionOptions',
};

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Options_Position$json = const {
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

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Options_FilterOptions$json = const {
  '1': 'FilterOptions',
  '2': const [
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.streams.ReadReq.Options.FilterOptions.Expression',
      '9': 0,
      '10': 'streamIdentifier'
    },
    const {
      '1': 'event_type',
      '3': 2,
      '4': 1,
      '5': 11,
      '6':
          '.event_store.client.streams.ReadReq.Options.FilterOptions.Expression',
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
  '3': const [ReadReq_Options_FilterOptions_Expression$json],
  '8': const [
    const {'1': 'filter'},
    const {'1': 'window'},
  ],
};

@$core.Deprecated('Use readReqDescriptor instead')
const ReadReq_Options_FilterOptions_Expression$json = const {
  '1': 'Expression',
  '2': const [
    const {'1': 'regex', '3': 1, '4': 1, '5': 9, '10': 'regex'},
    const {'1': 'prefix', '3': 2, '4': 3, '5': 9, '10': 'prefix'},
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
const ReadReq_Options_ReadDirection$json = const {
  '1': 'ReadDirection',
  '2': const [
    const {'1': 'Forwards', '2': 0},
    const {'1': 'Backwards', '2': 1},
  ],
};

/// Descriptor for `ReadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readReqDescriptor = $convert.base64Decode(
    'CgdSZWFkUmVxEkUKB29wdGlvbnMYASABKAsyKy5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5SZWFkUmVxLk9wdGlvbnNSB29wdGlvbnMajw8KB09wdGlvbnMSUwoGc3RyZWFtGAEgASgLMjkuZXZlbnRfc3RvcmUuY2xpZW50LnN0cmVhbXMuUmVhZFJlcS5PcHRpb25zLlN0cmVhbU9wdGlvbnNIAFIGc3RyZWFtEkoKA2FsbBgCIAEoCzI2LmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLlJlYWRSZXEuT3B0aW9ucy5BbGxPcHRpb25zSABSA2FsbBJgCg5yZWFkX2RpcmVjdGlvbhgDIAEoDjI5LmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLlJlYWRSZXEuT3B0aW9ucy5SZWFkRGlyZWN0aW9uUg1yZWFkRGlyZWN0aW9uEiMKDXJlc29sdmVfbGlua3MYBCABKAhSDHJlc29sdmVMaW5rcxIWCgVjb3VudBgFIAEoBEgBUgVjb3VudBJlCgxzdWJzY3JpcHRpb24YBiABKAsyPy5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5SZWFkUmVxLk9wdGlvbnMuU3Vic2NyaXB0aW9uT3B0aW9uc0gBUgxzdWJzY3JpcHRpb24SUwoGZmlsdGVyGAcgASgLMjkuZXZlbnRfc3RvcmUuY2xpZW50LnN0cmVhbXMuUmVhZFJlcS5PcHRpb25zLkZpbHRlck9wdGlvbnNIAlIGZmlsdGVyEjgKCW5vX2ZpbHRlchgIIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgCUghub0ZpbHRlchJXCgt1dWlkX29wdGlvbhgJIAEoCzI2LmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLlJlYWRSZXEuT3B0aW9ucy5VVUlET3B0aW9uUgp1dWlkT3B0aW9uGvUBCg1TdHJlYW1PcHRpb25zElEKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJSEHN0cmVhbUlkZW50aWZpZXISHAoIcmV2aXNpb24YAiABKARIAFIIcmV2aXNpb24SMQoFc3RhcnQYAyABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIFc3RhcnQSLQoDZW5kGAQgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSA2VuZEIRCg9yZXZpc2lvbl9vcHRpb24a0AEKCkFsbE9wdGlvbnMSUgoIcG9zaXRpb24YASABKAsyNC5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5SZWFkUmVxLk9wdGlvbnMuUG9zaXRpb25IAFIIcG9zaXRpb24SMQoFc3RhcnQYAiABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIFc3RhcnQSLQoDZW5kGAMgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSA2VuZEIMCgphbGxfb3B0aW9uGhUKE1N1YnNjcmlwdGlvbk9wdGlvbnMaXgoIUG9zaXRpb24SJwoPY29tbWl0X3Bvc2l0aW9uGAEgASgEUg5jb21taXRQb3NpdGlvbhIpChBwcmVwYXJlX3Bvc2l0aW9uGAIgASgEUg9wcmVwYXJlUG9zaXRpb24axgMKDUZpbHRlck9wdGlvbnMScwoRc3RyZWFtX2lkZW50aWZpZXIYASABKAsyRC5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5SZWFkUmVxLk9wdGlvbnMuRmlsdGVyT3B0aW9ucy5FeHByZXNzaW9uSABSEHN0cmVhbUlkZW50aWZpZXISZQoKZXZlbnRfdHlwZRgCIAEoCzJELmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLlJlYWRSZXEuT3B0aW9ucy5GaWx0ZXJPcHRpb25zLkV4cHJlc3Npb25IAFIJZXZlbnRUeXBlEhIKA21heBgDIAEoDUgBUgNtYXgSMQoFY291bnQYBCABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAVIFY291bnQSQgocY2hlY2twb2ludEludGVydmFsTXVsdGlwbGllchgFIAEoDVIcY2hlY2twb2ludEludGVydmFsTXVsdGlwbGllcho6CgpFeHByZXNzaW9uEhQKBXJlZ2V4GAEgASgJUgVyZWdleBIWCgZwcmVmaXgYAiADKAlSBnByZWZpeEIICgZmaWx0ZXJCCAoGd2luZG93GokBCgpVVUlET3B0aW9uEjsKCnN0cnVjdHVyZWQYASABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIKc3RydWN0dXJlZBIzCgZzdHJpbmcYAiABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIGc3RyaW5nQgkKB2NvbnRlbnQiLAoNUmVhZERpcmVjdGlvbhIMCghGb3J3YXJkcxAAEg0KCUJhY2t3YXJkcxABQg8KDXN0cmVhbV9vcHRpb25CDgoMY291bnRfb3B0aW9uQg8KDWZpbHRlcl9vcHRpb24=');
@$core.Deprecated('Use readRespDescriptor instead')
const ReadResp$json = const {
  '1': 'ReadResp',
  '2': const [
    const {
      '1': 'event',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadResp.ReadEvent',
      '9': 0,
      '10': 'event'
    },
    const {
      '1': 'confirmation',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadResp.SubscriptionConfirmation',
      '9': 0,
      '10': 'confirmation'
    },
    const {
      '1': 'checkpoint',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadResp.Checkpoint',
      '9': 0,
      '10': 'checkpoint'
    },
    const {
      '1': 'stream_not_found',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadResp.StreamNotFound',
      '9': 0,
      '10': 'streamNotFound'
    },
  ],
  '3': const [
    ReadResp_ReadEvent$json,
    ReadResp_SubscriptionConfirmation$json,
    ReadResp_Checkpoint$json,
    ReadResp_StreamNotFound$json
  ],
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
      '6': '.event_store.client.streams.ReadResp.ReadEvent.RecordedEvent',
      '10': 'event'
    },
    const {
      '1': 'link',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.ReadResp.ReadEvent.RecordedEvent',
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
  ],
  '3': const [ReadResp_ReadEvent_RecordedEvent$json],
  '8': const [
    const {'1': 'position'},
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
          '.event_store.client.streams.ReadResp.ReadEvent.RecordedEvent.MetadataEntry',
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

@$core.Deprecated('Use readRespDescriptor instead')
const ReadResp_Checkpoint$json = const {
  '1': 'Checkpoint',
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

@$core.Deprecated('Use readRespDescriptor instead')
const ReadResp_StreamNotFound$json = const {
  '1': 'StreamNotFound',
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

/// Descriptor for `ReadResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readRespDescriptor = $convert.base64Decode(
    'CghSZWFkUmVzcBJGCgVldmVudBgBIAEoCzIuLmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLlJlYWRSZXNwLlJlYWRFdmVudEgAUgVldmVudBJjCgxjb25maXJtYXRpb24YAiABKAsyPS5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5SZWFkUmVzcC5TdWJzY3JpcHRpb25Db25maXJtYXRpb25IAFIMY29uZmlybWF0aW9uElEKCmNoZWNrcG9pbnQYAyABKAsyLy5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5SZWFkUmVzcC5DaGVja3BvaW50SABSCmNoZWNrcG9pbnQSXwoQc3RyZWFtX25vdF9mb3VuZBgEIAEoCzIzLmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLlJlYWRSZXNwLlN0cmVhbU5vdEZvdW5kSABSDnN0cmVhbU5vdEZvdW5kGpQGCglSZWFkRXZlbnQSUgoFZXZlbnQYASABKAsyPC5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5SZWFkUmVzcC5SZWFkRXZlbnQuUmVjb3JkZWRFdmVudFIFZXZlbnQSUAoEbGluaxgCIAEoCzI8LmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLlJlYWRSZXNwLlJlYWRFdmVudC5SZWNvcmRlZEV2ZW50UgRsaW5rEikKD2NvbW1pdF9wb3NpdGlvbhgDIAEoBEgAUg5jb21taXRQb3NpdGlvbhI8Cgtub19wb3NpdGlvbhgEIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgpub1Bvc2l0aW9uGusDCg1SZWNvcmRlZEV2ZW50EigKAmlkGAEgASgLMhguZXZlbnRfc3RvcmUuY2xpZW50LlVVSURSAmlkElEKEXN0cmVhbV9pZGVudGlmaWVyGAIgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJSEHN0cmVhbUlkZW50aWZpZXISJwoPc3RyZWFtX3JldmlzaW9uGAMgASgEUg5zdHJlYW1SZXZpc2lvbhIpChBwcmVwYXJlX3Bvc2l0aW9uGAQgASgEUg9wcmVwYXJlUG9zaXRpb24SJwoPY29tbWl0X3Bvc2l0aW9uGAUgASgEUg5jb21taXRQb3NpdGlvbhJmCghtZXRhZGF0YRgGIAMoCzJKLmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLlJlYWRSZXNwLlJlYWRFdmVudC5SZWNvcmRlZEV2ZW50Lk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhEicKD2N1c3RvbV9tZXRhZGF0YRgHIAEoDFIOY3VzdG9tTWV0YWRhdGESEgoEZGF0YRgIIAEoDFIEZGF0YRo7Cg1NZXRhZGF0YUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAFCCgoIcG9zaXRpb24aQwoYU3Vic2NyaXB0aW9uQ29uZmlybWF0aW9uEicKD3N1YnNjcmlwdGlvbl9pZBgBIAEoCVIOc3Vic2NyaXB0aW9uSWQaYAoKQ2hlY2twb2ludBInCg9jb21taXRfcG9zaXRpb24YASABKARSDmNvbW1pdFBvc2l0aW9uEikKEHByZXBhcmVfcG9zaXRpb24YAiABKARSD3ByZXBhcmVQb3NpdGlvbhpjCg5TdHJlYW1Ob3RGb3VuZBJRChFzdHJlYW1faWRlbnRpZmllchgBIAEoCzIkLmV2ZW50X3N0b3JlLmNsaWVudC5TdHJlYW1JZGVudGlmaWVyUhBzdHJlYW1JZGVudGlmaWVyQgkKB2NvbnRlbnQ=');
@$core.Deprecated('Use appendReqDescriptor instead')
const AppendReq$json = const {
  '1': 'AppendReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.AppendReq.Options',
      '9': 0,
      '10': 'options'
    },
    const {
      '1': 'proposed_message',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.AppendReq.ProposedMessage',
      '9': 0,
      '10': 'proposedMessage'
    },
  ],
  '3': const [AppendReq_Options$json, AppendReq_ProposedMessage$json],
  '8': const [
    const {'1': 'content'},
  ],
};

@$core.Deprecated('Use appendReqDescriptor instead')
const AppendReq_Options$json = const {
  '1': 'Options',
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
      '1': 'no_stream',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'noStream'
    },
    const {
      '1': 'any',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'any'
    },
    const {
      '1': 'stream_exists',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'streamExists'
    },
  ],
  '8': const [
    const {'1': 'expected_stream_revision'},
  ],
};

@$core.Deprecated('Use appendReqDescriptor instead')
const AppendReq_ProposedMessage$json = const {
  '1': 'ProposedMessage',
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
      '1': 'metadata',
      '3': 2,
      '4': 3,
      '5': 11,
      '6':
          '.event_store.client.streams.AppendReq.ProposedMessage.MetadataEntry',
      '10': 'metadata'
    },
    const {
      '1': 'custom_metadata',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'customMetadata'
    },
    const {'1': 'data', '3': 4, '4': 1, '5': 12, '10': 'data'},
  ],
  '3': const [AppendReq_ProposedMessage_MetadataEntry$json],
};

@$core.Deprecated('Use appendReqDescriptor instead')
const AppendReq_ProposedMessage_MetadataEntry$json = const {
  '1': 'MetadataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `AppendReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appendReqDescriptor = $convert.base64Decode(
    'CglBcHBlbmRSZXESSQoHb3B0aW9ucxgBIAEoCzItLmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLkFwcGVuZFJlcS5PcHRpb25zSABSB29wdGlvbnMSYgoQcHJvcG9zZWRfbWVzc2FnZRgCIAEoCzI1LmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLkFwcGVuZFJlcS5Qcm9wb3NlZE1lc3NhZ2VIAFIPcHJvcG9zZWRNZXNzYWdlGsECCgdPcHRpb25zElEKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJSEHN0cmVhbUlkZW50aWZpZXISHAoIcmV2aXNpb24YAiABKARIAFIIcmV2aXNpb24SOAoJbm9fc3RyZWFtGAMgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSCG5vU3RyZWFtEi0KA2FueRgEIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgNhbnkSQAoNc3RyZWFtX2V4aXN0cxgFIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgxzdHJlYW1FeGlzdHNCGgoYZXhwZWN0ZWRfc3RyZWFtX3JldmlzaW9uGpYCCg9Qcm9wb3NlZE1lc3NhZ2USKAoCaWQYASABKAsyGC5ldmVudF9zdG9yZS5jbGllbnQuVVVJRFICaWQSXwoIbWV0YWRhdGEYAiADKAsyQy5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5BcHBlbmRSZXEuUHJvcG9zZWRNZXNzYWdlLk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhEicKD2N1c3RvbV9tZXRhZGF0YRgDIAEoDFIOY3VzdG9tTWV0YWRhdGESEgoEZGF0YRgEIAEoDFIEZGF0YRo7Cg1NZXRhZGF0YUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAFCCQoHY29udGVudA==');
@$core.Deprecated('Use appendRespDescriptor instead')
const AppendResp$json = const {
  '1': 'AppendResp',
  '2': const [
    const {
      '1': 'success',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.AppendResp.Success',
      '9': 0,
      '10': 'success'
    },
    const {
      '1': 'wrong_expected_version',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.AppendResp.WrongExpectedVersion',
      '9': 0,
      '10': 'wrongExpectedVersion'
    },
  ],
  '3': const [
    AppendResp_Position$json,
    AppendResp_Success$json,
    AppendResp_WrongExpectedVersion$json
  ],
  '8': const [
    const {'1': 'result'},
  ],
};

@$core.Deprecated('Use appendRespDescriptor instead')
const AppendResp_Position$json = const {
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

@$core.Deprecated('Use appendRespDescriptor instead')
const AppendResp_Success$json = const {
  '1': 'Success',
  '2': const [
    const {
      '1': 'current_revision',
      '3': 1,
      '4': 1,
      '5': 4,
      '9': 0,
      '10': 'currentRevision'
    },
    const {
      '1': 'no_stream',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'noStream'
    },
    const {
      '1': 'position',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.AppendResp.Position',
      '9': 1,
      '10': 'position'
    },
    const {
      '1': 'no_position',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 1,
      '10': 'noPosition'
    },
  ],
  '8': const [
    const {'1': 'current_revision_option'},
    const {'1': 'position_option'},
  ],
};

@$core.Deprecated('Use appendRespDescriptor instead')
const AppendResp_WrongExpectedVersion$json = const {
  '1': 'WrongExpectedVersion',
  '2': const [
    const {
      '1': 'current_revision_20_6_0',
      '3': 1,
      '4': 1,
      '5': 4,
      '9': 0,
      '10': 'currentRevision2060'
    },
    const {
      '1': 'no_stream_20_6_0',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'noStream2060'
    },
    const {
      '1': 'expected_revision_20_6_0',
      '3': 3,
      '4': 1,
      '5': 4,
      '9': 1,
      '10': 'expectedRevision2060'
    },
    const {
      '1': 'any_20_6_0',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 1,
      '10': 'any2060'
    },
    const {
      '1': 'stream_exists_20_6_0',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 1,
      '10': 'streamExists2060'
    },
    const {
      '1': 'current_revision',
      '3': 6,
      '4': 1,
      '5': 4,
      '9': 2,
      '10': 'currentRevision'
    },
    const {
      '1': 'current_no_stream',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 2,
      '10': 'currentNoStream'
    },
    const {
      '1': 'expected_revision',
      '3': 8,
      '4': 1,
      '5': 4,
      '9': 3,
      '10': 'expectedRevision'
    },
    const {
      '1': 'expected_any',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 3,
      '10': 'expectedAny'
    },
    const {
      '1': 'expected_stream_exists',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 3,
      '10': 'expectedStreamExists'
    },
    const {
      '1': 'expected_no_stream',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 3,
      '10': 'expectedNoStream'
    },
  ],
  '8': const [
    const {'1': 'current_revision_option_20_6_0'},
    const {'1': 'expected_revision_option_20_6_0'},
    const {'1': 'current_revision_option'},
    const {'1': 'expected_revision_option'},
  ],
};

/// Descriptor for `AppendResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appendRespDescriptor = $convert.base64Decode(
    'CgpBcHBlbmRSZXNwEkoKB3N1Y2Nlc3MYASABKAsyLi5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5BcHBlbmRSZXNwLlN1Y2Nlc3NIAFIHc3VjY2VzcxJzChZ3cm9uZ19leHBlY3RlZF92ZXJzaW9uGAIgASgLMjsuZXZlbnRfc3RvcmUuY2xpZW50LnN0cmVhbXMuQXBwZW5kUmVzcC5Xcm9uZ0V4cGVjdGVkVmVyc2lvbkgAUhR3cm9uZ0V4cGVjdGVkVmVyc2lvbhpeCghQb3NpdGlvbhInCg9jb21taXRfcG9zaXRpb24YASABKARSDmNvbW1pdFBvc2l0aW9uEikKEHByZXBhcmVfcG9zaXRpb24YAiABKARSD3ByZXBhcmVQb3NpdGlvbhqrAgoHU3VjY2VzcxIrChBjdXJyZW50X3JldmlzaW9uGAEgASgESABSD2N1cnJlbnRSZXZpc2lvbhI4Cglub19zdHJlYW0YAiABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIIbm9TdHJlYW0STQoIcG9zaXRpb24YAyABKAsyLy5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5BcHBlbmRSZXNwLlBvc2l0aW9uSAFSCHBvc2l0aW9uEjwKC25vX3Bvc2l0aW9uGAQgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SAFSCm5vUG9zaXRpb25CGQoXY3VycmVudF9yZXZpc2lvbl9vcHRpb25CEQoPcG9zaXRpb25fb3B0aW9uGtMGChRXcm9uZ0V4cGVjdGVkVmVyc2lvbhI2ChdjdXJyZW50X3JldmlzaW9uXzIwXzZfMBgBIAEoBEgAUhNjdXJyZW50UmV2aXNpb24yMDYwEkMKEG5vX3N0cmVhbV8yMF82XzAYAiABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIMbm9TdHJlYW0yMDYwEjgKGGV4cGVjdGVkX3JldmlzaW9uXzIwXzZfMBgDIAEoBEgBUhRleHBlY3RlZFJldmlzaW9uMjA2MBI4CgphbnlfMjBfNl8wGAQgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SAFSB2FueTIwNjASSwoUc3RyZWFtX2V4aXN0c18yMF82XzAYBSABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAVIQc3RyZWFtRXhpc3RzMjA2MBIrChBjdXJyZW50X3JldmlzaW9uGAYgASgESAJSD2N1cnJlbnRSZXZpc2lvbhJHChFjdXJyZW50X25vX3N0cmVhbRgHIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgCUg9jdXJyZW50Tm9TdHJlYW0SLQoRZXhwZWN0ZWRfcmV2aXNpb24YCCABKARIA1IQZXhwZWN0ZWRSZXZpc2lvbhI+CgxleHBlY3RlZF9hbnkYCSABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIA1ILZXhwZWN0ZWRBbnkSUQoWZXhwZWN0ZWRfc3RyZWFtX2V4aXN0cxgKIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgDUhRleHBlY3RlZFN0cmVhbUV4aXN0cxJJChJleHBlY3RlZF9ub19zdHJlYW0YCyABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIA1IQZXhwZWN0ZWROb1N0cmVhbUIgCh5jdXJyZW50X3JldmlzaW9uX29wdGlvbl8yMF82XzBCIQofZXhwZWN0ZWRfcmV2aXNpb25fb3B0aW9uXzIwXzZfMEIZChdjdXJyZW50X3JldmlzaW9uX29wdGlvbkIaChhleHBlY3RlZF9yZXZpc2lvbl9vcHRpb25CCAoGcmVzdWx0');
@$core.Deprecated('Use batchAppendReqDescriptor instead')
const BatchAppendReq$json = const {
  '1': 'BatchAppendReq',
  '2': const [
    const {
      '1': 'correlation_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'correlationId'
    },
    const {
      '1': 'options',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.BatchAppendReq.Options',
      '10': 'options'
    },
    const {
      '1': 'proposed_messages',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.event_store.client.streams.BatchAppendReq.ProposedMessage',
      '10': 'proposedMessages'
    },
    const {'1': 'is_final', '3': 4, '4': 1, '5': 8, '10': 'isFinal'},
  ],
  '3': const [BatchAppendReq_Options$json, BatchAppendReq_ProposedMessage$json],
};

@$core.Deprecated('Use batchAppendReqDescriptor instead')
const BatchAppendReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {
      '1': 'stream_identifier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '10': 'streamIdentifier'
    },
    const {
      '1': 'stream_position',
      '3': 2,
      '4': 1,
      '5': 4,
      '9': 0,
      '10': 'streamPosition'
    },
    const {
      '1': 'no_stream',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'noStream'
    },
    const {
      '1': 'any',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'any'
    },
    const {
      '1': 'stream_exists',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'streamExists'
    },
    const {
      '1': 'deadline',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'deadline'
    },
  ],
  '8': const [
    const {'1': 'expected_stream_position'},
  ],
};

@$core.Deprecated('Use batchAppendReqDescriptor instead')
const BatchAppendReq_ProposedMessage$json = const {
  '1': 'ProposedMessage',
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
      '1': 'metadata',
      '3': 2,
      '4': 3,
      '5': 11,
      '6':
          '.event_store.client.streams.BatchAppendReq.ProposedMessage.MetadataEntry',
      '10': 'metadata'
    },
    const {
      '1': 'custom_metadata',
      '3': 3,
      '4': 1,
      '5': 12,
      '10': 'customMetadata'
    },
    const {'1': 'data', '3': 4, '4': 1, '5': 12, '10': 'data'},
  ],
  '3': const [BatchAppendReq_ProposedMessage_MetadataEntry$json],
};

@$core.Deprecated('Use batchAppendReqDescriptor instead')
const BatchAppendReq_ProposedMessage_MetadataEntry$json = const {
  '1': 'MetadataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `BatchAppendReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List batchAppendReqDescriptor = $convert.base64Decode(
    'Cg5CYXRjaEFwcGVuZFJlcRI/Cg5jb3JyZWxhdGlvbl9pZBgBIAEoCzIYLmV2ZW50X3N0b3JlLmNsaWVudC5VVUlEUg1jb3JyZWxhdGlvbklkEkwKB29wdGlvbnMYAiABKAsyMi5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5CYXRjaEFwcGVuZFJlcS5PcHRpb25zUgdvcHRpb25zEmcKEXByb3Bvc2VkX21lc3NhZ2VzGAMgAygLMjouZXZlbnRfc3RvcmUuY2xpZW50LnN0cmVhbXMuQmF0Y2hBcHBlbmRSZXEuUHJvcG9zZWRNZXNzYWdlUhBwcm9wb3NlZE1lc3NhZ2VzEhkKCGlzX2ZpbmFsGAQgASgIUgdpc0ZpbmFsGv0CCgdPcHRpb25zElEKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJSEHN0cmVhbUlkZW50aWZpZXISKQoPc3RyZWFtX3Bvc2l0aW9uGAIgASgESABSDnN0cmVhbVBvc2l0aW9uEjUKCW5vX3N0cmVhbRgDIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgAUghub1N0cmVhbRIqCgNhbnkYBCABKAsyFi5nb29nbGUucHJvdG9idWYuRW1wdHlIAFIDYW55Ej0KDXN0cmVhbV9leGlzdHMYBSABKAsyFi5nb29nbGUucHJvdG9idWYuRW1wdHlIAFIMc3RyZWFtRXhpc3RzEjYKCGRlYWRsaW5lGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIZGVhZGxpbmVCGgoYZXhwZWN0ZWRfc3RyZWFtX3Bvc2l0aW9uGpsCCg9Qcm9wb3NlZE1lc3NhZ2USKAoCaWQYASABKAsyGC5ldmVudF9zdG9yZS5jbGllbnQuVVVJRFICaWQSZAoIbWV0YWRhdGEYAiADKAsySC5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5CYXRjaEFwcGVuZFJlcS5Qcm9wb3NlZE1lc3NhZ2UuTWV0YWRhdGFFbnRyeVIIbWV0YWRhdGESJwoPY3VzdG9tX21ldGFkYXRhGAMgASgMUg5jdXN0b21NZXRhZGF0YRISCgRkYXRhGAQgASgMUgRkYXRhGjsKDU1ldGFkYXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use batchAppendRespDescriptor instead')
const BatchAppendResp$json = const {
  '1': 'BatchAppendResp',
  '2': const [
    const {
      '1': 'correlation_id',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.UUID',
      '10': 'correlationId'
    },
    const {
      '1': 'error',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.rpc.Status',
      '9': 0,
      '10': 'error'
    },
    const {
      '1': 'success',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.BatchAppendResp.Success',
      '9': 0,
      '10': 'success'
    },
    const {
      '1': 'stream_identifier',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.StreamIdentifier',
      '10': 'streamIdentifier'
    },
    const {
      '1': 'stream_position',
      '3': 5,
      '4': 1,
      '5': 4,
      '9': 1,
      '10': 'streamPosition'
    },
    const {
      '1': 'no_stream',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 1,
      '10': 'noStream'
    },
    const {
      '1': 'any',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 1,
      '10': 'any'
    },
    const {
      '1': 'stream_exists',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 1,
      '10': 'streamExists'
    },
  ],
  '3': const [BatchAppendResp_Success$json],
  '8': const [
    const {'1': 'result'},
    const {'1': 'expected_stream_position'},
  ],
};

@$core.Deprecated('Use batchAppendRespDescriptor instead')
const BatchAppendResp_Success$json = const {
  '1': 'Success',
  '2': const [
    const {
      '1': 'current_revision',
      '3': 1,
      '4': 1,
      '5': 4,
      '9': 0,
      '10': 'currentRevision'
    },
    const {
      '1': 'no_stream',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'noStream'
    },
    const {
      '1': 'position',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.AllStreamPosition',
      '9': 1,
      '10': 'position'
    },
    const {
      '1': 'no_position',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 1,
      '10': 'noPosition'
    },
  ],
  '8': const [
    const {'1': 'current_revision_option'},
    const {'1': 'position_option'},
  ],
};

/// Descriptor for `BatchAppendResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List batchAppendRespDescriptor = $convert.base64Decode(
    'Cg9CYXRjaEFwcGVuZFJlc3ASPwoOY29ycmVsYXRpb25faWQYASABKAsyGC5ldmVudF9zdG9yZS5jbGllbnQuVVVJRFINY29ycmVsYXRpb25JZBIqCgVlcnJvchgCIAEoCzISLmdvb2dsZS5ycGMuU3RhdHVzSABSBWVycm9yEk8KB3N1Y2Nlc3MYAyABKAsyMy5ldmVudF9zdG9yZS5jbGllbnQuc3RyZWFtcy5CYXRjaEFwcGVuZFJlc3AuU3VjY2Vzc0gAUgdzdWNjZXNzElEKEXN0cmVhbV9pZGVudGlmaWVyGAQgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJSEHN0cmVhbUlkZW50aWZpZXISKQoPc3RyZWFtX3Bvc2l0aW9uGAUgASgESAFSDnN0cmVhbVBvc2l0aW9uEjUKCW5vX3N0cmVhbRgGIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgBUghub1N0cmVhbRIqCgNhbnkYByABKAsyFi5nb29nbGUucHJvdG9idWYuRW1wdHlIAVIDYW55Ej0KDXN0cmVhbV9leGlzdHMYCCABKAsyFi5nb29nbGUucHJvdG9idWYuRW1wdHlIAVIMc3RyZWFtRXhpc3RzGpsCCgdTdWNjZXNzEisKEGN1cnJlbnRfcmV2aXNpb24YASABKARIAFIPY3VycmVudFJldmlzaW9uEjUKCW5vX3N0cmVhbRgCIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgAUghub1N0cmVhbRJDCghwb3NpdGlvbhgDIAEoCzIlLmV2ZW50X3N0b3JlLmNsaWVudC5BbGxTdHJlYW1Qb3NpdGlvbkgBUghwb3NpdGlvbhI5Cgtub19wb3NpdGlvbhgEIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgBUgpub1Bvc2l0aW9uQhkKF2N1cnJlbnRfcmV2aXNpb25fb3B0aW9uQhEKD3Bvc2l0aW9uX29wdGlvbkIICgZyZXN1bHRCGgoYZXhwZWN0ZWRfc3RyZWFtX3Bvc2l0aW9u');
@$core.Deprecated('Use deleteReqDescriptor instead')
const DeleteReq$json = const {
  '1': 'DeleteReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.DeleteReq.Options',
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
      '10': 'streamIdentifier'
    },
    const {'1': 'revision', '3': 2, '4': 1, '5': 4, '9': 0, '10': 'revision'},
    const {
      '1': 'no_stream',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'noStream'
    },
    const {
      '1': 'any',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'any'
    },
    const {
      '1': 'stream_exists',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'streamExists'
    },
  ],
  '8': const [
    const {'1': 'expected_stream_revision'},
  ],
};

/// Descriptor for `DeleteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteReqDescriptor = $convert.base64Decode(
    'CglEZWxldGVSZXESRwoHb3B0aW9ucxgBIAEoCzItLmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLkRlbGV0ZVJlcS5PcHRpb25zUgdvcHRpb25zGsECCgdPcHRpb25zElEKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJSEHN0cmVhbUlkZW50aWZpZXISHAoIcmV2aXNpb24YAiABKARIAFIIcmV2aXNpb24SOAoJbm9fc3RyZWFtGAMgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSCG5vU3RyZWFtEi0KA2FueRgEIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgNhbnkSQAoNc3RyZWFtX2V4aXN0cxgFIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgxzdHJlYW1FeGlzdHNCGgoYZXhwZWN0ZWRfc3RyZWFtX3JldmlzaW9u');
@$core.Deprecated('Use deleteRespDescriptor instead')
const DeleteResp$json = const {
  '1': 'DeleteResp',
  '2': const [
    const {
      '1': 'position',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.DeleteResp.Position',
      '9': 0,
      '10': 'position'
    },
    const {
      '1': 'no_position',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'noPosition'
    },
  ],
  '3': const [DeleteResp_Position$json],
  '8': const [
    const {'1': 'position_option'},
  ],
};

@$core.Deprecated('Use deleteRespDescriptor instead')
const DeleteResp_Position$json = const {
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

/// Descriptor for `DeleteResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRespDescriptor = $convert.base64Decode(
    'CgpEZWxldGVSZXNwEk0KCHBvc2l0aW9uGAEgASgLMi8uZXZlbnRfc3RvcmUuY2xpZW50LnN0cmVhbXMuRGVsZXRlUmVzcC5Qb3NpdGlvbkgAUghwb3NpdGlvbhI8Cgtub19wb3NpdGlvbhgCIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgpub1Bvc2l0aW9uGl4KCFBvc2l0aW9uEicKD2NvbW1pdF9wb3NpdGlvbhgBIAEoBFIOY29tbWl0UG9zaXRpb24SKQoQcHJlcGFyZV9wb3NpdGlvbhgCIAEoBFIPcHJlcGFyZVBvc2l0aW9uQhEKD3Bvc2l0aW9uX29wdGlvbg==');
@$core.Deprecated('Use tombstoneReqDescriptor instead')
const TombstoneReq$json = const {
  '1': 'TombstoneReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.TombstoneReq.Options',
      '10': 'options'
    },
  ],
  '3': const [TombstoneReq_Options$json],
};

@$core.Deprecated('Use tombstoneReqDescriptor instead')
const TombstoneReq_Options$json = const {
  '1': 'Options',
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
      '1': 'no_stream',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'noStream'
    },
    const {
      '1': 'any',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'any'
    },
    const {
      '1': 'stream_exists',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'streamExists'
    },
  ],
  '8': const [
    const {'1': 'expected_stream_revision'},
  ],
};

/// Descriptor for `TombstoneReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tombstoneReqDescriptor = $convert.base64Decode(
    'CgxUb21ic3RvbmVSZXESSgoHb3B0aW9ucxgBIAEoCzIwLmV2ZW50X3N0b3JlLmNsaWVudC5zdHJlYW1zLlRvbWJzdG9uZVJlcS5PcHRpb25zUgdvcHRpb25zGsECCgdPcHRpb25zElEKEXN0cmVhbV9pZGVudGlmaWVyGAEgASgLMiQuZXZlbnRfc3RvcmUuY2xpZW50LlN0cmVhbUlkZW50aWZpZXJSEHN0cmVhbUlkZW50aWZpZXISHAoIcmV2aXNpb24YAiABKARIAFIIcmV2aXNpb24SOAoJbm9fc3RyZWFtGAMgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSCG5vU3RyZWFtEi0KA2FueRgEIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgNhbnkSQAoNc3RyZWFtX2V4aXN0cxgFIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgxzdHJlYW1FeGlzdHNCGgoYZXhwZWN0ZWRfc3RyZWFtX3JldmlzaW9u');
@$core.Deprecated('Use tombstoneRespDescriptor instead')
const TombstoneResp$json = const {
  '1': 'TombstoneResp',
  '2': const [
    const {
      '1': 'position',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.streams.TombstoneResp.Position',
      '9': 0,
      '10': 'position'
    },
    const {
      '1': 'no_position',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'noPosition'
    },
  ],
  '3': const [TombstoneResp_Position$json],
  '8': const [
    const {'1': 'position_option'},
  ],
};

@$core.Deprecated('Use tombstoneRespDescriptor instead')
const TombstoneResp_Position$json = const {
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

/// Descriptor for `TombstoneResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tombstoneRespDescriptor = $convert.base64Decode(
    'Cg1Ub21ic3RvbmVSZXNwElAKCHBvc2l0aW9uGAEgASgLMjIuZXZlbnRfc3RvcmUuY2xpZW50LnN0cmVhbXMuVG9tYnN0b25lUmVzcC5Qb3NpdGlvbkgAUghwb3NpdGlvbhI8Cgtub19wb3NpdGlvbhgCIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgpub1Bvc2l0aW9uGl4KCFBvc2l0aW9uEicKD2NvbW1pdF9wb3NpdGlvbhgBIAEoBFIOY29tbWl0UG9zaXRpb24SKQoQcHJlcGFyZV9wb3NpdGlvbhgCIAEoBFIPcHJlcGFyZVBvc2l0aW9uQhEKD3Bvc2l0aW9uX29wdGlvbg==');
