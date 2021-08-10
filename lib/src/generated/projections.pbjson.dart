///
//  Generated code. Do not modify.
//  source: projections.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq$json = const {
  '1': 'CreateReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.CreateReq.Options',
      '10': 'options'
    },
  ],
  '3': const [CreateReq_Options$json],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {
      '1': 'one_time',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'oneTime'
    },
    const {
      '1': 'transient',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.CreateReq.Options.Transient',
      '9': 0,
      '10': 'transient'
    },
    const {
      '1': 'continuous',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.CreateReq.Options.Continuous',
      '9': 0,
      '10': 'continuous'
    },
    const {'1': 'query', '3': 4, '4': 1, '5': 9, '10': 'query'},
  ],
  '3': const [
    CreateReq_Options_Transient$json,
    CreateReq_Options_Continuous$json
  ],
  '8': const [
    const {'1': 'mode'},
  ],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_Options_Transient$json = const {
  '1': 'Transient',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_Options_Continuous$json = const {
  '1': 'Continuous',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'track_emitted_streams',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'trackEmittedStreams'
    },
  ],
};

/// Descriptor for `CreateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReqDescriptor = $convert.base64Decode(
    'CglDcmVhdGVSZXESSwoHb3B0aW9ucxgBIAEoCzIxLmV2ZW50X3N0b3JlLmNsaWVudC5wcm9qZWN0aW9ucy5DcmVhdGVSZXEuT3B0aW9uc1IHb3B0aW9ucxqTAwoHT3B0aW9ucxI2CghvbmVfdGltZRgBIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgdvbmVUaW1lElsKCXRyYW5zaWVudBgCIAEoCzI7LmV2ZW50X3N0b3JlLmNsaWVudC5wcm9qZWN0aW9ucy5DcmVhdGVSZXEuT3B0aW9ucy5UcmFuc2llbnRIAFIJdHJhbnNpZW50El4KCmNvbnRpbnVvdXMYAyABKAsyPC5ldmVudF9zdG9yZS5jbGllbnQucHJvamVjdGlvbnMuQ3JlYXRlUmVxLk9wdGlvbnMuQ29udGludW91c0gAUgpjb250aW51b3VzEhQKBXF1ZXJ5GAQgASgJUgVxdWVyeRofCglUcmFuc2llbnQSEgoEbmFtZRgBIAEoCVIEbmFtZRpUCgpDb250aW51b3VzEhIKBG5hbWUYASABKAlSBG5hbWUSMgoVdHJhY2tfZW1pdHRlZF9zdHJlYW1zGAIgASgIUhN0cmFja0VtaXR0ZWRTdHJlYW1zQgYKBG1vZGU=');
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
      '6': '.event_store.client.projections.UpdateReq.Options',
      '10': 'options'
    },
  ],
  '3': const [UpdateReq_Options$json],
};

@$core.Deprecated('Use updateReqDescriptor instead')
const UpdateReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'query', '3': 2, '4': 1, '5': 9, '10': 'query'},
    const {
      '1': 'emit_enabled',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'emitEnabled'
    },
    const {
      '1': 'no_emit_options',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'noEmitOptions'
    },
  ],
  '8': const [
    const {'1': 'emit_option'},
  ],
};

/// Descriptor for `UpdateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateReqDescriptor = $convert.base64Decode(
    'CglVcGRhdGVSZXESSwoHb3B0aW9ucxgBIAEoCzIxLmV2ZW50X3N0b3JlLmNsaWVudC5wcm9qZWN0aW9ucy5VcGRhdGVSZXEuT3B0aW9uc1IHb3B0aW9ucxqsAQoHT3B0aW9ucxISCgRuYW1lGAEgASgJUgRuYW1lEhQKBXF1ZXJ5GAIgASgJUgVxdWVyeRIjCgxlbWl0X2VuYWJsZWQYAyABKAhIAFILZW1pdEVuYWJsZWQSQwoPbm9fZW1pdF9vcHRpb25zGAQgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSDW5vRW1pdE9wdGlvbnNCDQoLZW1pdF9vcHRpb24=');
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
      '6': '.event_store.client.projections.DeleteReq.Options',
      '10': 'options'
    },
  ],
  '3': const [DeleteReq_Options$json],
};

