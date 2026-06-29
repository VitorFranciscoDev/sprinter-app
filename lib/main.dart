import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:sprinter/infrastructure/app_state.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';
import 'package:sprinter/infrastructure/presentation/routes.dart';
import 'package:sprinter/infrastructure/presentation/theme.dart';

import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Add native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  // Initialize use cases
  initialize();

  // Initialize app state
  final appState = AppState();
  await appState.initialize();

  // Remove native splash screen
  FlutterNativeSplash.remove();

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const SprinterApp(),
    ),
  );
}

class SprinterApp extends StatelessWidget {
  const SprinterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sprinter',
      themeMode: appState.theme,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: routes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
