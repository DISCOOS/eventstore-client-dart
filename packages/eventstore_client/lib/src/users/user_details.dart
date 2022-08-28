class UserDetails {
  String loginName;

  UserDetails({
    required this.loginName,
    required this.fullName,
    required this.isDisabled,
    required this.lastUpdated,
    this.groups = const [],
  });

  String fullName;
  List<String> groups;
  DateTime lastUpdated;
  bool isDisabled;
}
