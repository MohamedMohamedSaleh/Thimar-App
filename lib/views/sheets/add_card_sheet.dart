import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            const EdgeInsets.only(right: 16, left: 16, bottom: 26, top: 16).w,
        children: [
          Text(
            'إضافة بطاقة',
            style: TextStyle(
                color: mainColor, fontSize: 15.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          const CustomFormInput(
              isFillColor: false, labelText: 'اسم صاحب البطاقة'),
          SizedBox(
            height: 16.h,
          ),
          const CustomFormInput(
            isFillColor: false,
            labelText: 'رقم البطاقة',
            isPhone: true,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              const Expanded(
                  child: CustomFormInput(
                isFillColor: false,
                labelText: 'تاريخ الإنتهاء (شهر / سنة)',
                isPhone: true,
              )),
              SizedBox(
                width: 16.w,
              ),
              const Expanded(
                  child: CustomFormInput(
                isFillColor: false,
                labelText: '(Cvv) الرقم السري ',
                isPhone: true,
              )),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          CustomFillButton(title: 'إضافة بطاقة', onPress: () {}),
          SizedBox(
            height: 250.h,
          ),
        ],
      ),
    );
  }
}
