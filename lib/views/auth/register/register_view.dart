import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_bottom_navigation.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_intoduction.dart';
import 'package:vegetable_orders_project/models/cities_model.dart';
import '../../../core/logic/helper_methods.dart';
import '../../sheets/cities_sheet.dart';
import '../confirm_code/confirm_code_view.dart';
import '../login/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    CityModel? city;
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
                  children: [
                    const CustomIntroduction(
                      mainText: "مرحبا بك مرة أخرى",
                      supText: "يمكنك تسجيل الدخول الأن",
                      paddingHeight: 22,
                    ),
                    const CustomAppInput(
                      labelText: "اسم المستخدم",
                      prefixIcon: "assets/icon/name_icon.png",
                    ),
                    const CustomAppInput(
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
                                city = await showModalBottomSheet(
                                  context: context,
                                  builder: (context) => const CitiesSheet(),
                                );
                                if (city != null) {
                                  setState(
                                    () {},
                                  );
                                }
                              },
                              child: CustomAppInput(
                                labelText: city?.name ?? "المدينة",
                                prefixIcon: "assets/icon/city_icon.png",
                                paddingBottom: 0,
                                isEnabled: false,
                              ),
                            ),
                          ),
                          (city != null)
                              ? IconButton(
                                  onPressed: () {
                                    city = null;
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
                    const SizedBox(
                      height: 9,
                    ),
                    const CustomAppInput(
                      labelText: "كلمة المرور",
                      prefixIcon: "assets/icon/lock_icon.png",
                      isPassword: true,
                      paddingBottom: 9,
                    ),
                    const CustomAppInput(
                      labelText: "تأكيد كلمة المرور",
                      prefixIcon: "assets/icon/lock_icon.png",
                      isPassword: true,
                      paddingBottom: 24,
                    ),
                    CustomFillButton(
                      title: "تسجيل الدخول",
                      onPress: () {
                        FocusScope.of(context).unfocus();
                        navegateTo(
                          toPage: const ConfirmCodeView(
                            isActive: true,
                          ),
                        );
                      },
                    ),
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
