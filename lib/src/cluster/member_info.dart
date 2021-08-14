import 'package:eventstore_client_dart/eventstore_client_dart.dart';
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
}
