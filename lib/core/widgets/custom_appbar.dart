import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 55, bottom: 10),
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.brown,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
