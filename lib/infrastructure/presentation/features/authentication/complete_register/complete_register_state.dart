import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';

import '../../../../../domain/entities/errors/authentication_error.dart';

class CompleteRegisterState with ChangeNotifier {
  /// Defines the loading state of Register Screen
  var loading = false;

  /// Defines if the request returned an error
  AuthenticationError? error;

  /// Profile image bytes
  final bytes = Uint8List(0);

  /// Username field controller
  final usernameController = TextEditingController();

  /// Biography field controller
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
      imageBytes: bytes,
    );

    final response = await authenticationUseCase.completeRegister(information);
    if (response is Failure<void, AuthenticationError>) {
      error = response.error;
    }

    loading = false;
    notifyListeners();
  }
}
