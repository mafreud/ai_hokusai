import 'package:ai_hokusai/src/features/navigation_bar/navigation_bar_page.dart';
import 'package:ai_hokusai/src/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_service.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStream = ref.watch(authStateProvider);
    return authStream.when(
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, stack) => Text('error:$error'),
      data: (user) {
        if (user == null) {
          return const OnboardingPage();
        }
        return const NavigationBarPage();
      },
    );
  }
}
