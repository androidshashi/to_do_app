import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils{
   static const String _KEY_IS_LOGGED_IN = "IS_LOGGED_IN";

  
  static Future<bool> isLoggedIn() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_KEY_IS_LOGGED_IN) ?? false;
  }

  static Future<void> setLoggedIn() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_KEY_IS_LOGGED_IN, true);
  }

  static Future<bool> logout() async {
    // Obtain shared preferences.
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_KEY_IS_LOGGED_IN, false);
      return true;
    } catch(ex){
      return false;
    }
  }
}