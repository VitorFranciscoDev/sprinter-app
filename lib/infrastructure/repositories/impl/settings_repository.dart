import 'dart:ui';

import 'package:flutter/src/material/theme_data.dart';
import 'package:sprinter/infrastructure/repositories/settings.dart';
import 'package:sprinter/infrastructure/storage/keys.dart';
import 'package:sprinter/infrastructure/storage/storage.dart';

SettingsRepository newSettingsRepository(AppStorage storage) {
  return _SettingsRepository(storage);
}

class _SettingsRepository implements SettingsRepository {
  const _SettingsRepository(this._storage);

  final AppStorage _storage;

  @override
  Future<Locale> getLanguage() async {
    final languageCode = await _storage.readString(StorageKeys.languageKey);
    return Locale(languageCode ?? 'us');
  }

  @override
  Future<void> updateLanguage(Locale locale) async {
    await _storage.writeString(key: StorageKeys.languageKey, value: '');
  }

  @override
  Future<ThemeData> getTheme() async {
    final theme = await _storage.readString(StorageKeys.languageKey);
    return ThemeData();
  }

  @override
  Future<void> updateTheme(ThemeData theme) {
    // TODO: implement updateTheme
    throw UnimplementedError();
  }
}
