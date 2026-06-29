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

  @override
  String get outOfStockError =>
      'This product is currently out of stock. Please check back later or choose a different product.';

  @override
  String get unauthorizedError =>
      'You do not have permission to perform this action. Please log in with the correct account.';

  @override
  String get loginSubtitle => 'Log in the app to start to do activities';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get name => 'Name';

  @override
  String get loginAction => 'Log In';

  @override
  String get forgotYourPassword => 'Forgot your password?';

  @override
  String get or => 'or';

  @override
  String get noAccountQuestion => 'Don\'t have an account?';

  @override
  String get hasAccountQuestion => 'Already have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get signIn => 'Sign in';

  @override
  String get defaultErrorMessage => 'An error has occurred.';

  @override
  String get dismiss => 'Dismiss';
}
