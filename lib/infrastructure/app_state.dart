import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/enums/language.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';
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

    loading = false;
    notifyListeners();
  }
}
