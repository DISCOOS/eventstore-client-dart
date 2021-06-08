///
//  Generated code. Do not modify.
//  source: users.proto
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
      '6': '.event_store.client.users.CreateReq.Options',
      '10': 'options'
    },
  ],
  '3': const [CreateReq_Options$json],
};

@$core.Deprecated('Use createReqDescriptor instead')
const CreateReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'login_name', '3': 1, '4': 1, '5': 9, '10': 'loginName'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'full_name', '3': 3, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'groups', '3': 4, '4': 3, '5': 9, '10': 'groups'},
  ],
};

/// Descriptor for `CreateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReqDescriptor = $convert.base64Decode(
    'CglDcmVhdGVSZXESRQoHb3B0aW9ucxgBIAEoCzIrLmV2ZW50X3N0b3JlLmNsaWVudC51c2Vycy5DcmVhdGVSZXEuT3B0aW9uc1IHb3B0aW9ucxp5CgdPcHRpb25zEh0KCmxvZ2luX25hbWUYASABKAlSCWxvZ2luTmFtZRIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSGwoJZnVsbF9uYW1lGAMgASgJUghmdWxsTmFtZRIWCgZncm91cHMYBCADKAlSBmdyb3Vwcw==');
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
      '6': '.event_store.client.users.UpdateReq.Options',
      '10': 'options'
    },
  ],
  '3': const [UpdateReq_Options$json],
};

@$core.Deprecated('Use updateReqDescriptor instead')
const UpdateReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'login_name', '3': 1, '4': 1, '5': 9, '10': 'loginName'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'full_name', '3': 3, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'groups', '3': 4, '4': 3, '5': 9, '10': 'groups'},
  ],
};

/// Descriptor for `UpdateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateReqDescriptor = $convert.base64Decode(
    'CglVcGRhdGVSZXESRQoHb3B0aW9ucxgBIAEoCzIrLmV2ZW50X3N0b3JlLmNsaWVudC51c2Vycy5VcGRhdGVSZXEuT3B0aW9uc1IHb3B0aW9ucxp5CgdPcHRpb25zEh0KCmxvZ2luX25hbWUYASABKAlSCWxvZ2luTmFtZRIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSGwoJZnVsbF9uYW1lGAMgASgJUghmdWxsTmFtZRIWCgZncm91cHMYBCADKAlSBmdyb3Vwcw==');
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
      '6': '.event_store.client.users.DeleteReq.Options',
      '10': 'options'
    },
  ],
  '3': const [DeleteReq_Options$json],
};

@$core.Deprecated('Use deleteReqDescriptor instead')
const DeleteReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'login_name', '3': 1, '4': 1, '5': 9, '10': 'loginName'},
  ],
};

/// Descriptor for `DeleteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteReqDescriptor = $convert.base64Decode(
    'CglEZWxldGVSZXESRQoHb3B0aW9ucxgBIAEoCzIrLmV2ZW50X3N0b3JlLmNsaWVudC51c2Vycy5EZWxldGVSZXEuT3B0aW9uc1IHb3B0aW9ucxooCgdPcHRpb25zEh0KCmxvZ2luX25hbWUYASABKAlSCWxvZ2luTmFtZQ==');
@$core.Deprecated('Use deleteRespDescriptor instead')
const DeleteResp$json = const {
  '1': 'DeleteResp',
};

/// Descriptor for `DeleteResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRespDescriptor =
    $convert.base64Decode('CgpEZWxldGVSZXNw');
@$core.Deprecated('Use enableReqDescriptor instead')
const EnableReq$json = const {
  '1': 'EnableReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.users.EnableReq.Options',
      '10': 'options'
    },
  ],
  '3': const [EnableReq_Options$json],
};

@$core.Deprecated('Use enableReqDescriptor instead')
const EnableReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'login_name', '3': 1, '4': 1, '5': 9, '10': 'loginName'},
  ],
};

