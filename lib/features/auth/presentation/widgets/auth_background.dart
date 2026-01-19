import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEAF6FB),
            Color(0xFFBEE7F4),
            Color(0xFF89CFF0),
          ],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
