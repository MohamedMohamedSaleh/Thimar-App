import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../login/login_view.dart';

class SplashViews extends StatefulWidget {
  const SplashViews({super.key});

  @override
  State<SplashViews> createState() => _SplashViewsState();
}

class _SplashViewsState extends State<SplashViews> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: -53,
              start: 27,
              child: Image.asset("assets/images/splash_ib.png", width: 448, height: 298,)),
          Image.asset(
            "assets/images/splash_bg.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: FlipInY(
              delay: const Duration(seconds: 1),
              duration: const Duration(seconds: 2),
              child: ZoomIn(
                delay: const Duration(seconds: 1),
              duration: const Duration(seconds: 1),
              
                child: Image.asset(
                  "assets/images/vegetable_basket.png",
                  width: 160,
                  height: 157,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
