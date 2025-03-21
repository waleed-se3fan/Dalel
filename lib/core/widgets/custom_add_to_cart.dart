import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAddtocartButton extends StatelessWidget {
  const CustomAddtocartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return Container();
          }));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Add To Cart',
          style: const TextStyle(fontSize: 18, color: AppColors.white),
        ),
      ),
    );
  }
}
