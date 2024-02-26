import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import 'package:vegetable_orders_project/views/auth/login/cubit/login_cubit.dart';

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
            body: const SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16,
                  left: 16,
                ),
                child: FormLogin(),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              text: "ليس لديك حساب ؟",
              buttonText: " تسجيل الأن",
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

class FormLogin extends StatefulWidget {
  const FormLogin({
    super.key,
  });

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final cubit = KiwiContainer().resolve<LoginCubit>();

  // late LoginCubit cubit;

  // @override
  // void initState() {
  //   super.initState();
  //   cubit = BlocProvider.of(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      autovalidateMode: cubit.autovalidateMode,
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          const CustomIntroduction(
            mainText: "مرحبا بك مرة أخرى",
            supText: "يمكنك تسجيل الدخول الأن",
            paddingHeight: 28,
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
            controller: cubit.phoneController,
          ),
          CustomAppInput(
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return "كلمة المرور مطلوبه";
              } else if (value!.length < 6) {
                return "كلمة المرور يجب أن تكون أكبر من 5 أحرف";
              }
              return null;
            },
            controller: cubit.passwordController,
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
                navigateTo(toPage: const ForgetPasswordView());
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return CustomFillButton(
                isLoading: state is LoginLoadingState,
                title: "تسجيل الدخول",
                onPress: () {
                  cubit.login();
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
