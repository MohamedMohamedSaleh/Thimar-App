import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import 'package:vegetable_orders_project/views/auth/register/bloc/register_bloc.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../generated/locale_keys.g.dart';
import '../../sheets/cities_sheet.dart';
import '../login/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final bloc = KiwiContainer().resolve<RegisterBloc>();
  @override
  void dispose() {
    bloc.cityController.dispose();
    bloc.confirmPasswordController.dispose();
    bloc.nameController.dispose();
    bloc.passwordController.dispose();
    bloc.phoneController.dispose();
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
                child: Form(
                  autovalidateMode: bloc.autovalidateMode,
                  key: bloc.formKey,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: ListView(
                        children: [
                          CustomIntroduction(
                            phone: "",
                            mainText: LocaleKeys.register_hello_again.tr(),
                            supText: LocaleKeys
                                .register_you_can_register_new_account_now
                                .tr(),
                            paddingHeight: 22.h,
                          ),
                          CustomAppInput(
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return LocaleKeys
                                    .register_please_enter_full_name
                                    .tr();
                              }
                              return null;
                            },
                            controller: bloc.nameController,
                            labelText: LocaleKeys.register_user_name.tr(),
                            prefixIcon: "assets/icon/name_icon.png",
                          ),
                          CustomAppInput(
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return LocaleKeys
                                    .log_in_please_enter_your_mobile_number
                                    .tr();
                              } else if (value!.length < 9) {
                                return LocaleKeys
                                    .log_in_please_enter_nine_number
                                    .tr();
                              }
                              return null;
                            },
                            controller: bloc.phoneController,
                            labelText: LocaleKeys.log_in_phone_number.tr(),
                            prefixIcon: "assets/icon/phone_icon.png",
                            isPhone: true,
                          ),
                          StatefulBuilder(
                            builder: (context, setState) => Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      bloc.city = await showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(28).w,
                                            topRight:
                                                const Radius.circular(28).w,
                                          ),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        context: context,
                                        builder: (context) =>
                                            const CitiesSheet(),
                                      );
                                      if (bloc.city != null) {
                                        setState(
                                          () {},
                                        );
                                      }
                                    },
                                    child: AbsorbPointer(
                                      absorbing: true,
                                      child: CustomAppInput(
                                        validator: (value) {
                                          if (bloc.city?.name.isEmpty ?? true) {
                                            return LocaleKeys
                                                .register_please_enter_your_city
                                                .tr();
                                          }
                                          return null;
                                        },
                                        controller: bloc.cityController,
                                        labelText: bloc.city?.name ??
                                            LocaleKeys.register_city.tr(),
                                        prefixIcon: "assets/icon/city_icon.png",
                                        paddingBottom: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                (bloc.city != null)
                                    ? IconButton(
                                        onPressed: () {
                                          bloc.city = null;
                                          setState(
                                            () {},
                                          );
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.red.shade400,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          CustomAppInput(
                            validator: (String? value) {
                              if (value?.isEmpty ?? true) {
                                return LocaleKeys
                                    .log_in_please_enter_your_password_again
                                    .tr();
                              } else if (value!.length < 6) {
                                return LocaleKeys
                                    .log_in_please_enter_six_letters_at_min
                                    .tr();
                              }
                              return null;
                            },
                            controller: bloc.passwordController,
                            labelText: LocaleKeys.log_in_password.tr(),
                            prefixIcon: "assets/icon/lock_icon.png",
                            isPassword: true,
                            paddingBottom: 9.h,
                          ),
                          CustomAppInput(
                            validator: (String? value) {
                              if (value?.isEmpty ?? true) {
                                return LocaleKeys
                                    .log_in_please_enter_your_password_again
                                    .tr();
                              } else if (value!.length < 6) {
                                return LocaleKeys
                                    .log_in_please_enter_six_letters_at_min
                                    .tr();
                              } else if (value !=
                                  bloc.passwordController.text) {
                                return LocaleKeys.register_something_wrong.tr();
                              } else {
                                return null;
                              }
                            },
                            controller: bloc.confirmPasswordController,
                            labelText:
                                LocaleKeys.register_confirm_password.tr(),
                            prefixIcon: "assets/icon/lock_icon.png",
                            isPassword: true,
                            paddingBottom: 24.h,
                          ),
                          BlocBuilder(
                            bloc: bloc,
                            builder: (context, state) {
                              return CustomFillButton(
                                isLoading: state is RegisterLoadingState,
                                title: LocaleKeys.register_register.tr(),
                                onPress: () {
                                  FocusScope.of(context).unfocus();
                                  if (bloc.formKey.currentState!.validate()) {
                                    bloc.add(RegisterEvent());
                                  } else {
                                    bloc.autovalidateMode =
                                        AutovalidateMode.always;
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
                  ),
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              text: LocaleKeys.forget_password_you_have_an_account.tr(),
              buttonText: LocaleKeys.my_account_log_in.tr(),
              onPress: () {
                navigateTo(toPage: const LoginView(), isRemove: true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
