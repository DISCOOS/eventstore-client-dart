import 'member_info.dart';

class ClusterInfo {
  ClusterInfo(
    Iterable<MemberInfo> members,
  ) : members = List.unmodifiable(members);

  final List<MemberInfo> members;
}
