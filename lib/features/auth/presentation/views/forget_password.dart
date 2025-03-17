import 'package:dalel/features/auth/presentation/widgets/forgotpassword_form.dart';
import 'package:dalel/features/auth/presentation/widgets/forgotpassword_image.dart';
import 'package:dalel/features/auth/presentation/widgets/forgotpassword_subtitle.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            SizedBox(
              height: 45,
            ),
            Text(
              'Forget Password ?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 35,
            ),
            ForgotPasswordImage(),
            ForgotPasswordSubtitle(),
            ForgotPasswordForm()
          ],
        ),
      ),
    );
  }
}