@$core.Deprecated('Use deleteReqDescriptor instead')
const DeleteReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'delete_emitted_streams',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'deleteEmittedStreams'
    },
    const {
      '1': 'delete_state_stream',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'deleteStateStream'
    },
    const {
      '1': 'delete_checkpoint_stream',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'deleteCheckpointStream'
    },
  ],
};

/// Descriptor for `DeleteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteReqDescriptor = $convert.base64Decode(
    'CglEZWxldGVSZXESSwoHb3B0aW9ucxgBIAEoCzIxLmV2ZW50X3N0b3JlLmNsaWVudC5wcm9qZWN0aW9ucy5EZWxldGVSZXEuT3B0aW9uc1IHb3B0aW9ucxq9AQoHT3B0aW9ucxISCgRuYW1lGAEgASgJUgRuYW1lEjQKFmRlbGV0ZV9lbWl0dGVkX3N0cmVhbXMYAiABKAhSFGRlbGV0ZUVtaXR0ZWRTdHJlYW1zEi4KE2RlbGV0ZV9zdGF0ZV9zdHJlYW0YAyABKAhSEWRlbGV0ZVN0YXRlU3RyZWFtEjgKGGRlbGV0ZV9jaGVja3BvaW50X3N0cmVhbRgEIAEoCFIWZGVsZXRlQ2hlY2twb2ludFN0cmVhbQ==');
@$core.Deprecated('Use deleteRespDescriptor instead')
const DeleteResp$json = const {
  '1': 'DeleteResp',
};

/// Descriptor for `DeleteResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRespDescriptor =
    $convert.base64Decode('CgpEZWxldGVSZXNw');
@$core.Deprecated('Use statisticsReqDescriptor instead')
const StatisticsReq$json = const {
  '1': 'StatisticsReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.StatisticsReq.Options',
      '10': 'options'
    },
  ],
  '3': const [StatisticsReq_Options$json],
};

@$core.Deprecated('Use statisticsReqDescriptor instead')
const StatisticsReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name'},
    const {
      '1': 'all',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'all'
    },
    const {
      '1': 'transient',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'transient'
    },
    const {
      '1': 'continuous',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'continuous'
    },
    const {
      '1': 'one_time',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.Empty',
      '9': 0,
      '10': 'oneTime'
    },
  ],
  '8': const [
    const {'1': 'mode'},
  ],
};

/// Descriptor for `StatisticsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statisticsReqDescriptor = $convert.base64Decode(
    'Cg1TdGF0aXN0aWNzUmVxEk8KB29wdGlvbnMYASABKAsyNS5ldmVudF9zdG9yZS5jbGllbnQucHJvamVjdGlvbnMuU3RhdGlzdGljc1JlcS5PcHRpb25zUgdvcHRpb25zGoYCCgdPcHRpb25zEhQKBG5hbWUYASABKAlIAFIEbmFtZRItCgNhbGwYAiABKAsyGS5ldmVudF9zdG9yZS5jbGllbnQuRW1wdHlIAFIDYWxsEjkKCXRyYW5zaWVudBgDIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgl0cmFuc2llbnQSOwoKY29udGludW91cxgEIAEoCzIZLmV2ZW50X3N0b3JlLmNsaWVudC5FbXB0eUgAUgpjb250aW51b3VzEjYKCG9uZV90aW1lGAUgASgLMhkuZXZlbnRfc3RvcmUuY2xpZW50LkVtcHR5SABSB29uZVRpbWVCBgoEbW9kZQ==');
@$core.Deprecated('Use statisticsRespDescriptor instead')
const StatisticsResp$json = const {
  '1': 'StatisticsResp',
  '2': const [
    const {
      '1': 'details',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.StatisticsResp.Details',
      '10': 'details'
    },
  ],
  '3': const [StatisticsResp_Details$json],
};

