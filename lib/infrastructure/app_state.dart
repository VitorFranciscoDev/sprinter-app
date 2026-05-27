import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/enums/language.dart';
import 'package:sprinter/infrastructure/storage/impl/shared_preferences_storage.dart';

/// Represents the application state
class AppState with ChangeNotifier {
  /// Standard constructor
  AppState({SharedPreferencesStorage? storage})
      : _storage = storage ?? SharedPreferencesStorage();

  final SharedPreferencesStorage _storage;

  /// Storage keys
  static const _userKey = 'app_user';
  static const _languageKey = 'app_language';
  static const _themeKey = 'app_theme';

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

    try {
      // Load user data
      final userJSON = await _storage.readJSON(_userKey);
      if (userJSON != null) {
        user = User.fromJSON(userJSON);
      }

      // Load language preference
      final languageString = await _storage.readString(_languageKey);
      if (languageString != null) {
        language = Language.values.firstWhere(
          (lang) => lang.name == languageString,
          orElse: () => Language.english,
        );
      }

      // Load theme preference
      final themeString = await _storage.readString(_themeKey);
      if (themeString != null) {
        theme = ThemeMode.values.firstWhere(
          (t) => t.name == themeString,
          orElse: () => ThemeMode.system,
        );
      }
    } catch (e) {
      print('Error initializing app state: $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  /// Saves the user data to storage
  Future<void> saveUser(User newUser) async {
    user = newUser;
    await _storage.writeJSON<Map<String, dynamic>>(
      key: _userKey,
      value: _userToMap(newUser),
    );
    notifyListeners();
  }

  /// Saves the language preference to storage
  Future<void> saveLanguage(Language newLanguage) async {
    language = newLanguage;
    await _storage.writeString(
      key: _languageKey,
      value: newLanguage.name,
    );
    notifyListeners();
  }

  /// Saves the theme preference to storage
  Future<void> saveTheme(ThemeMode newTheme) async {
    theme = newTheme;
    await _storage.writeString(
      key: _themeKey,
      value: newTheme.name,
    );
    notifyListeners();
  }

  /// Clears user data from storage and state
  Future<void> logout() async {
    user = null;
    await _storage.deleteString(_userKey);
    notifyListeners();
  }

  /// Converts User to Map for JSON serialization
  Map<String, dynamic> _userToMap(User user) {
    return {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'username': user.username,
      'biography': user.biography,
      'imageURL': user.imageURL,
    };
  }
}