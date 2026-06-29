import 'package:flutter/material.dart';
import 'package:sprinter/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          redirectToRegister ? l10n!.noAccountQuestion : l10n!.hasAccountQuestion,
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
            redirectToRegister ? l10n.signUp : l10n.signIn,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
