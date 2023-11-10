import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                children: [
                  Image.asset(
                    "assets/images/vegetable_basket.png",
                    width: 130,
                    height: 125,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21, bottom: 6),
                    child: Text(
                      "مرحبا بك مرة أخرى",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "يمكنك تسجيل حساب جديد الأن",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const CustomAppInput(
                    labelText: "اسم المستخدم",
                    prefixIcon: "assets/icon/name_icon.png",
                  ),
                  const CustomAppInput(
                    labelText: "رقم الجوال",
                    prefixIcon: "assets/icon/phone_icon.png",
                    isPhone: true,
                  ),
                  const CustomAppInput(
                    labelText: "المدينة",
                    prefixIcon: "assets/icon/city_icon.png",
                    isPassword: true,
                    paddingBottom: 9,
                  ),
                  const CustomAppInput(
                    labelText: "كلمة المرور",
                    prefixIcon: "assets/icon/lock_icon.png",
                    isPassword: true,
                    paddingBottom: 9,
                  ),
                  const CustomAppInput(
                    labelText: "تأكيد كلمة المرور",
                    prefixIcon: "assets/icon/lock_icon.png",
                    isPassword: true,
                    paddingBottom: 24,
                  ),
                  const CustomFillButton(title: "تسجيل الدخول"),
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
