# Sprinter App

Sprinter is the Flutter mobile client for the Sprinter project. It provides the user interface, talks to the Sprinter API, validates user input on the client, stores authentication data securely, and reports runtime issues through Sentry.

Backend repository: [Gsdagustavo/sprinter-api](https://github.com/Gsdagustavo/sprinter-api)

## Current App Surface

- Email/password login screen with shared authentication components.
- Authentication domain layer with rules, use cases, repository interfaces, and API-backed infrastructure.
- HTTP helpers that read the API base URL from Dart build flags and wrap requests with Sentry tracing.
- Secure token storage through `flutter_secure_storage`.
- Routing through `go_router`.
- Screen state through `provider` and `ChangeNotifier`.
- Generated localization setup for English, Portuguese, and Spanish ARB files.
- Light and dark theme definitions, with the app currently forced to light mode.

## Tech Stack

- Flutter and Dart
- Material UI
- `go_router` for navigation
- `provider` for presentation state
- `http` for API requests
- `sentry_flutter` for error monitoring and HTTP instrumentation
- `flutter_secure_storage` for persisted auth data
- `flutter_localizations` and generated ARB localizations

## Project Structure

```text
lib/
  build_flags.dart                         # --dart-define values
  main.dart                                # app bootstrap, Sentry, router, theme
  domain/                                  # entities, rules, errors, use cases
  infrastructure/
    repositories/                          # API repositories and web services
    presentation/                          # routes, theme, screens, shared widgets
  l10n/                                    # ARB files and generated localizations
```

## Requirements

- Flutter SDK compatible with Dart `^3.11.5`
- Android Studio/Xcode tooling for the target platform
- A running Sprinter API instance

## Running Locally

Install packages:

```bash
flutter pub get
```

Run the app with the API URL configured through `--dart-define`:

```bash
flutter run --dart-define="baseURL=http://10.0.2.2:<PORT>"
```

Add a Sentry DSN when you want runtime reporting enabled:

```bash
flutter run \
  --dart-define="baseURL=http://10.0.2.2:<PORT>" \
  --dart-define="sentryDSN=https://key@org.ingest.sentry.io/project"
```

Common local backend URLs:

| Target | URL |
| --- | --- |
| Android emulator | `http://10.0.2.2:<PORT>` |
| iOS simulator | `http://localhost:<PORT>` |
| Physical device | `http://<your-local-ip>:<PORT>` |

List devices and choose one explicitly if needed:

```bash
flutter devices
flutter run -d <device_id> --dart-define="baseURL=<API_URL>"
```

## Localization

Localization source files live in `lib/l10n`:

- `app_en.arb`
- `app_pt.arb`
- `app_es.arb`

The project has `flutter.generate` enabled and uses `l10n.yaml`, so generated localization files are produced by Flutter tooling when needed.

## Quality Checks

Run static analysis before opening a pull request:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

## Recommended Startup Order

1. Start the backend database/container dependencies.
2. Run the Sprinter API.
3. Confirm the API is reachable from the target device or emulator.
4. Run the Flutter app with the correct `baseURL`.

## License

This project is intended for educational and development purposes.
