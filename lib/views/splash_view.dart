import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/views/login/login_view.dart';

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
              bottom: -75,
              start: -25,
              child: Image.asset("assets/images/splash_ib.png")),
          Image.asset(
            "assets/images/splash_bg.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: FlipInY(
              child: ZoomIn(
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
