import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
              child: ListView(
                padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                children: [
                  Image.asset(
                    "assets/images/vegetable_basket.png",
                    width: 130,
                    height: 125,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21, bottom: 6),
                    child: Text(
                      "نسيت كلمة المرور",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "أدخل رقم الجوال المرتبط بحسابك",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const CustomAppInput(
                    labelText: "رقم الجوال",
                    prefixIcon: "assets/icon/phone_icon.png",
                    isPhone: true,
                    paddingBottom: 28,
                  ),
                  
                  
                  const CustomFillButton(title: "تأكيد رقم الجوال"),
                ],
              ),
            ),
            bottomNavigationBar: const CustomBottomNavigationBar(
              text: "لديك حساب بالفعل ؟ ",
              buttonText: "تسجيل الدخول",
            ),
          ),
        ],
      ),
    );
  }
}
