import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/errors/authentication_error.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';

class LoginState with ChangeNotifier {
  /// Defines the loading state of Login Screen
  var loading = false;

  /// Defines if the request returned an error
  AuthenticationError? error;

  /// Email field controller
  final emailController = TextEditingController();

  /// Password field controller
  final passwordController = TextEditingController();

  /// Email field node
  final emailNode = FocusNode();

  /// Password field node
  final passwordNode = FocusNode();

  Future<void> attemptLogin() async {
    loading = true;
    error = null;
    notifyListeners();

    final credentials = UserCredentials(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    final response = await authenticationUseCase.attemptLogin(
      credentials,
    );
    if (response is Failure<void, AuthenticationError>) {
      error = response.error;
    }

    loading = false;
    notifyListeners();
  }
}
