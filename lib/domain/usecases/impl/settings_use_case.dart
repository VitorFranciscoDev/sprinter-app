import 'dart:ui';

import 'package:flutter/src/material/theme_data.dart';
import 'package:sprinter/domain/usecases/settings.dart';
import 'package:sprinter/infrastructure/repositories/settings.dart';

SettingsUseCase newSettingsUseCase(SettingsRepository repository) {
  return _SettingsUseCase(repository);
}

class _SettingsUseCase implements SettingsUseCase {
  const _SettingsUseCase(this._repository);

  final SettingsRepository _repository;

  @override
  Future<Locale> getLanguage() async {
    return await _repository.getLanguage();
  }

  @override
  Future<void> updateLanguage(Locale locale) async {
    return await _repository.updateLanguage(locale);
  }

  @override
  Future<ThemeData> getTheme() async {
    return await _repository.getTheme();
  }

  @override
  Future<void> updateTheme(ThemeData theme) async {
    return await _repository.updateTheme(theme);
  }
}
