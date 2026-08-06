import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
