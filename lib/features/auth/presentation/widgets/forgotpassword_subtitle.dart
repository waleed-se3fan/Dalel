import 'package:flutter/material.dart';

class ForgotPasswordSubtitle extends StatelessWidget {
  const ForgotPasswordSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Enter your registered email below to receive password reset instruction',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
