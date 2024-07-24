import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/auth/login/bloc/login_bloc.dart';

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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                ).r,
                child: const FormLogin(),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              text: LocaleKeys.log_in_dont_have_an_account.tr(),
              buttonText: LocaleKeys.log_in_register_now.tr(),
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
  final bloc = KiwiContainer().resolve<LoginBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.passwordController.dispose();
    bloc.phoneController.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: bloc.formKey,
      autovalidateMode: bloc.autovalidateMode,
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          CustomIntroduction(
            mainText: LocaleKeys.register_hello_again.tr(),
            supText: LocaleKeys.log_in_you_can_login_now.tr(),
            paddingHeight: 28.h,
          ),
          CustomAppInput(
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return LocaleKeys.log_in_please_enter_your_mobile_number.tr();
              } else if (value!.length < 10) {
                return LocaleKeys.log_in_please_enter_nine_number.tr();
              }
              return null;
            },
            labelText: LocaleKeys.log_in_phone_number.tr(),
            prefixIcon: "assets/icon/phone_icon.png",
            isPhone: true,
            controller: bloc.phoneController,
          ),
          CustomAppInput(
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return LocaleKeys.log_in_please_enter_your_password_again.tr();
              } else if (value!.length < 6) {
                return LocaleKeys.log_in_please_enter_six_letters_at_min.tr();
              }
              return null;
            },
            controller: bloc.passwordController,
            labelText: LocaleKeys.log_in_password.tr(),
            prefixIcon: "assets/icon/lock_icon.png",
            isPassword: true,
            paddingBottom: 0,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              child: Text(
                LocaleKeys.log_in_forget_password.tr(),
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    height: .1,
                    color: Colors.black),
              ),
              onPressed: () {
                navigateTo(toPage: const ForgetPasswordView());
              },
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              return CustomFillButton(
                isLoading: state is LoginLoadingState,
                title: LocaleKeys.my_account_log_in.tr(),
                onPress: () {
                  bloc.add(LoginEvent());
                },
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
