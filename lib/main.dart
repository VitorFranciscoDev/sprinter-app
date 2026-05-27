import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:sprinter/infrastructure/app_state.dart';
import 'package:sprinter/infrastructure/presentation/routes.dart';
import 'package:sprinter/infrastructure/presentation/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Add native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  // Initialize app state
  final appState = AppState();
  await appState.initialize();

  // Remove native splash screen
  FlutterNativeSplash.remove();

  runApp(const SprinterApp());
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
    );
  }
}
