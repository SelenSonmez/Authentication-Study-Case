import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static Future<String?> getToken() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  static Future<bool> setToken(String token) async {
    var pref = await SharedPreferences.getInstance();
    return pref.setString("token", token);
  }
}
