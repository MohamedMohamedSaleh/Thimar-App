import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                ).r,
                child: const FormForgetPassword(),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              text: "لديك حساب بالفعل ؟ ",
              buttonText: "تسجيل الدخول",
              onPress: () {
                navigateTo(toPage: const LoginView());
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
  final phoneController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: ListView(
        padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8).r,
        children: [
          CustomIntroduction(
            mainText: "نسيت كلمة المرور",
            supText: "أدخل رقم الجوال المرتبط بحسابك",
            paddingHeight: 24.h,
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
            paddingBottom: 28.h,
            controller: phoneController,
          ),
          CustomFillButton(
            title: "تأكيد رقم الجوال",
            onPress: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {
                navigateTo(
                  toPage: ConfirmCodeView(
                    isActive: false,
                    phone: phoneController.text,
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
