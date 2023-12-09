import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import '../../../core/logic/helper_methods.dart';
import '../confirm_code/confirm_code_view.dart';
import '../login/login_view.dart';

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
            body: const SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                ),
                child: FormForgetPassword(),
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

class FormForgetPassword extends StatefulWidget {
  const FormForgetPassword({
    super.key,
  });

  @override
  State<FormForgetPassword> createState() => _FormForgetPasswordState();
}

class _FormForgetPasswordState extends State<FormForgetPassword> {
  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: ListView(
        padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
        children: [
          const CustomIntroduction(
            mainText: "نسيت كلمة المرور",
            supText: "أدخل رقم الجوال المرتبط بحسابك",
            paddingHeight: 24,
          ),
          CustomAppInput(
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return "رقم الجوال مطلوب";
              } else if (value!.length < 10) {
                return "رقم الهاتف يجب أن يكون أكبر من 10 أرقام";
              }
              return null;
            },
            labelText: "رقم الجوال",
            prefixIcon: "assets/icon/phone_icon.png",
            isPhone: true,
            paddingBottom: 28,
          ),
          CustomFillButton(
            title: "تأكيد رقم الجوال",
            onPress: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {
                navegateTo(
                  toPage: const ConfirmCodeView(
                    isActive: false,
                  ),
                );
              } else {
                autovalidateMode = AutovalidateMode.onUserInteraction;

                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
