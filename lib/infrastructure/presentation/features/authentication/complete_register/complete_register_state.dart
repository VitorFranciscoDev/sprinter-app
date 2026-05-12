import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/errors/authentication_error.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';

class RegisterState with ChangeNotifier {
  /// Defines the loading state of Register Screen
  var loading = false;

  /// Defines if the request returned an error
  AuthenticationError? error;

  /// Profile image url
  final String imageUrl = "";

  /// Username field controller
  final usernameController = TextEditingController();

  /// biography field controller
  final biographyController = TextEditingController();

  /// Username field node
  final usernameNode = FocusNode();

  /// Biography field node
  final biographyNode = FocusNode();

  /// Attempts to register the user with the given credentials
  Future<void> attemptCompleteRegister() async {
    loading = true;
    error = null;
    notifyListeners();

   final information = UserInformation(
    username: usernameController.text,
    biography: biographyController.text,
    imageBytes: imageUrl);

    final response = await authenticationUseCase.completeRegister(information);
    if (response is Failure<void, AuthenticationError>) {
      error = response.error;
    }

    loading = false;
    notifyListeners();
  }
}
