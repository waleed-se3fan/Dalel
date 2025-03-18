import 'package:dalel/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.imagesMenu),
        Text(
          'Dalel',
          style: TextStyle(
              color: Colors.brown.shade800,
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),
      ],
    );
  }
}