/// Descriptor for `EnableReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enableReqDescriptor = $convert.base64Decode(
    'CglFbmFibGVSZXESRQoHb3B0aW9ucxgBIAEoCzIrLmV2ZW50X3N0b3JlLmNsaWVudC51c2Vycy5FbmFibGVSZXEuT3B0aW9uc1IHb3B0aW9ucxooCgdPcHRpb25zEh0KCmxvZ2luX25hbWUYASABKAlSCWxvZ2luTmFtZQ==');
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
      '6': '.event_store.client.users.DisableReq.Options',
      '10': 'options'
    },
  ],
  '3': const [DisableReq_Options$json],
};

@$core.Deprecated('Use disableReqDescriptor instead')
const DisableReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'login_name', '3': 1, '4': 1, '5': 9, '10': 'loginName'},
  ],
};

/// Descriptor for `DisableReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disableReqDescriptor = $convert.base64Decode(
    'CgpEaXNhYmxlUmVxEkYKB29wdGlvbnMYASABKAsyLC5ldmVudF9zdG9yZS5jbGllbnQudXNlcnMuRGlzYWJsZVJlcS5PcHRpb25zUgdvcHRpb25zGigKB09wdGlvbnMSHQoKbG9naW5fbmFtZRgBIAEoCVIJbG9naW5OYW1l');
@$core.Deprecated('Use disableRespDescriptor instead')
const DisableResp$json = const {
  '1': 'DisableResp',
};

/// Descriptor for `DisableResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disableRespDescriptor =
    $convert.base64Decode('CgtEaXNhYmxlUmVzcA==');
@$core.Deprecated('Use detailsReqDescriptor instead')
const DetailsReq$json = const {
  '1': 'DetailsReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.users.DetailsReq.Options',
      '10': 'options'
    },
  ],
  '3': const [DetailsReq_Options$json],
};

@$core.Deprecated('Use detailsReqDescriptor instead')
const DetailsReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'login_name', '3': 1, '4': 1, '5': 9, '10': 'loginName'},
  ],
};

/// Descriptor for `DetailsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailsReqDescriptor = $convert.base64Decode(
    'CgpEZXRhaWxzUmVxEkYKB29wdGlvbnMYASABKAsyLC5ldmVudF9zdG9yZS5jbGllbnQudXNlcnMuRGV0YWlsc1JlcS5PcHRpb25zUgdvcHRpb25zGigKB09wdGlvbnMSHQoKbG9naW5fbmFtZRgBIAEoCVIJbG9naW5OYW1l');
@$core.Deprecated('Use detailsRespDescriptor instead')
const DetailsResp$json = const {
  '1': 'DetailsResp',
  '2': const [
    const {
      '1': 'user_details',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.users.DetailsResp.UserDetails',
      '10': 'userDetails'
    },
  ],
  '3': const [DetailsResp_UserDetails$json],
};

@$core.Deprecated('Use detailsRespDescriptor instead')
const DetailsResp_UserDetails$json = const {
  '1': 'UserDetails',
  '2': const [
    const {'1': 'login_name', '3': 1, '4': 1, '5': 9, '10': 'loginName'},
    const {'1': 'full_name', '3': 2, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'groups', '3': 3, '4': 3, '5': 9, '10': 'groups'},
    const {
      '1': 'last_updated',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.users.DetailsResp.UserDetails.DateTime',
      '10': 'lastUpdated'
    },
    const {'1': 'disabled', '3': 5, '4': 1, '5': 8, '10': 'disabled'},
  ],
  '3': const [DetailsResp_UserDetails_DateTime$json],
};

@$core.Deprecated('Use detailsRespDescriptor instead')
const DetailsResp_UserDetails_DateTime$json = const {
  '1': 'DateTime',
  '2': const [
    const {
      '1': 'ticks_since_epoch',
      '3': 1,
      '4': 1,
      '5': 3,
      '10': 'ticksSinceEpoch'
    },
  ],
};

