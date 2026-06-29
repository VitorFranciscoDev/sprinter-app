import 'package:flutter/material.dart';
import 'package:sprinter/l10n/app_localizations.dart';

class AuthenticationDivider extends StatelessWidget {
  const AuthenticationDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(child: Divider(color: colorScheme.onSurface.withValues(alpha: 0.3))),
        const SizedBox(width: 16),
        Text(
          l10n!.or,
          style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.5)),
        ),
        const SizedBox(width: 16),
        Expanded(child: Divider(color: colorScheme.onSurface.withValues(alpha: 0.3))),
      ],
    );
  }
}
