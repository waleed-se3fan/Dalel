import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAddtocartButton extends StatelessWidget {
  final Function() onPress;
  final String text;
  const CustomAddtocartButton(
      {super.key, required this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: AppColors.white),
        ),
      ),
    );
  }
}
