import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/providers/app_providers.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

class AiroTechhubApp extends ConsumerWidget {
  const AiroTechhubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);
    final language = ref.watch(languageProvider);
    final isTamil = language == 'ta';

    return MaterialApp.router(
      title: 'AIRO TECHHUB',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.lightTheme(isTamil: isTamil),
      darkTheme: AppTheme.darkTheme(isTamil: isTamil),
      routerConfig: router,
    );
  }
}

