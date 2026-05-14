import 'package:flutter/foundation.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/enums/language.dart';
import 'package:sprinter/domain/enums/theme.dart';

/// Represents the application state
class AppState with ChangeNotifier {
  /// Standard constructor
  AppState();

  /// The user of the app
  User? user;

  /// Auth token of the user
  String? token;

  /// The user's preferred language
  var language = Language.english;

  /// The user's preferred theme mode
  var theme = Theme.system;

  /// Defines the loading state
  var loading = false;

  /// Initialize the app state
  Future<void> initialize() async {

  }
}