import 'package:sprinter/l10n/app_localizations.dart';

/// Represents activity-related errors that can occur during user activity flows
enum ActivityError {
  /// A generic server-side failure occurred
  internalServerError,

  /// The request was malformed or contained invalid parameters
  badRequestError,

  /// The requested resource or user account could not be found
  notFoundError;

  String translate(AppLocalizations l10n) => switch (this) {
    .internalServerError => l10n.internalServerError,
    .badRequestError => l10n.badRequestError,
    .notFoundError => l10n.notFoundError,
  };
}