/// Descriptor for `DetailsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detailsRespDescriptor = $convert.base64Decode(
    'CgtEZXRhaWxzUmVzcBJUCgx1c2VyX2RldGFpbHMYASABKAsyMS5ldmVudF9zdG9yZS5jbGllbnQudXNlcnMuRGV0YWlsc1Jlc3AuVXNlckRldGFpbHNSC3VzZXJEZXRhaWxzGpQCCgtVc2VyRGV0YWlscxIdCgpsb2dpbl9uYW1lGAEgASgJUglsb2dpbk5hbWUSGwoJZnVsbF9uYW1lGAIgASgJUghmdWxsTmFtZRIWCgZncm91cHMYAyADKAlSBmdyb3VwcxJdCgxsYXN0X3VwZGF0ZWQYBCABKAsyOi5ldmVudF9zdG9yZS5jbGllbnQudXNlcnMuRGV0YWlsc1Jlc3AuVXNlckRldGFpbHMuRGF0ZVRpbWVSC2xhc3RVcGRhdGVkEhoKCGRpc2FibGVkGAUgASgIUghkaXNhYmxlZBo2CghEYXRlVGltZRIqChF0aWNrc19zaW5jZV9lcG9jaBgBIAEoA1IPdGlja3NTaW5jZUVwb2No');
@$core.Deprecated('Use changePasswordReqDescriptor instead')
const ChangePasswordReq$json = const {
  '1': 'ChangePasswordReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.users.ChangePasswordReq.Options',
      '10': 'options'
    },
  ],
  '3': const [ChangePasswordReq_Options$json],
};

@$core.Deprecated('Use changePasswordReqDescriptor instead')
const ChangePasswordReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'login_name', '3': 1, '4': 1, '5': 9, '10': 'loginName'},
    const {
      '1': 'current_password',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'currentPassword'
    },
    const {'1': 'new_password', '3': 3, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `ChangePasswordReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordReqDescriptor = $convert.base64Decode(
    'ChFDaGFuZ2VQYXNzd29yZFJlcRJNCgdvcHRpb25zGAEgASgLMjMuZXZlbnRfc3RvcmUuY2xpZW50LnVzZXJzLkNoYW5nZVBhc3N3b3JkUmVxLk9wdGlvbnNSB29wdGlvbnMadgoHT3B0aW9ucxIdCgpsb2dpbl9uYW1lGAEgASgJUglsb2dpbk5hbWUSKQoQY3VycmVudF9wYXNzd29yZBgCIAEoCVIPY3VycmVudFBhc3N3b3JkEiEKDG5ld19wYXNzd29yZBgDIAEoCVILbmV3UGFzc3dvcmQ=');
@$core.Deprecated('Use changePasswordRespDescriptor instead')
const ChangePasswordResp$json = const {
  '1': 'ChangePasswordResp',
};

/// Descriptor for `ChangePasswordResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordRespDescriptor =
    $convert.base64Decode('ChJDaGFuZ2VQYXNzd29yZFJlc3A=');
@$core.Deprecated('Use resetPasswordReqDescriptor instead')
const ResetPasswordReq$json = const {
  '1': 'ResetPasswordReq',
  '2': const [
    const {
      '1': 'options',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.event_store.client.users.ResetPasswordReq.Options',
      '10': 'options'
    },
  ],
  '3': const [ResetPasswordReq_Options$json],
};

@$core.Deprecated('Use resetPasswordReqDescriptor instead')
const ResetPasswordReq_Options$json = const {
  '1': 'Options',
  '2': const [
    const {'1': 'login_name', '3': 1, '4': 1, '5': 9, '10': 'loginName'},
    const {'1': 'new_password', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `ResetPasswordReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordReqDescriptor = $convert.base64Decode(
    'ChBSZXNldFBhc3N3b3JkUmVxEkwKB29wdGlvbnMYASABKAsyMi5ldmVudF9zdG9yZS5jbGllbnQudXNlcnMuUmVzZXRQYXNzd29yZFJlcS5PcHRpb25zUgdvcHRpb25zGksKB09wdGlvbnMSHQoKbG9naW5fbmFtZRgBIAEoCVIJbG9naW5OYW1lEiEKDG5ld19wYXNzd29yZBgCIAEoCVILbmV3UGFzc3dvcmQ=');
@$core.Deprecated('Use resetPasswordRespDescriptor instead')
const ResetPasswordResp$json = const {
  '1': 'ResetPasswordResp',
};

/// Descriptor for `ResetPasswordResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordRespDescriptor =
    $convert.base64Decode('ChFSZXNldFBhc3N3b3JkUmVzcA==');
