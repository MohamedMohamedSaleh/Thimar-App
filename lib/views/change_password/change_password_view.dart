import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import 'package:vegetable_orders_project/views/register/register_view.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

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
                      mainText: "نسيت كلمة المرور",
                      supText: "أدخل كلمة المرور الجديدة",
                      paddingHeight: 17,
                    ),
                    const CustomAppInput(
                      labelText: "كلمة المرور",
                      prefixIcon: "assets/icon/lock_icon.png",
                      isPassword: true,
                    ),
                    const CustomAppInput(
                      labelText: "تأكيد كلمة المرور",
                      prefixIcon: "assets/icon/lock_icon.png",
                      isPassword: true,
                      paddingBottom: 25,
                    ),
                    CustomFillButton(
                      title: "تغيير كلمة المرور",
                      onPress: () {
                        FocusScope.of(context).unfocus();
                      /*   Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ConfirmCodeView(isActive: true,),
                          ),
                        ); */
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar:  CustomBottomNavigationBar(
                text: "ليس لديك حساب ؟",
                buttonText: " تسجيل الدخول",
                paddingBottom: 22,
                onPress: () {
                Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterView(),
                ),
              );
              },
                ),
          ),
        ],
      ),
    );
  }
}
