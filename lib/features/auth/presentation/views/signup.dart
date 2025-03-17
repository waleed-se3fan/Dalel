import 'package:dalel/features/auth/presentation/widgets/already_have_account.dart';
import 'package:dalel/features/auth/presentation/widgets/form.dart';
import 'package:dalel/features/auth/presentation/widgets/welcometext.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
      child: ListView(
        children: [
          SizedBox(
            height: height * .12,
          ),
          const WelcomeTextWidget(),
          SizedBox(
            height: height * .05,
          ),
          const MyForm(),
          AlreadyHaveAccount(
              text1: 'Already have an account ? ',
              text2: 'Sign In',
              onTap: () {})
        ],
      ),
    ));
  }
}
