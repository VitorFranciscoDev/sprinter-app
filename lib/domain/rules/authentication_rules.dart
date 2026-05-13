import 'package:email_validator/email_validator.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/errors/authentication_error.dart';

class AuthenticationRules {
  static Result<void, AuthenticationError> _validateName(String name) {
    if (name.length < 3) {
      return Result.failure(.nameIsTooShortError);
    }

    if (name.length > 32) {
      return Result.failure(.nameIsTooLongError);
    }

    return Result.success(null);
  }

  static Result<void, AuthenticationError> _validateEmail(String email) {
    if (!EmailValidator.validate(email)) {
      return Result.failure(.invalidEmailError);
    }

    return Result.success(null);
  }

  static Result<void, AuthenticationError> _validatePassword(String password) {
    final hasNumber = password.contains(RegExp(r'\d'));
    final hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final validLength = password.length >= 8 && password.length <= 32;

    if (validLength && hasNumber && hasSpecial) {
      return Result.success(null);
    }

    return Result.failure(.weakPasswordError);
  }

  static Result<void, AuthenticationError> validateLogin(
    UserCredentials credentials,
  ) {
    final emailResult = _validateEmail(credentials.email);
    if (emailResult is Failure) {
      return emailResult;
    }

    final passwordResult = _validatePassword(credentials.password);
    if (passwordResult is Failure) {
      return passwordResult;
    }

    return Result.success(null);
  }

  static Result<void, AuthenticationError> validateRegister(
    UserCredentials credentials,
  ) {
    final nameResult = _validateName(credentials.name!);
    if (nameResult is Failure) {
      return nameResult;
    }

    final emailResult = _validateEmail(credentials.email);
    if (emailResult is Failure) {
      return emailResult;
    }

    final passwordResult = _validatePassword(credentials.password);
    if (passwordResult is Failure) {
      return passwordResult;
    }

    return Result.success(null);
  }

  static Result<void, AuthenticationError> _validateUsername(String username) {
    if (username.length < 3) {
      return Result.failure(.nameIsTooShortError);
    }

    if (username.length > 32) {
      return Result.failure(.nameIsTooLongError);
    }

    return Result.success(null);
  }

  static Result<void, AuthenticationError> _validateBiography(
    String biography,
  ) {
    if (biography.length > 255) {
      return Result.failure(.biographyIsTooLongError);
    }

    return Result.success(null);
  }

  static Result<void, AuthenticationError> validateCompleteRegister(
    UserInformation information,
  ) {
    final usernameResult = _validateUsername(information.username);
    if (usernameResult is Failure) {
      return usernameResult;
    }

    final biographyResult = _validateBiography(information.biography);
    if (biographyResult is Failure) {
      return biographyResult;
    }

    return Result.success(null);
  }
}
