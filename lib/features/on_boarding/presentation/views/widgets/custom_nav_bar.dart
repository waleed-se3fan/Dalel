import 'package:dalel/features/auth/presentation/views/signup.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
            return const SignupScreen();
          }));
        },
        child: const Text(
          'skip',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }
}