@$core.Deprecated('Use statisticsRespDescriptor instead')
const StatisticsResp_Details$json = const {
  '1': 'Details',
  '2': const [
    const {
      '1': 'coreProcessingTime',
      '3': 1,
      '4': 1,
      '5': 3,
      '10': 'coreProcessingTime'
    },
    const {'1': 'version', '3': 2, '4': 1, '5': 3, '10': 'version'},
    const {'1': 'epoch', '3': 3, '4': 1, '5': 3, '10': 'epoch'},
    const {'1': 'effectiveName', '3': 4, '4': 1, '5': 9, '10': 'effectiveName'},
    const {
      '1': 'writesInProgress',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'writesInProgress'
    },
    const {
      '1': 'readsInProgress',
      '3': 6,
      '4': 1,
      '5': 5,
      '10': 'readsInProgress'
    },
    const {
      '1': 'partitionsCached',
      '3': 7,
      '4': 1,
      '5': 5,
      '10': 'partitionsCached'
    },
    const {'1': 'status', '3': 8, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'stateReason', '3': 9, '4': 1, '5': 9, '10': 'stateReason'},
    const {'1': 'name', '3': 10, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'mode', '3': 11, '4': 1, '5': 9, '10': 'mode'},
    const {'1': 'position', '3': 12, '4': 1, '5': 9, '10': 'position'},
    const {'1': 'progress', '3': 13, '4': 1, '5': 2, '10': 'progress'},
    const {
      '1': 'lastCheckpoint',
      '3': 14,
      '4': 1,
      '5': 9,
      '10': 'lastCheckpoint'
    },
    const {
      '1': 'eventsProcessedAfterRestart',
      '3': 15,
      '4': 1,
      '5': 3,
      '10': 'eventsProcessedAfterRestart'
    },
    const {
      '1': 'checkpointStatus',
      '3': 16,
      '4': 1,
      '5': 9,
      '10': 'checkpointStatus'
    },
    const {
      '1': 'bufferedEvents',
      '3': 17,
      '4': 1,
      '5': 3,
      '10': 'bufferedEvents'
    },
    const {
      '1': 'writePendingEventsBeforeCheckpoint',
      '3': 18,
      '4': 1,
      '5': 5,
      '10': 'writePendingEventsBeforeCheckpoint'
    },
    const {
      '1': 'writePendingEventsAfterCheckpoint',
      '3': 19,
      '4': 1,
      '5': 5,
      '10': 'writePendingEventsAfterCheckpoint'
    },
  ],
};

