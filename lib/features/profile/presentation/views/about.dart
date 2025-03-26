import 'package:dalel/core/widgets/custom_drawer_appbar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CutomWidget().drawerAppbar('About dalel'),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),

            // App Name
            Text(
              'Dalel',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4AF37), // Golden color
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8),

            // Version
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24),

            // Description
            Text(
              'Dalel is your ultimate guide to exploring the rich history of Egypt. '
              'Discover historical eras, important figures, and iconic artifacts in one place. '
              'Immerse yourself in the legacy of the Pharaohs and beyond.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown,
                height: 1.6,
              ),
            ),
            SizedBox(height: 40),

            // Contact Info or Credits
            Divider(color: Colors.grey),
            SizedBox(height: 16),

            Text(
              'Contact us at:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5C4033), // Dark brown color
              ),
            ),
            SizedBox(height: 4),
            Text(
              'waleedse3fan@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 16),

            Text(
              '© 2025 Dalel Inc. All rights reserved.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
