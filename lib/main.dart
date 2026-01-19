import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/onboarding/presentation/pages/splash_page.dart';

void main() {
  runApp(const SajiloApp());
}

class SajiloApp extends StatelessWidget {
  const SajiloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
