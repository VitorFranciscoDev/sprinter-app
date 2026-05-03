/// This class provides flags from Dart's environment variables (defined via
/// `--dart-define`)
abstract class BuildFlags {
  /// Base URL used for API requests.
  ///
  /// Example:
  /// flutter run --dart-define="baseURL=https://api.example.com"
  ///
  /// If no value is provided, this will default to an empty string.
  static const baseURL = String.fromEnvironment('baseURL');

  /// Data Source Name (DSN) used to configure Sentry error tracking.
  ///
  /// Example:
  /// flutter run --dart-define="sentryDSN=https://key@org.ingest.sentry.io/project"
  ///
  /// If not provided, this will default to an empty string and Sentry
  /// will not be initialized.
  static const sentryDSN = String.fromEnvironment('sentryDSN');
}
