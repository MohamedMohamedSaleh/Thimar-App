import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import 'package:vegetable_orders_project/views/auth/change_password/bloc/change_password_bloc.dart';
import '../../../core/logic/helper_methods.dart';
import '../register/register_view.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key, required this.phone});
  final String phone;

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
                child: FormChanegePassword(
                  phone: phone,
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              text: "ليس لديك حساب ؟",
              buttonText: " تسجيل الدخول",
              paddingBottom: 22,
              onPress: () {
                navigateTo(toPage: const RegisterView());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FormChanegePassword extends StatefulWidget {
  const FormChanegePassword({
    super.key,
    required this.phone,
  });
  final String phone;

  @override
  State<FormChanegePassword> createState() => _FormChanegePasswordState();
}

class _FormChanegePasswordState extends State<FormChanegePassword> {
  final resetPasswordBloc = KiwiContainer().resolve<ChangePasswordBloc>();
  String? password;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          const CustomIntroduction(
            mainText: "نسيت كلمة المرور",
            supText: "أدخل كلمة المرور الجديدة",
            paddingHeight: 17,
          ),
          CustomAppInput(
            controller: resetPasswordBloc.passwordController,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return "كلمة المرور مطلوبه";
              } else if (value!.length < 6) {
                return "كلمة المرور يجب أن تكون أكبر من 5 أحرف";
              }
              password = value;
              return null;
            },
            labelText: "كلمة المرور",
            prefixIcon: "assets/icon/lock_icon.png",
            isPassword: true,
          ),
          CustomAppInput(
            controller: resetPasswordBloc.confirmPasswordController,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return "تأكيد كلمة المرور مطلوبه";
              } else if (value!.length < 6) {
                return "كلمة المرور يجب أن تكون أكبر من 5 أحرف";
              } else if (resetPasswordBloc.passwordController.text != value) {
                return "كلمة المرور غير متطابقة";
              } else {
                return null;
              }
            },
            labelText: "تأكيد كلمة المرور",
            prefixIcon: "assets/icon/lock_icon.png",
            isPassword: true,
            paddingBottom: 25,
          ),
          BlocBuilder(
            bloc: resetPasswordBloc,
            builder: (context, state) {
              return CustomFillButton(
                isLoading:state is ResetPasswordLoadingState,
                title: "تغيير كلمة المرور",
                onPress: () {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState!.validate()) {
                    resetPasswordBloc
                        .add(ResetPasswordEvent(phone: widget.phone));
                  } else {
                    autovalidateMode = AutovalidateMode.onUserInteraction;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
