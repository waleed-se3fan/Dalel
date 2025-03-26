import 'package:flutter/material.dart';

class CutomWidget {
  String? x;
  PreferredSizeWidget drawerAppbar(String text) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFD4AF37), // Golden color
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
    );
  }
}
