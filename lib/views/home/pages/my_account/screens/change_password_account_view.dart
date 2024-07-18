import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/edit_password/edit_password_bloc.dart';

import '../../../../../core/widgets/custom_app_input.dart';
import '../../../../../core/widgets/custom_fill_button.dart';

class ChangePasswordAccountView extends StatefulWidget {
  const ChangePasswordAccountView({super.key});

  @override
  State<ChangePasswordAccountView> createState() =>
      _ChangePasswordAccountViewState();
}

class _ChangePasswordAccountViewState extends State<ChangePasswordAccountView> {
  final bloc = KiwiContainer().resolve<EditPasswordBloc>();
  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        bloc.confirmNewPassword.clear();
        bloc.newPassword.clear();
        bloc.oldPassword.clear();
      },
      child: ColoredBox(
        color: Colors.white,
        child: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: Scaffold(
              appBar: CustomAppBar(
                  title: LocaleKeys.reset_password_change_password.tr()),
              body: GestureDetector(
                onTap: () {
                  if (FocusScope.of(context).hasFocus) {
                    FocusScope.of(context).unfocus();
                  }
                },
                child: Form(
                  key: bloc.formKey,
                  autovalidateMode: bloc.autovalidateMode,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomAppInput(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return LocaleKeys
                                .reset_password_please_enter_new_password_again
                                .tr();
                          }
                          return null;
                        },
                        controller: bloc.oldPassword,
                        isPassword: true,
                        isData: true,
                        fillColor: const Color(0xffFAFFF5),
                        labelText:
                            LocaleKeys.reset_password_current_password.tr(),
                        prefixIcon: 'assets/icon/svg/account/Unlock.svg',
                      ),
                      CustomAppInput(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return LocaleKeys
                                .reset_password_please_enter_new_password_in_6_letters_at_min
                                .tr();
                          }
                          return null;
                        },
                        controller: bloc.newPassword,
                        isPassword: true,
                        isData: true,
                        fillColor: const Color(0xffFAFFF5),
                        labelText: LocaleKeys.reset_password_new_password.tr(),
                        prefixIcon: 'assets/icon/svg/account/Unlock.svg',
                      ),
                      CustomAppInput(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return LocaleKeys
                                .reset_password_please_enter_new_password_again
                                .tr();
                          } /* else if (bloc.newPassword.text !=
                              bloc.confirmNewPassword.text) {
                            return 'كلمة الممرور الجديدة غير متطابقة!';
                          } */

                          return null;
                        },
                        controller: bloc.confirmNewPassword,
                        isPassword: true,
                        isData: true,
                        fillColor: const Color(0xffFAFFF5),
                        labelText:
                            LocaleKeys.reset_password_confirm_new_password.tr(),
                        prefixIcon: 'assets/icon/svg/account/Unlock.svg',
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is EditPasswordLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(26),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  }
                  return SafeArea(
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomFillButton(
                            title:
                                LocaleKeys.reset_password_change_password.tr(),
                            onPress: () {
                              FocusScope.of(context).unfocus();
                              bloc.add(EditPasswordEvent());
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
