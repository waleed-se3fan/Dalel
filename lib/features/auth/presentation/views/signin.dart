import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/auth/presentation/widgets/signin_form.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
