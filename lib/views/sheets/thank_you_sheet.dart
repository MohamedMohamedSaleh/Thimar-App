import 'package:flutter/material.dart';
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
          const SizedBox(
            height: 14,
          ),
          const AppImage(
            'assets/icon/svg/thankyou.svg',
            height: 215,
            width: 240,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'شكرا لك لقد تم تنفيذ طلبك بنجاح',
            style: TextStyle(
                color: mainColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            'يمكنك متابعة حالة الطلب او الرجوع للرئسيية',
            style: TextStyle(
                color: Color(0xffACACAC),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: CustomFillButton(
                    title: 'طلباتي',
                    onPress: () {
                      navigateTo(toPage: const HomeView(isNavigatToOrder: true,), isRemove: true);
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        navigateTo(toPage: const HomeView(), isRemove: true);
                      },
                      child: const Text(
                        'الرئيسية',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }
}
