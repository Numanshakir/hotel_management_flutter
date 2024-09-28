

import 'storage.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  /// __________ Dark Theme __________ ///
  bool getIsDarkTheme() {
    return _preferences.getBool('theme') ?? false;
  }

  String ? getToken() {
    return _preferences.getString('token') ;
  }

  void setToken(String token) {
    _preferences.setString('token', token);

  }
  String ? getRefreshToken() {
    return _preferences.getString('refreshToken');
  }

  void setRefreshToken(String refresh) {
    _preferences.setString('refreshToken', refresh);
  }

  void setDarkTheme(bool isDark) {
    _preferences.setBool('theme', isDark);
  }
}
