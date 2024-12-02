import 'package:shared_preferences/shared_preferences.dart';

class SharedHandler {
  static final SharedHandler _instance = SharedHandler._internal();
  late final SharedPreferences? _preferences;

  SharedHandler._internal();

  static SharedHandler get instance => _instance;

   static Future<void>  init() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  Future<void> setData(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  String? readData(String key) {
    return _preferences?.getString(key);
  }
}
