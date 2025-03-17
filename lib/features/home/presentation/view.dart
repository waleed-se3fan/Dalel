import 'package:dalel/features/auth/presentation/views/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) {
                      return SignInScreen();
                    })));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: FlutterLogo(),
      ),
    );
  }
}
