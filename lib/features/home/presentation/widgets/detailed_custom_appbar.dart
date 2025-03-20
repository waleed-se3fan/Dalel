import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDetailedAppbar extends StatelessWidget {
  const CustomDetailedAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.brown,
          ),
        ),
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
