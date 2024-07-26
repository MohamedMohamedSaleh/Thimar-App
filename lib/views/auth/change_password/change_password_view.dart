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
                padding: EdgeInsets.only(
                  right: 16.w,
                  left: 16.w,
                ),
                child: FormChanegePassword(
                  phone: phone,
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              text: LocaleKeys.log_in_dont_have_an_account.tr(),
              buttonText: LocaleKeys.my_account_log_in.tr(),
              paddingBottom: 22.h,
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
  void dispose() {
    resetPasswordBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            CustomIntroduction(
              mainText: LocaleKeys.forget_password_forget_password.tr(),
              supText: LocaleKeys.reset_password_enter_new_password.tr(),
              paddingHeight: 17.h,
            ),
            CustomAppInput(
              controller: resetPasswordBloc.passwordController,
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return LocaleKeys.log_in_please_enter_your_password_again.tr();
                } else if (value!.length < 6) {
                  return LocaleKeys.log_in_please_enter_six_letters_at_min.tr();
                }
                password = value;
                return null;
              },
              labelText: LocaleKeys.log_in_password.tr(),
              prefixIcon: "assets/icon/lock_icon.png",
              isPassword: true,
            ),
            CustomAppInput(
              controller: resetPasswordBloc.confirmPasswordController,
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return LocaleKeys.reset_password_please_enter_new_password_again
                      .tr();
                } else if (value!.length < 6) {
                  return LocaleKeys
                      .reset_password_please_enter_new_password_in_6_letters_at_min
                      .tr();
                } else if (resetPasswordBloc.passwordController.text != value) {
                  return LocaleKeys.change_password_two_passwords_not_matching
                      .tr();
                } else {
                  return null;
                }
              },
              labelText: LocaleKeys.register_confirm_password.tr(),
              prefixIcon: "assets/icon/lock_icon.png",
              isPassword: true,
              paddingBottom: 25.h,
            ),
            BlocBuilder(
              bloc: resetPasswordBloc,
              builder: (context, state) {
                return CustomFillButton(
                  isLoading: state is ResetPasswordLoadingState,
                  title: LocaleKeys.change_password_change_password.tr(),
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
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
