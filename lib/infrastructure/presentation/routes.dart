import 'package:go_router/go_router.dart';
import 'package:sprinter/infrastructure/presentation/features/authentication/register/register_screen.dart';
import 'features/authentication/login/login_screen.dart';
import 'features/home/home_screen.dart';

/// Store the routes for the application.
abstract class AppRoutes {
  /// Defines the route for the Login Screen.
  static const login = '/login';

  /// Defines the route for the Register Screen.
  static const register = '/register';

  /// Defines the route for the Home Screen.
  static const home = '/home';
}

/// Defines the routes for the application.
final routes = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
    GoRoute(
      path: AppRoutes.register,
      builder: (_, _) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (_, _) => const HomeScreen(),
    ),
  ],
);
