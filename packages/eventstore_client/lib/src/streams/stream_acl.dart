import 'package:collection/collection.dart';
import 'package:eventstore_client/eventstore_client.dart';

/// Represents an access control list for a stream
class StreamAcl {
  /// Creates an [StreamAcl] instance
  StreamAcl({
    List<String>? readRoles,
    List<String>? writeRoles,
    List<String>? deleteRoles,
    List<String>? metaReadRoles,
    List<String>? metaWriteRoles,
  })  : readRoles = UnmodifiableListView<String>(readRoles ?? []),
        writeRoles = UnmodifiableListView<String>(writeRoles ?? []),
        deleteRoles = UnmodifiableListView<String>(deleteRoles ?? []),
        metaReadRoles = UnmodifiableListView<String>(metaReadRoles ?? []),
        metaWriteRoles = UnmodifiableListView<String>(metaWriteRoles ?? []);

  /// Roles and users permitted to read the stream
  final UnmodifiableListView<String> readRoles;

  /// Roles and users permitted to write to the stream
  final UnmodifiableListView<String> writeRoles;

  /// Roles and users permitted to delete the stream
  final UnmodifiableListView<String> deleteRoles;

  /// Roles and users permitted to read stream metadata
  final UnmodifiableListView<String> metaReadRoles;

  /// Roles and users permitted to write stream metadata
  final UnmodifiableListView<String> metaWriteRoles;

  JsonDocument toJson() => <String, dynamic>{
        SystemMetadata.AclRead: readRoles,
        SystemMetadata.AclWrite: writeRoles,
        SystemMetadata.AclDelete: deleteRoles,
        SystemMetadata.AclMetaRead: metaReadRoles,
        SystemMetadata.AclMetaWrite: metaWriteRoles,
      };

  @override
  bool operator ==(Object other) {
    final eq = ListEquality<String>().equals;
    return identical(this, other) ||
        other is StreamAcl &&
            runtimeType == other.runtimeType &&
            eq(readRoles, other.readRoles) &&
            eq(writeRoles, other.writeRoles) &&
            eq(deleteRoles, other.deleteRoles) &&
            eq(metaReadRoles, other.metaReadRoles) &&
            eq(metaWriteRoles, other.metaWriteRoles);
  }

  @override
  int get hashCode =>
      readRoles.hashCode ^
      writeRoles.hashCode ^
      deleteRoles.hashCode ^
      metaReadRoles.hashCode ^
      metaWriteRoles.hashCode;

  @override
  String toString() {
    return 'StreamAcl{readRoles: $readRoles, writeRoles: $writeRoles, '
        'deleteRoles: $deleteRoles, metaReadRoles: $metaReadRoles, '
        'metaWriteRoles: $metaWriteRoles}';
  }
}
