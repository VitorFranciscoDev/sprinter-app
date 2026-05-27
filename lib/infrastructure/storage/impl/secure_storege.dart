import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import '../storage_interface.dart';

class SecureStorage implements AppStorage {
  final _storage = const FlutterSecureStorage();

  @override
  Future<String?> readString(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<Map<String, dynamic>?> readJSON(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;
    return jsonDecode(value) as Map<String, dynamic>;
  }

  @override
  Future<void> writeString({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<void> writeJSON<T>({required String key, required T value}) async {
    await _storage.write(key: key, value: jsonEncode(value));
  }

  @override
  Future<void> deleteString(String key) async {
    await _storage.delete(key: key);
  }
}