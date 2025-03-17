import 'package:dalel/features/auth/presentation/widgets/signin_form.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_banner.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
        WelcomeBanner(),
        Text(
          'Welcome Back !',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 25,
        ),
        SigninForm()
      ],
    ));
  }
}