/// Descriptor for `StatisticsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statisticsRespDescriptor = $convert.base64Decode(
    'Cg5TdGF0aXN0aWNzUmVzcBJQCgdkZXRhaWxzGAEgASgLMjYuZXZlbnRfc3RvcmUuY2xpZW50LnByb2plY3Rpb25zLlN0YXRpc3RpY3NSZXNwLkRldGFpbHNSB2RldGFpbHMahwYKB0RldGFpbHMSLgoSY29yZVByb2Nlc3NpbmdUaW1lGAEgASgDUhJjb3JlUHJvY2Vzc2luZ1RpbWUSGAoHdmVyc2lvbhgCIAEoA1IHdmVyc2lvbhIUCgVlcG9jaBgDIAEoA1IFZXBvY2gSJAoNZWZmZWN0aXZlTmFtZRgEIAEoCVINZWZmZWN0aXZlTmFtZRIqChB3cml0ZXNJblByb2dyZXNzGAUgASgFUhB3cml0ZXNJblByb2dyZXNzEigKD3JlYWRzSW5Qcm9ncmVzcxgGIAEoBVIPcmVhZHNJblByb2dyZXNzEioKEHBhcnRpdGlvbnNDYWNoZWQYByABKAVSEHBhcnRpdGlvbnNDYWNoZWQSFgoGc3RhdHVzGAggASgJUgZzdGF0dXMSIAoLc3RhdGVSZWFzb24YCSABKAlSC3N0YXRlUmVhc29uEhIKBG5hbWUYCiABKAlSBG5hbWUSEgoEbW9kZRgLIAEoCVIEbW9kZRIaCghwb3NpdGlvbhgMIAEoCVIIcG9zaXRpb24SGgoIcHJvZ3Jlc3MYDSABKAJSCHByb2dyZXNzEiYKDmxhc3RDaGVja3BvaW50GA4gASgJUg5sYXN0Q2hlY2twb2ludBJAChtldmVudHNQcm9jZXNzZWRBZnRlclJlc3RhcnQYDyABKANSG2V2ZW50c1Byb2Nlc3NlZEFmdGVyUmVzdGFydBIqChBjaGVja3BvaW50U3RhdHVzGBAgASgJUhBjaGVja3BvaW50U3RhdHVzEiYKDmJ1ZmZlcmVkRXZlbnRzGBEgASgDUg5idWZmZXJlZEV2ZW50cxJOCiJ3cml0ZVBlbmRpbmdFdmVudHNCZWZvcmVDaGVja3BvaW50GBIgASgFUiJ3cml0ZVBlbmRpbmdFdmVudHNCZWZvcmVDaGVja3BvaW50EkwKIXdyaXRlUGVuZGluZ0V2ZW50c0FmdGVyQ2hlY2twb2ludBgTIAEoBVIhd3JpdGVQZW5kaW5nRXZlbnRzQWZ0ZXJDaGVja3BvaW50');
@$core.Deprecated('Use stateReqDescriptor instead')
const StateReq$json = const {
  '1': 'StateReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.StateReq.Options',
      '10': 'options'
    },
  ],
  '3': const [StateReq_Options$json],
};

@$core.Deprecated('Use stateReqDescriptor instead')
const StateReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'partition', '3': 2, '4': 1, '5': 9, '10': 'partition'},
  ],
};

/// Descriptor for `StateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateReqDescriptor = $convert.base64Decode(
    'CghTdGF0ZVJlcRJKCgdvcHRpb25zGAEgASgLMjAuZXZlbnRfc3RvcmUuY2xpZW50LnByb2plY3Rpb25zLlN0YXRlUmVxLk9wdGlvbnNSB29wdGlvbnMaOwoHT3B0aW9ucxISCgRuYW1lGAEgASgJUgRuYW1lEhwKCXBhcnRpdGlvbhgCIAEoCVIJcGFydGl0aW9u');
@$core.Deprecated('Use stateRespDescriptor instead')
const StateResp$json = const {
  '1': 'StateResp',
  '2': const [
    const {
      '1': 'state',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Value',
      '10': 'state'
    },
  ],
};

/// Descriptor for `StateResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateRespDescriptor = $convert.base64Decode(
    'CglTdGF0ZVJlc3ASLAoFc3RhdGUYASABKAsyFi5nb29nbGUucHJvdG9idWYuVmFsdWVSBXN0YXRl');
@$core.Deprecated('Use resultReqDescriptor instead')
const ResultReq$json = const {
  '1': 'ResultReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.ResultReq.Options',
      '10': 'options'
    },
  ],
  '3': const [ResultReq_Options$json],
};

@$core.Deprecated('Use resultReqDescriptor instead')
const ResultReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'partition', '3': 2, '4': 1, '5': 9, '10': 'partition'},
  ],
};

/// Descriptor for `ResultReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultReqDescriptor = $convert.base64Decode(
    'CglSZXN1bHRSZXESSwoHb3B0aW9ucxgBIAEoCzIxLmV2ZW50X3N0b3JlLmNsaWVudC5wcm9qZWN0aW9ucy5SZXN1bHRSZXEuT3B0aW9uc1IHb3B0aW9ucxo7CgdPcHRpb25zEhIKBG5hbWUYASABKAlSBG5hbWUSHAoJcGFydGl0aW9uGAIgASgJUglwYXJ0aXRpb24=');
