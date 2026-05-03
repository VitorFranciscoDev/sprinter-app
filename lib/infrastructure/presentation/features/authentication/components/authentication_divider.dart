import 'package:flutter/material.dart';

class AuthenticationDivider extends StatelessWidget {
  const AuthenticationDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(child: Divider(color: colorScheme.onSurface.withValues(alpha: 0.3))),
        const SizedBox(width: 16),
        Text(
          'or',
          style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.5)),
        ),
        const SizedBox(width: 16),
        Expanded(child: Divider(color: colorScheme.onSurface.withValues(alpha: 0.3))),
      ],
    );
  }
}
