import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';

import '../../../../../core/widgets/custom_app_input.dart';
import '../../../../../core/widgets/custom_fill_button.dart';

class ChangePasswordAccountView extends StatelessWidget {
  const ChangePasswordAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'تغيير كلمة المرور'),
        body: GestureDetector(
          onTap: () {
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();
            }
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              SizedBox(
                height: 20,
              ),
              CustomAppInput(
                isPassword: true,
                isData: true,
                fillColor: Color(0xffFAFFF5),
                labelText: 'كلمة المرور',
                prefixIcon: 'assets/icon/svg/account/Unlock.svg',
              ),
              CustomAppInput(
                isPassword: true,
                isData: true,
                fillColor: Color(0xffFAFFF5),
                labelText: 'كلمة المرور',
                prefixIcon: 'assets/icon/svg/account/Unlock.svg',
              ),
              CustomAppInput(
                isPassword: true,
                isData: true,
                fillColor: Color(0xffFAFFF5),
                labelText: 'كلمة المرور',
                prefixIcon: 'assets/icon/svg/account/Unlock.svg',
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: CustomFillButton(
                  title: 'تقييم المنتجات',
                  onPress: () {},
                ),
              ),
            ),
          ),
        ));
  }
}
