import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_settings.dart';

/// Defines the interface for managing settings.
abstract class SettingsUseCase {
  /// Updates the language preference.
  Future<void> updateLanguage(Locale locale);

  /// Get the saved language preference.
  Future<Locale> getLanguage();

  /// Updates the theme preference.
  Future<void> updateTheme(ThemeData theme);

  /// Get the saved theme preference.
  Future<ThemeData> getTheme();
}
