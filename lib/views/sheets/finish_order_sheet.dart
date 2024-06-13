import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';

class FinishOrderSheet extends StatelessWidget {
  const FinishOrderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(20).w,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 16).h,
        child: SizedBox(
          height: 290.h,
          child: Column(
            children: [
              Text(
                'البطاقات المحفوظة',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 21.h,
              ),
              SizedBox(
                height: 105.h,
                child: ListView(
                  padding: EdgeInsets.only(right: 16.w),
                  scrollDirection: Axis.horizontal,
                  children: [
                    AppImage(
                      'assets/images/black_visa.png',
                      height: 105.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    AppImage(
                      'assets/images/green_visa.png',
                      height: 105.h,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  CustomAppBarIcon(
                    isBack: false,
                    height: 26.w,
                    width: 26.w,
                    child: const Icon(
                      Icons.add_rounded,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    'إضافة بطاقة دفع',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: CustomFillButton(
                    title: 'تأكيد الأختيار',
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
