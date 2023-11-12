import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import '../../../core/logic/helper_methods.dart';
import '../confirm_code/confirm_code_view.dart';
import '../login/login_view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
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
                  padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                  children: [
                    const CustomIntroduction(
                      mainText: "نسيت كلمة المرور",
                      supText: "أدخل رقم الجوال المرتبط بحسابك",
                      paddingHeight: 24,
                    ),
                     CustomAppInput(
                     
                      labelText: "رقم الجوال",
                      prefixIcon: "assets/icon/phone_icon.png",
                      isPhone: true,
                      paddingBottom: 28,
                    ),
                    CustomFillButton(
                      title: "تأكيد رقم الجوال",
                      onPress: () {
                        FocusScope.of(context).unfocus();
                        navegateTo(
                          toPage: const ConfirmCodeView(
                            isActive: false,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              text: "لديك حساب بالفعل ؟ ",
              buttonText: "تسجيل الدخول",
              onPress: () {
                navegateTo(toPage: const LoginView());
              },
            ),
          ),
        ],
      ),
    );
  }
}
