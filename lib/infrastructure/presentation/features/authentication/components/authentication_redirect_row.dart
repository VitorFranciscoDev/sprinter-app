import 'package:flutter/material.dart';

class AuthenticationRedirectRow extends StatelessWidget {
  const AuthenticationRedirectRow({
    super.key,
    required this.redirectToRegister,
    required this.callback,
  });

  final bool redirectToRegister;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          redirectToRegister ? 'Don\'t have an account?' : 'Already have an account?',
          style: TextStyle(
            fontSize: 14,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        TextButton(
          onPressed: () => callback(),
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.primary,
            padding: const EdgeInsets.only(left: 4),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            redirectToRegister ? 'Sign up' : 'Sign in',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
