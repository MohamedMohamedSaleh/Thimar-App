import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_circle_or_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import '../../../core/logic/helper_methods.dart';
import '../change_password/change_password_view.dart';
import '../login/login_view.dart';

class ConfirmCodeView extends StatefulWidget {
  const ConfirmCodeView(
      {super.key, required this.isActive, required this.phone});

  final bool isActive;
  final String phone;
  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  final confirmCodeController = TextEditingController();
  bool isLoading = false;
  void verify() async {
    isLoading = true;
    setState(() {});
    final response = await DioHelper().sendData(
      indPoint: 'verify',
      data: {
        "code": confirmCodeController.text,
        "phone": widget.phone,
        "type": Platform.operatingSystem,
        "device_token": 'test',
      },
    );

    if (response.isSuccess) {
      showMessage(
        message: "تم تفعيل حسابك بنجاح",
        type: MessageType.success,
      );
      if (widget.isActive == false) {
        if (!context.mounted) return;
        FocusScope.of(context).unfocus();
        navegateTo(toPage: const ChangePasswordView());
      }
    } else {
      showMessage(message: response.message);
    }
    isLoading = false;
    setState(() {});
  }

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
                  padding: const EdgeInsets.only(bottom: 15),
                  children: [
                    CustomIntroduction(
                      mainText: !widget.isActive
                          ? "نسيت كلمة المرور"
                          : "تفعيل الحساب",
                      supText:
                          "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                      isRequirPhoneCheck: true,
                    ),
                    PinCodeTextField(
                      controller: confirmCodeController,
                      appContext: context,
                      length: 4,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 50,
                        fieldWidth: 60,
                        selectedColor: Theme.of(context).primaryColor,
                        inactiveColor: const Color(0xffF3F3F3),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFillButton(
                      isLoading: isLoading,
                      title: "تأكيد الكود",
                      onPress: () {
                        FocusScope.of(context).unfocus();
                        verify();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "لم تستلم الكود ؟\nيمكنك إعادة إرسال الكود بعد",
                      textDirection: TextDirection.ltr,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomCircleOrButton(),
                    const SizedBox(
                      height: 20,
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
