

class UrlPath {
  static const String baseUrl = '';

  static const String _auth = '${baseUrl}auth/';
  static const String _users = '${baseUrl}users/';
  static const String login = '${_auth}login/';
  static const String register = '${_auth}register/';
  static const String getInfo = '${_users}getInfo/';
  static const String editInfo = '${_users}editInfo/';



}

class Keys {
  static const String token = 'token';
  static const String userIsLogin = 'user_is_login';
  static const String userIsFirst = 'userIsFirst';
  static const String deviceModel = 'deviceModel';

}
