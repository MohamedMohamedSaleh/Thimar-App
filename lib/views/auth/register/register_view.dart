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
                  child: ListView(
                    children: [
                      CustomIntroduction(
                        mainText: "مرحبا بك مرة أخرى",
                        supText: "يمكنك تسجيل الدخول الأن",
                        paddingHeight: 22.h,
                      ),
                      CustomAppInput(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "اسم المستخدم مطلوب";
                          }
                          return null;
                        },
                        controller: bloc.nameController,
                        labelText: "اسم المستخدم",
                        prefixIcon: "assets/icon/name_icon.png",
                      ),
                      CustomAppInput(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "رقم الجوال مطلوب";
                          } else if (value!.length < 10) {
                            return "رقم الهاتف يجب أن يكون أكبر من 10 أرقام";
                          }
                          return null;
                        },
                        controller: bloc.phoneController,
                        labelText: "رقم الجوال",
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
                                        topLeft: const Radius.circular(28).w,
                                        topRight: const Radius.circular(28).w,
                                      ),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    context: context,
                                    builder: (context) => const CitiesSheet(),
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
                                        return "أدخل مدينتك";
                                      }
                                      return null;
                                    },
                                    controller: bloc.cityController,
                                    labelText: bloc.city?.name ?? "المدينة",
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
                            return "كلمة المرور مطلوبه";
                          } else if (value!.length <= 6) {
                            return "كلمة المرور يجب أن تكون أكبر من 6 أحرف";
                          }
                          return null;
                        },
                        controller: bloc.passwordController,
                        labelText: "كلمة المرور",
                        prefixIcon: "assets/icon/lock_icon.png",
                        isPassword: true,
                        paddingBottom: 9.h,
                      ),
                      CustomAppInput(
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return "تأكيد كلمة المرور مطلوبه";
                          } else if (value!.length <= 6) {
                            return "كلمة المرور يجب أن تكون أكبر من 6 أحرف";
                          } else if (value != bloc.passwordController.text) {
                            return "كلمة المرور غير متطابقة";
                          } else {
                            return null;
                          }
                        },
                        controller: bloc.confirmPasswordController,
                        labelText: "تأكيد كلمة المرور",
                        prefixIcon: "assets/icon/lock_icon.png",
                        isPassword: true,
                        paddingBottom: 24.h,
                      ),
                      BlocBuilder(
                        bloc: bloc,
                        builder: (context, state) {
                          return CustomFillButton(
                            isLoading: state is RegisterLoadingState,
                            title: "تسجيل الدخول",
                            onPress: () {
                              FocusScope.of(context).unfocus();
                              bloc.add(RegisterEvent());
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
