import 'dart:convert';

class UserCredentials {
  const UserCredentials(this.username, this.password);

  static const Empty = UserCredentials('', '');

  /// Get credential username
  final String username;

  /// Get credential password
  final String password;

  /// Check if credentials is empty
  bool get isEmpty => !isBasicAuth;

  /// Check if basic authentication should be used
  bool get isBasicAuth =>
      username.isNotEmpty == true && password.isNotEmpty == true;

  @override
  String toString() {
    return isBasicAuth
        ? 'Basic ${base64Encode(utf8.encode('$username:$password'))}'
        : '';
  }

  static UserCredentials? from(Map<String, String> userInfo) {
    if (userInfo.containsKey('username') && userInfo.containsKey('password')) {
      return UserCredentials(
        userInfo['username']!,
        userInfo['password']!,
      );
    }
    return null;
  }
}
