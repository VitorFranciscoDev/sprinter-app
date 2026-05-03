import 'package:flutter/material.dart';

/// Light theme for the application
final lightTheme = ThemeData(
  brightness: .light,
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  colorScheme: const .light(
    brightness: .light,
    primary: Color(0xFF1C5E21),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFA5D6A7),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFB71C1C),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF212121),
  ),
);

/// Dark theme for the application
final darkTheme = ThemeData(
  brightness: .dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const .dark(
    brightness: .dark,
    primary: Color(0xFF4CAF50),
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFF2E7D32),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFEF9A9A),
    onError: Color(0xFF000000),
    surface: Color(0xFF1E1E1E),
    onSurface: Color(0xFFE0E0E0),
  ),
);