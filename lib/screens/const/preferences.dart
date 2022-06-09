import 'package:shared_preferences/shared_preferences.dart';

class MyPrefferences {
  static const myKey = 'myKey';

  Future<void> setString(String key, String value) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setString(key, value);
  }
}
