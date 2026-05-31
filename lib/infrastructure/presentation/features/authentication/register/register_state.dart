import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';

import '../../../../../domain/entities/errors/authentication_error.dart';

class RegisterState with ChangeNotifier {
  /// Defines the loading state of Register Screen
  var loading = false;

  /// Defines if the request returned an error
  AuthenticationError? error;

  /// Name field controller
  final nameController = TextEditingController();

  /// Email field controller
  final emailController = TextEditingController();

  /// Password field controller
  final passwordController = TextEditingController();

  /// Name field node
  final nameNode = FocusNode();

  /// Email field node
  final emailNode = FocusNode();

  /// Password field node
  final passwordNode = FocusNode();

  /// Attempts to register the user with the given credentials
  Future<void> attemptRegister() async {
    loading = true;
    error = null;
    notifyListeners();

    final credentials = UserCredentials(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    final response = await authenticationUseCase.attemptRegister(credentials);
    if (response is Failure<void, AuthenticationError>) {
      error = response.error;
    }

    loading = false;
    notifyListeners();
  }
}
