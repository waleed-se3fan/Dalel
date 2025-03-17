import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final String text1;
  final String text2;
  final Function() onTap;

  const AlreadyHaveAccount(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Text.rich(TextSpan(children: [
          TextSpan(
            text: text1,
          ),
          TextSpan(
            text: text2,
          ),
        ])),
      ),
    );
  }
}
