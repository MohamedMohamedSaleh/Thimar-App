import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/views/home/home_view.dart';
import '../login/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    Timer(const Duration(milliseconds: 2000), () {
      navigateTo(
        isRemove: true,
        toPage: CacheHelper.isAuth() ? const HomeView() : const LoginView(),
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
              bottom: -53.h,
              start: 27.w,
              child: Image.asset(
                "assets/images/splash_ib.png",
                width: 448.w,
                height: 298.h,
              )),
          Image.asset(
            "assets/images/splash_bg.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: FlipInY(
              delay: const Duration(milliseconds: 700),
              duration: const Duration(milliseconds: 1500),
              child: ZoomIn(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 750),
                child: Image.asset(
                  "assets/images/vegetable_basket.png",
                  width: 160.w,
                  height: 157.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
