import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_form_input.dart';

class AddCardSheet extends StatelessWidget {
  const AddCardSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: ListView(
        padding:
            const EdgeInsets.only(right: 16, left: 16, bottom: 26, top: 16),
        children: [
          const Text(
            'إضافة بطاقة',
            style: TextStyle(
                color: mainColor, fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomFormInput(
              isFillColor: false, labelText: 'اسم صاحب البطاقة'),
          const SizedBox(
            height: 16,
          ),
          const CustomFormInput(isFillColor: false, labelText: 'رقم البطاقة'),
          const SizedBox(
            height: 16,
          ),
          const Row(
            children: [
              Expanded(
                  child: CustomFormInput(
                      isFillColor: false,
                      labelText: 'تاريخ الإنتهاء (شهر / سنة)')),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: CustomFormInput(
                      isFillColor: false, labelText: '(Cvv) الرقم السري ')),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          CustomFillButton(title: 'إضافة بطاقة', onPress: () {}),
          const SizedBox(
            height: 250,
          ),
        ],
      ),
    );
  }
}
