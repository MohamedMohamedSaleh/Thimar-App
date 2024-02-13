import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';

class FinishOrderSheet extends StatelessWidget {
  const FinishOrderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 16),
        child: SizedBox(
          height: 290,
          child: Column(
            children: [
              const Text(
                'البطاقات المحفوظة',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 21,
              ),
              SizedBox(
                height: 105,
                child: ListView(
                  padding: const EdgeInsets.only(right: 16),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    AppImage(
                      'assets/images/black_visa.png',
                      height: 105,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    AppImage(
                      'assets/images/green_visa.png',
                      height: 105,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  CustomAppBarIcon(
                    isBack: false,
                    height: 26,
                    width: 26,
                    child: Icon(
                      Icons.add_rounded,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'إضافة بطاقة دفع',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
