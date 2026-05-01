import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  const _LoginScreenContent({super.key});

  @override
  State<_LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<_LoginScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const Text('App Login'),

            const SizedBox(height: 16),

            const Text('Log in the app to start to do activities'),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
