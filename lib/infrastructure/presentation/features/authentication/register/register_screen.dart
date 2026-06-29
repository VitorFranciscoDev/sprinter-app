import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/errors/authentication_error.dart';
import 'package:sprinter/infrastructure/presentation/features/authentication/components/authentication_divider.dart';
import 'package:sprinter/infrastructure/presentation/features/authentication/components/authentication_redirect_row.dart';
import 'package:sprinter/infrastructure/presentation/features/authentication/register/register_state.dart';
import 'package:sprinter/infrastructure/presentation/routes.dart';
import 'package:sprinter/infrastructure/presentation/shared/components/default_button.dart';
import 'package:sprinter/infrastructure/presentation/shared/components/default_error_modal.dart';
import 'package:sprinter/infrastructure/presentation/shared/components/default_text_field.dart';
import 'package:sprinter/l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterState(),
      child: const _RegisterScreenContent(),
    );
  }
}

class _RegisterScreenContent extends StatefulWidget {
  const _RegisterScreenContent();

  @override
  State<_RegisterScreenContent> createState() => _RegisterScreenContentState();
}

class _RegisterScreenContentState extends State<_RegisterScreenContent> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: .symmetric(horizontal: 24),
            child: Consumer<RegisterState>(
              builder: (context, state, _) {
                return Column(
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
                      l10n!.registerSubtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),

                    const SizedBox(height: 24),

                    DefaultTextField(
                      label: l10n.name,
                      icon: Icons.person_outlined,
                    ),

                    const SizedBox(height: 8),

                    DefaultTextField(
                      label: l10n.email,
                      icon: Icons.email_outlined,
                    ),

                    const SizedBox(height: 8),

                    DefaultTextField(
                      label: l10n.password,
                      icon: Icons.lock_outlined,
                      isPassword: true,
                    ),

                    const SizedBox(height: 16),

                    DefaultButton(
                      callback: () async {
                        final result = await state.attemptRegister();

                        if (!context.mounted) {
                          return;
                        }

                        if (result is Failure<void, AuthenticationError>) {
                          showErrorModal(
                            context,
                            message: result.error.translate(l10n),
                          );
                          return;
                        }

                        context.go(AppRoutes.home);
                      },
                      text: l10n.loginAction,
                    ),

                    const SizedBox(height: 16),

                    AuthenticationDivider(),

                    const SizedBox(height: 16),

                    AuthenticationRedirectRow(
                      redirectToRegister: false,
                      callback: () => context.push(AppRoutes.login),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
