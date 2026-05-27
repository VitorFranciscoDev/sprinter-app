import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../storage_interface.dart';

/// Implementation of AppStorage using SharedPreferences
class SharedPreferencesStorage implements AppStorage {
  @override
  Future<String?> readString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<Map<String, dynamic>?> readJSON(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    if (value == null) return null;
    return jsonDecode(value) as Map<String, dynamic>;
  }

  @override
  Future<void> writeString({required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Future<void> writeJSON<T>({required String key, required T value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(value));
  }

  @override
  Future<void> deleteString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
