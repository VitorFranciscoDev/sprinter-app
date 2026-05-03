import 'package:go_router/go_router.dart';
import 'features/authentication/login/login_screen.dart';

abstract class AppRoutes {
  static const welcome = '/';
  static const login = '/login';
  static const register = '/register';
}

final routes = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(path: AppRoutes.welcome),
    GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
    GoRoute(path: AppRoutes.register),
  ],
);
