import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';

import '../widgets/custom_form_input.dart';

class WalletChargeNowView extends StatelessWidget {
  const WalletChargeNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'شحن الان'),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(
              height: 56,
            ),
            Text(
              'معلومات المبلغ',
              style: _textStyle,
            ),
            const SizedBox(
              height: 18,
            ),
            const CustomFormInput(labelText: 'المبلغ الخاص بك', isPhone: true,),
            const SizedBox(
              height: 38,
            ),
            Text(
              'معلومات البطاقة',
              style: _textStyle,
            ),
            const SizedBox(
              height: 18,
            ),
            const CustomFormInput(labelText: 'الاسم'),
            const SizedBox(
              height: 18,
            ),
            const CustomFormInput(labelText: 'رقم البطاقة الائتمانية', isPhone: true,),
            const SizedBox(
              height: 18,
            ),
            const Row(
              children: [
                Expanded(
                  child: CustomFormInput(labelText: 'تاريخ الانتهاء', isPhone: true,),
                ),
                SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: CustomFormInput(labelText: 'الرقم المتسلسل', isPhone: true,),
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
        child: SafeArea(
          child: CustomFillButton(
            title:  'دفع الآن',
            onPress: () {},
          ),
        ),
      ),
    );
  }
}

TextStyle _textStyle = const TextStyle(
  color: mainColor,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);
