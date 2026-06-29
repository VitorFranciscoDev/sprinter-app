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
}
