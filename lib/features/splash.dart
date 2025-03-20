import 'package:dalel/features/home/presentation/view/view.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        FirebaseAuth.instance.currentUser == null
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (c) {
                return const OnBoardingView();
              }))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (c) {
                return const HomeScreen();
              }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Dalel',
          style: TextStyle(
              color: Colors.brown.shade800,
              fontWeight: FontWeight.w400,
              fontSize: 64),
        ),
      ),
    );
  }
}


///////////////////////////////////////////////////////////////////////////////////////
///
///
///
