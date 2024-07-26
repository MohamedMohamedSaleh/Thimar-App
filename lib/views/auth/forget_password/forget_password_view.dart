import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import 'package:vegetable_orders_project/views/auth/forget_password/bloc/forget_password_bloc.dart';
import 'package:vegetable_orders_project/views/auth/register/register_view.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../generated/locale_keys.g.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final bloc = KiwiContainer().resolve<ForgetPasswordBloc>();
  @override
  void dispose() {
    bloc.close();
    super.dispose();
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
                ).r,
                child: FormForgetPassword(
                  bloc: bloc,
                ),
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

class FormForgetPassword extends StatefulWidget {
  const FormForgetPassword({
    super.key,
    required this.bloc,
  });
  final ForgetPasswordBloc bloc;
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
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8).r,
          children: [
            CustomIntroduction(
              mainText: LocaleKeys.forget_password_forget_password.tr(),
              supText: LocaleKeys.forget_password_enter_your_phone_number.tr(),
              paddingHeight: 24.h,
            ),
            CustomAppInput(
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return LocaleKeys.log_in_please_enter_your_mobile_number;
                } else if (value!.length < 10) {
                  return LocaleKeys.log_in_please_enter_nine_number.tr();
                }
                return null;
              },
              labelText: LocaleKeys.log_in_phone_number.tr(),
              prefixIcon: "assets/icon/phone_icon.png",
              isPhone: true,
              paddingBottom: 28.h,
              controller: phoneController,
            ),
            BlocBuilder(
              bloc: widget.bloc,
              builder: (context, state) {
                return CustomFillButton(
                  isLoading: state is ForgetPasswordLoading,
                  title: LocaleKeys.forget_password_confirm_phone_number.tr(),
                  onPress: () {
                    FocusScope.of(context).unfocus();
                    if (formKey.currentState!.validate()) {
                      widget.bloc.add(
                          ForgetPasswordEvent(phone: phoneController.text));
                    } else {
                      autovalidateMode = AutovalidateMode.onUserInteraction;

                      setState(() {});
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
