import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';

import '../../../../../domain/entities/errors/authentication_error.dart';

class RegisterState with ChangeNotifier {
  /// Defines the loading state of Register Screen
  var loading = false;

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
  Future<Result<void, AuthenticationError>> attemptRegister() async {
    loading = true;
    notifyListeners();

    final credentials = UserCredentials(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    try {
      return await authenticationUseCase.attemptRegister(credentials);
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
