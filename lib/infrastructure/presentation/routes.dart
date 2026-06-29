import 'package:go_router/go_router.dart';
import 'package:sprinter/infrastructure/presentation/features/authentication/register/register_screen.dart';
import 'features/authentication/login/login_screen.dart';

abstract class AppRoutes {
  static const welcome = '/';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
}

final routes = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
    GoRoute(
      path: AppRoutes.register,
      builder: (_, _) => const RegisterScreen(),
    ),
  ],
);
