/// Represents a complete language identifier with optional regional variant.
class LocaleCode {
  /// Standard constructor.
  const LocaleCode({required this.language, this.region});

  /// The ISO 639-1 language code (e.g., 'pt', 'en', 'es').
  final String language;

  /// The ISO 3166-1 alpha-2 region code (e.g., 'BR' for Brazil, 'US' for United States).
  final String? region;

  /// Returns the full locale string (e.g., 'pt_BR', 'en_US').
  String toLocaleString() {
    if (region == null) {
      return language;
    }

    return '${language}_$region';
  }
}

/// Represents the languages available in the application.
enum Language {
  /// Represents the PT-BR language.
  portuguese,

  /// Represents the english language.
  english,

  /// Represents the spanish language.
  spanish;

  /// Returns the code of the selected language.
  LocaleCode toLocale() {
    return switch (this) {
      .portuguese => const LocaleCode(language: 'pt', region: 'BR'),
      .english => const LocaleCode(language: 'en', region: 'US'),
      .spanish => const LocaleCode(language: 'es', region: 'ES'),
    };
  }
}

/// Represents the themes available in the application.
enum Theme {
  /// Represents the same theme as the user's system.
  system,

  /// Represents the light theme.
  light,

  /// Represents the dark theme.
  dark,
}
