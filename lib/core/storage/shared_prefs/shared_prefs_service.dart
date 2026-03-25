import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/app_constants.dart';

@lazySingleton
class SharedPrefsService {
  final SharedPreferences prefs;

  SharedPrefsService(this.prefs);

  String? getAccessToken() {
    return prefs.getString(AppConstants.accessTokenKey);
  }

  Future<void> setAccessToken(String token) {
    return prefs.setString(AppConstants.accessTokenKey, token);
  }

  String? getRefreshToken() {
    return prefs.getString(AppConstants.refreshTokenKey);
  }

  Future<void> setRefreshToken(String token) {
    return prefs.setString(AppConstants.refreshTokenKey, token);
  }

  Future<void> clear() async {
    await prefs.clear();
  }
}