@$core.Deprecated('Use resultRespDescriptor instead')
const ResultResp$json = const {
  '1': 'ResultResp',
  '2': const [
    const {
      '1': 'result',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Value',
      '10': 'result'
    },
  ],
};

/// Descriptor for `ResultResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultRespDescriptor = $convert.base64Decode(
    'CgpSZXN1bHRSZXNwEi4KBnJlc3VsdBgBIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5WYWx1ZVIGcmVzdWx0');
@$core.Deprecated('Use resetReqDescriptor instead')
const ResetReq$json = const {
  '1': 'ResetReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.ResetReq.Options',
      '10': 'options'
    },
  ],
  '3': const [ResetReq_Options$json],
};

@$core.Deprecated('Use resetReqDescriptor instead')
const ResetReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'write_checkpoint',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'writeCheckpoint'
    },
  ],
};

/// Descriptor for `ResetReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetReqDescriptor = $convert.base64Decode(
    'CghSZXNldFJlcRJKCgdvcHRpb25zGAEgASgLMjAuZXZlbnRfc3RvcmUuY2xpZW50LnByb2plY3Rpb25zLlJlc2V0UmVxLk9wdGlvbnNSB29wdGlvbnMaSAoHT3B0aW9ucxISCgRuYW1lGAEgASgJUgRuYW1lEikKEHdyaXRlX2NoZWNrcG9pbnQYAiABKAhSD3dyaXRlQ2hlY2twb2ludA==');
@$core.Deprecated('Use resetRespDescriptor instead')
const ResetResp$json = const {
  '1': 'ResetResp',
};

/// Descriptor for `ResetResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetRespDescriptor =
    $convert.base64Decode('CglSZXNldFJlc3A=');
@$core.Deprecated('Use enableReqDescriptor instead')
const EnableReq$json = const {
  '1': 'EnableReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.EnableReq.Options',
      '10': 'options'
    },
  ],
  '3': const [EnableReq_Options$json],
};

@$core.Deprecated('Use enableReqDescriptor instead')
const EnableReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `EnableReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enableReqDescriptor = $convert.base64Decode(
    'CglFbmFibGVSZXESSwoHb3B0aW9ucxgBIAEoCzIxLmV2ZW50X3N0b3JlLmNsaWVudC5wcm9qZWN0aW9ucy5FbmFibGVSZXEuT3B0aW9uc1IHb3B0aW9ucxodCgdPcHRpb25zEhIKBG5hbWUYASABKAlSBG5hbWU=');
@$core.Deprecated('Use enableRespDescriptor instead')
const EnableResp$json = const {
  '1': 'EnableResp',
};

/// Descriptor for `EnableResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enableRespDescriptor =
    $convert.base64Decode('CgpFbmFibGVSZXNw');
@$core.Deprecated('Use disableReqDescriptor instead')
const DisableReq$json = const {
  '1': 'DisableReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.projections.DisableReq.Options',
      '10': 'options'
    },
  ],
  '3': const [DisableReq_Options$json],
};

@$core.Deprecated('Use disableReqDescriptor instead')
const DisableReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'write_checkpoint',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'writeCheckpoint'
    },
  ],
};

/// Descriptor for `DisableReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disableReqDescriptor = $convert.base64Decode(
    'CgpEaXNhYmxlUmVxEkwKB29wdGlvbnMYASABKAsyMi5ldmVudF9zdG9yZS5jbGllbnQucHJvamVjdGlvbnMuRGlzYWJsZVJlcS5PcHRpb25zUgdvcHRpb25zGkgKB09wdGlvbnMSEgoEbmFtZRgBIAEoCVIEbmFtZRIpChB3cml0ZV9jaGVja3BvaW50GAIgASgIUg93cml0ZUNoZWNrcG9pbnQ=');
@$core.Deprecated('Use disableRespDescriptor instead')
const DisableResp$json = const {
  '1': 'DisableResp',
};

/// Descriptor for `DisableResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disableRespDescriptor =
    $convert.base64Decode('CgtEaXNhYmxlUmVzcA==');
