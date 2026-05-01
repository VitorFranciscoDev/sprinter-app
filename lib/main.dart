import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sprinter/infrastructure/presentation/app_routes.dart';

import 'build_flags.dart';

Future<void> main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();

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
      routerConfig: routes,
    );
  }
}
