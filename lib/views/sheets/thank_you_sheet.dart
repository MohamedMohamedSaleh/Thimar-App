import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/views/home/home_view.dart';

class ThankYouSheet extends StatelessWidget {
  const ThankYouSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 14.h,
          ),
          AppImage(
            'assets/icon/svg/thankyou.svg',
            height: 215.h,
            width: 240.w,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'شكرا لك لقد تم تنفيذ طلبك بنجاح',
            style: TextStyle(
                color: mainColor, fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            'يمكنك متابعة حالة الطلب او الرجوع للرئسيية',
            style: TextStyle(
                color: const Color(0xffACACAC),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 26.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomFillButton(
                    title: 'طلباتي',
                    onPress: () {
                      navigateTo(
                          toPage: const HomeView(
                            isNavigatToOrder: true,
                          ),
                          isRemove: true);
                    },
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: SizedBox(
                    height: 55.h,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        // navigateTo(toPage:  HomeView(), isRemove: true);
                      },
                      child: Text(
                        'الرئيسية',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
        ],
      ),
    );
  }
}
