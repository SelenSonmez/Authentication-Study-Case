import 'package:shared_preferences/shared_preferences.dart';

//Controller for setting and getin token  from shared preferences
class TokenPreferenceController {
  static Future<String?> getToken() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  static Future<bool> setToken(String token) async {
    var pref = await SharedPreferences.getInstance();
    return pref.setString("token", token);
  }
}
