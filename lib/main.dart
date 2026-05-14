import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sprinter/infrastructure/presentation/routes.dart';
import 'package:sprinter/infrastructure/presentation/theme.dart';

import 'build_flags.dart';

Future<void> main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  FlutterNativeSplash.remove();
  await SentryFlutter.init((options) {
    options.dsn = BuildFlags.sentryDSN;
    options.tracesSampleRate = 1.0;
    options.anrEnabled = true;
    options.enableLogs = true;
  }, appRunner: () => runApp(const SprinterApp()));
}

class SprinterApp extends StatelessWidget {
  const SprinterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sprinter',
      themeMode: .light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: routes,
    );
  }
}
