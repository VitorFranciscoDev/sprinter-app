import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';

import '../../../../../domain/entities/errors/authentication_error.dart';

/// Represents the state for the login screen.
class LoginState with ChangeNotifier {
  /// Defines the loading state of Login Screen.
  var loading = false;

  /// Email field controller.
  final emailController = TextEditingController();

  /// Password field controller.
  final passwordController = TextEditingController();

  /// Email field node.
  final emailNode = FocusNode();

  /// Password field node.
  final passwordNode = FocusNode();

  /// Attempts to log in the application with the given credentials.
  Future<Result<void, AuthenticationError>> attemptLogin() async {
    loading = true;
    notifyListeners();

    final credentials = UserCredentials(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    try {
      return await authenticationUseCase.attemptLogin(credentials);
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
