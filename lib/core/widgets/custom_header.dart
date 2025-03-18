import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomHeaderText extends StatelessWidget {
  final String text;
  const CustomHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.headertext),
    );
  }
}
