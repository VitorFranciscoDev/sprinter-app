// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get internalServerError =>
      'Something went wrong on our end. Please try again later or contact support if the issue persists.';

  @override
  String get badRequestError =>
      'The request was malformed or contains invalid data. Please check your input and try again.';

  @override
  String get notFoundError =>
      'The requested resource could not be found. It may have been deleted or never existed.';

  @override
  String get invalidCredentialsError =>
      'The email or password you entered is incorrect. Please double-check and try again.';

  @override
  String get nameIsTooShortError =>
      'The name you entered is too short. Please use at least the minimum number of characters required.';

  @override
  String get nameIsTooLongError =>
      'The name you entered exceeds the maximum allowed length. Please shorten it and try again.';

  @override
  String get biographyIsTooLongError =>
      'The biography you entered exceeds the maximum allowed length. Please shorten it and try again.';  

  @override
  String get invalidEmailError =>
      'The email address you entered is not valid. Please enter a correctly formatted email (e.g. user@example.com).';

  @override
  String get weakPasswordError =>
      'Your password is too weak. Use a mix of uppercase letters, lowercase letters, numbers, and special characters.';

  @override
  String get userAlreadyExistsError =>
      'An account with this email address already exists. Try logging in instead, or use a different email to register.';
}
