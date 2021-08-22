import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/helpers.dart';
import 'package:uuid/uuid.dart';

class MemberInfo {
  MemberInfo({
    required this.isAlive,
    required this.uuid,
    required this.state,
    required this.endPoint,
  });

  final bool isAlive;
  final UuidValue uuid;
  final VNodeState state;
  final EndPoint endPoint;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberInfo &&
          runtimeType == other.runtimeType &&
          isAlive == other.isAlive &&
          uuid == other.uuid &&
          state == other.state &&
          endPoint == other.endPoint;

  @override
  int get hashCode =>
      isAlive.hashCode ^ uuid.hashCode ^ state.hashCode ^ endPoint.hashCode;

  @override
  String toString() {
    return '$runtimeType{state: ${enumName(state)}, endPoint: $endPoint, isAlive: $isAlive, uuid: $uuid}';
  }
}
