import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @internalServerError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on our end. Please try again later or contact support if the issue persists.'**
  String get internalServerError;

  /// No description provided for @badRequestError.
  ///
  /// In en, this message translates to:
  /// **'The request was malformed or contains invalid data. Please check your input and try again.'**
  String get badRequestError;

  /// No description provided for @notFoundError.
  ///
  /// In en, this message translates to:
  /// **'The requested resource could not be found. It may have been deleted or never existed.'**
  String get notFoundError;

  /// No description provided for @invalidCredentialsError.
  ///
  /// In en, this message translates to:
  /// **'The email or password you entered is incorrect. Please double-check and try again.'**
  String get invalidCredentialsError;

  /// No description provided for @nameIsTooShortError.
  ///
  /// In en, this message translates to:
  /// **'The name you entered is too short. Please use at least the minimum number of characters required.'**
  String get nameIsTooShortError;

  /// No description provided for @nameIsTooLongError.
  ///
  /// In en, this message translates to:
  /// **'The name you entered exceeds the maximum allowed length. Please shorten it and try again.'**
  String get nameIsTooLongError;

  /// No description provided for @biographyIsTooLongError.
  ///
  /// In en, this message translates to:
  /// **'The biography you entered exceeds the maximum allowed length. Please shorten it and try again.'**
  String get biographyIsTooLongError;

  /// No description provided for @invalidEmailError.
  ///
  /// In en, this message translates to:
  /// **'The email address you entered is not valid. Please enter a correctly formatted email (e.g. user@example.com).'**
  String get invalidEmailError;

  /// No description provided for @weakPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Your password is too weak. Use a mix of uppercase letters, lowercase letters, numbers, and special characters.'**
  String get weakPasswordError;

  /// No description provided for @userAlreadyExistsError.
  ///
  /// In en, this message translates to:
  /// **'An account with this email address already exists. Try logging in instead, or use a different email to register.'**
  String get userAlreadyExistsError;

  /// No description provided for @outOfStockError.
  ///
  /// In en, this message translates to:
  /// **'This product is currently out of stock. Please check back later or choose a different product.'**
  String get outOfStockError;

  /// No description provided for @unauthorizedError.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to perform this action. Please log in with the correct account.'**
  String get unauthorizedError;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in the app to start to do activities'**
  String get loginSubtitle;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @loginAction.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginAction;

  /// No description provided for @forgotYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotYourPassword;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @noAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccountQuestion;

  /// No description provided for @hasAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get hasAccountQuestion;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
