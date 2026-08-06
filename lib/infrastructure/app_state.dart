import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/user_error.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';

import '../domain/entities/entity_settings.dart';

/// Represents the application state.
class AppState with ChangeNotifier {
  /// Standard constructor.
  AppState() {
    _initialize();
  }

  /// The user of the app.
  User? user;

  /// The user's preferred language.
  var language = Language.english;

  /// The user's preferred theme mode.
  var theme = ThemeMode.system;

  /// Defines the loading state.
  var loading = false;

  /// Initialize the app state.
  Future<void> _initialize() async {
    loading = true;
    notifyListeners();

    final result = await userUseCase.getUserInformation();
    if (result is Success<User, UserError>) {
      user = result.value;
    }

    loading = false;
    notifyListeners();
  }
}
