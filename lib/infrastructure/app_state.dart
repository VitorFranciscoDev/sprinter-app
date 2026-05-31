import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/enums/language.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';
import 'package:sprinter/infrastructure/storage/impl/shared_preferences_storage.dart';
import 'package:sprinter/infrastructure/storage/keys.dart';

/// Represents the application state
class AppState with ChangeNotifier {
  /// Standard constructor
  AppState();

  /// The user of the app
  User? user;

  /// The user's preferred language
  var language = Language.english;

  /// The user's preferred theme mode
  var theme = ThemeMode.system;

  /// Defines the loading state
  var loading = false;

  /// Initialize the app state
  Future<void> initialize() async {
    loading = true;
    notifyListeners();

    final userJSON = await secureStorage.readJSON(StorageKeys.userKey);
    if (userJSON != null) {
      user = User.fromJSON(userJSON);
    }

    // Load language preference
    final languageString = await sharedPreferencesStorage.readString(
      StorageKeys.languageKey,
    );
    if (languageString != null) {
      language = Language.values.firstWhere(
        (lang) => lang.name == languageString,
        orElse: () => Language.english,
      );
    }

    // Load theme preference
    final themeString = await sharedPreferencesStorage.readString(
      StorageKeys.themeKey,
    );
    if (themeString != null) {
      theme = ThemeMode.values.firstWhere(
        (t) => t.name == themeString,
        orElse: () => ThemeMode.system,
      );
    }

    loading = false;
    notifyListeners();
  }

  /// Saves the user data to storage
  Future<void> saveUser(User newUser) async {
    user = newUser;
    await secureStorage.writeJSON<Map<String, dynamic>>(
      key: StorageKeys.userKey,
      value: newUser.toJSON(),
    );
    notifyListeners();
  }

  /// Saves the language preference to storage
  Future<void> saveLanguage(Language newLanguage) async {
    language = newLanguage;
    await sharedPreferencesStorage.writeString(
      key: StorageKeys.languageKey,
      value: newLanguage.name,
    );
    notifyListeners();
  }

  /// Saves the theme preference to storage
  Future<void> saveTheme(ThemeMode newTheme) async {
    theme = newTheme;
    await sharedPreferencesStorage.writeString(
      key: StorageKeys.themeKey,
      value: newTheme.name,
    );
    notifyListeners();
  }

  /// Clears user data from storage and state
  Future<void> logout() async {
    user = null;
    await secureStorage.deleteString(StorageKeys.currentUser);
    notifyListeners();
  }
}
