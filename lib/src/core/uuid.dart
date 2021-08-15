import 'dart:convert';

import 'package:eventstore_client_dart/src/generated/shared.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:uuid/uuid.dart';

/// An RFC-4122 compliant v4 UUID.
class UuidV4 {
  const UuidV4(this.value);

  /// Represents the empty (00000000-0000-0000-0000-000000000000) v4 UUID
  static final Empty = UuidV4(UuidValue(
    '00000000-0000-0000-0000-000000000000',
  ));

  final UuidValue value;

  /// Creates a new, randomized v4 UUID
  factory UuidV4.newUuid() {
    final uuid = Uuid().v4();
    return UuidV4(UuidValue(uuid));
  }

  /// Creates a new v4 UUID from UUID
  factory UuidV4.fromDTO(UUID dto) {
    switch (dto.whichValue()) {
      case UUID_Value.structured:
        return UuidV4.fromInt64(
          dto.structured.mostSignificantBits,
          dto.structured.leastSignificantBits,
        );
      case UUID_Value.string:
        return UuidV4.fromString(dto.string);
      case UUID_Value.notSet:
        return UuidV4.Empty;
    }
  }

  /// Creates a new v4 UUID from given uuid
  factory UuidV4.fromString(String uuid) {
    return UuidV4(toValue(uuid));
  }

  /// Creates a new v4 UUID from most and least significant bits
  factory UuidV4.fromInt64(Int64 msb, Int64 lsb) {
    final bytes = msb.toBytes() + lsb.toBytes();
    final uuid = Uuid.unparse(bytes);
    return UuidV4(toValue(uuid));
  }

  /// Creates a new [UuidValue] from string
  static UuidValue toValue(String uuid) => UuidValue(uuid, false);
}
