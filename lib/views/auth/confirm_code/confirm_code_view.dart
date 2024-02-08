import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_circle_or_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import 'package:vegetable_orders_project/views/auth/confirm_code/cubit/confirm_cubit.dart';
import '../../../core/logic/helper_methods.dart';
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
  late ConfirmCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of(context);
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
                      controller: cubit.confirmCodeController,
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
                    BlocBuilder<ConfirmCubit, ConfirmStates>(
                      builder: (context, state) {
                        return CustomFillButton(
                          isLoading: state is ConfirmloadingState,
                          title: "تأكيد الكود",
                          onPress: () {
                            FocusScope.of(context).unfocus();
                            cubit.verify(
                                isActive: widget.isActive, phone: widget.phone);
                          },
                        );
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
                navigateTo(toPage: const LoginView());
              },
            ),
          ),
        ],
      ),
    );
  }
}
