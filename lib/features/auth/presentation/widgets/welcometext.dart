import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome!',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }
}
