import 'package:flutter/material.dart';
import 'package:sprinter/l10n/app_localizations.dart';

/// A compact error modal: small icon + headline on the top-left,
/// supporting body text below, and a single dismiss action bottom-right.
///
/// Usage:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => ErrorModal(
///     message: "Something went wrong on our end. Try again in a moment.",
///   ),
/// );
/// ```
class ErrorModal extends StatelessWidget {
  const ErrorModal({
    super.key,
    required this.message,
    this.dismissLabel,
    this.onDismiss,
    this.icon = Icons.warning_amber_rounded,
  });

  final String message;
  final String? dismissLabel;
  final VoidCallback? onDismiss;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 18, color: colorScheme.error),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n!.defaultErrorMessage,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onDismiss ?? () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.onSurfaceVariant,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: colorScheme.outline),
                  ),
                ),
                child: Text(
                  dismissLabel ?? l10n.dismiss,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper to show the modal without boilerplate at the call site.
Future<void> showErrorModal(
  BuildContext context, {
  required String message,
  String? dismissLabel,
  VoidCallback? onDismiss,
  IconData icon = Icons.warning_amber_rounded,
}) {
  return showDialog(
    context: context,
    builder: (_) => ErrorModal(
      message: message,
      dismissLabel: dismissLabel,
      onDismiss: onDismiss,
      icon: icon,
    ),
  );
}
