import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sprinter/infrastructure/presentation/features/authentication/components/authentication_divider.dart';
import 'package:sprinter/infrastructure/presentation/features/authentication/components/authentication_redirect_row.dart';
import 'package:sprinter/infrastructure/presentation/shared/components/default_button.dart';
import 'package:sprinter/infrastructure/presentation/shared/components/default_text_field.dart';

import 'login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginState(),
      child: const _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatefulWidget {
  const _LoginScreenContent();

  @override
  State<_LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<_LoginScreenContent> {
  Future<void> _signInWithEmailAndPassword() async {}

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: .symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Sprinter',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: .bold,
                    color: colorScheme.onSurface,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Log in the app to start to do activities',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),

                const SizedBox(height: 24),

                DefaultTextField(label: 'Email', icon: Icons.email_outlined),

                const SizedBox(height: 8),

                DefaultTextField(
                  label: 'Password',
                  icon: Icons.lock_outlined,
                  isPassword: true,
                ),

                const SizedBox(height: 16),

                _ForgotYourPassword(),

                const SizedBox(height: 16),

                DefaultButton(
                  callback: _signInWithEmailAndPassword,
                  text: 'Log In',
                ),

                const SizedBox(height: 16),

                AuthenticationDivider(),

                const SizedBox(height: 16),

                _ExternalLoginButton(
                  callback: _signInWithEmailAndPassword,
                  platform: 'Google',
                ),

                const SizedBox(height: 8),

                _ExternalLoginButton(
                  callback: _signInWithEmailAndPassword,
                  platform: 'Apple',
                ),

                const SizedBox(height: 16),

                AuthenticationRedirectRow(
                  redirectToRegister: true,
                  callback: () => context.push('/register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ForgotYourPassword extends StatelessWidget {
  const _ForgotYourPassword();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerRight,
        ),
        child: const Text(
          'Forgot your password?',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class _ExternalLoginButton extends StatelessWidget {
  const _ExternalLoginButton({
    required this.callback,
    required this.platform,
  });

  final VoidCallback callback;
  final String platform;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => callback(),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: colorScheme.secondary.withValues(alpha: 0.5)),
          ),
          elevation: 0,
        ),
        child: Text(
          platform,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
