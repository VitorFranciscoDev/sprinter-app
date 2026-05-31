import 'package:sprinter/l10n/app_localizations.dart';

/// Represents product-related errors that can occur during product operations
enum ProductError {
  /// A generic server-side failure occurred
  internalServerError,

  /// The request was malformed or contained invalid parameters
  badRequestError,

  /// The requested product could not be found
  notFoundError,

  /// The product is out of stock
  outOfStockError,

  /// The user is not authorized to perform this action
  unauthorizedError;

  String translate(AppLocalizations l10n) => switch (this) {
    .internalServerError => l10n.internalServerError,
    .badRequestError => l10n.badRequestError,
    .notFoundError => l10n.notFoundError,
    .outOfStockError => l10n.outOfStockError,
    .unauthorizedError => l10n.unauthorizedError,
  };
}
