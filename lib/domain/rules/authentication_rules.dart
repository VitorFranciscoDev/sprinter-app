import 'package:email_validator/email_validator.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/errors/authentication_error.dart';

class AuthenticationRules {
  static Result<void, AuthenticationError> validateName(String name) {
    if (name.length < 3) {
      return Result.failure(.nameIsTooShortError);
    }

    if (name.length > 32) {
      return Result.failure(.nameIsTooLongError);
    }

    return Result.success(null);
  }

  static Result<void, AuthenticationError> validateEmail(String email) {
    if (!EmailValidator.validate(email)) {
      return Result.failure(.invalidEmailError);
    }

    return Result.success(null);
  }

  static Result<void, AuthenticationError> validatePassword(String password) {
    final hasNumber = password.contains(RegExp(r'\d'));
    final hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final validLength = password.length >= 8 && password.length <= 32;

    if (validLength && hasNumber && hasSpecial) {
      return Result.success(null);
    }

    return Result.failure(.weakPasswordError);
  }
}
