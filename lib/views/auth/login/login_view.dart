import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';

import '../../../core/logic/helper_methods.dart';
import '../forget_password/forget_password_view.dart';
import '../register/register_view.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/splash_bg.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                ),
                child: ListView(
                  padding: const EdgeInsets.only(top: 0),
                  children: [
                    const CustomIntroduction(
                      mainText: "مرحبا بك مرة أخرى",
                      supText: "يمكنك تسجيل الدخول الأن",
                      paddingHeight: 28,
                    ),
                    const CustomAppInput(
                      labelText: "رقم الجوال",
                      prefixIcon: "assets/icon/phone_icon.png",
                      isPhone: true,
                    ),
                    const CustomAppInput(
                      labelText: "كلمة المرور",
                      prefixIcon: "assets/icon/lock_icon.png",
                      isPassword: true,
                      paddingBottom: 0,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        child: const Text(
                          "نسيت كلمة المرور ؟",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              height: .1,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          navegateTo(toPage: const ForgetPasswordView());
                      
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomFillButton(
                      title: "تسجيل الدخول",
                      onPress: () {
                        FocusScope.of(context).unfocus();
                        // navegateTo(toPage: const RegisterView());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              text: "ليس لديك حساب ؟",
              buttonText: " تسجيل الأن",
              paddingBottom: 22,
              onPress: () {
                navegateTo(toPage: const RegisterView());
              },
            ),
          ),
        ],
      ),
    );
  }
}
