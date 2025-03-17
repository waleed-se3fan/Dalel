import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: height * .35,
          decoration: const BoxDecoration(color: AppColors.appColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Dalel'),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(Assets.imagesVector1),
                  SvgPicture.asset(Assets.imagesVector2)
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * .09,
        ),
      ],
    );
  }
}
