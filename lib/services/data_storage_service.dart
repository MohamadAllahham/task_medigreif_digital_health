import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_medigreif_digital_health/models/user/user.dart';

class DataStorageService {
  static const _key = 'user';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_key, userJson);
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_key);
    if (userJson == null) return null;
    return User.fromJson(jsonDecode(userJson));
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}