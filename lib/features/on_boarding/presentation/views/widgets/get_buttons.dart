import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/views/signin.dart';
import 'package:dalel/features/auth/presentation/views/signup.dart';
import 'package:dalel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          CustomBtn(
            text: 'createAccount',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const SignupScreen();
              }));
            },
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const SignInScreen();
              }));
            },
            child: const Text(
              'loginNow',
            ),
          ),
        ],
      );
    } else {
      return CustomBtn(
        text: 'next',
        onPressed: () {
          controller.nextPage(
            duration: const Duration(microseconds: 200),
            curve: Curves.bounceIn,
          );
        },
      );
    }
  }
}
