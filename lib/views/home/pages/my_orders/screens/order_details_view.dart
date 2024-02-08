import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/views/home/basket_and_orders/widget/custom_orders_mony.dart';
import 'package:vegetable_orders_project/views/home/pages/my_orders/widgets/custom_orders_item.dart';

import '../../../../../core/widgets/custom_fill_button.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, this.isFinished = false});

  final bool isFinished;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تفاصيل المنتج',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
           CustomOrdersItem(
            isDetailsOrder: true,
            isFinished:isFinished? true : false,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('عنوان التوصيل', style: _textStyle),
          const SizedBox(
            height: 18,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 17,
                    // offset: Offset(0,6),
                    color: Colors.black.withOpacity(0.02),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'المنزل',
                        style: _textStyle.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const Text('شقة 40',
                          style: TextStyle(
                              color: Color(0xff999797),
                              fontSize: 12,
                              fontWeight: FontWeight.w300)),
                      const Text('شارع العليا الرياض 12521السعودية',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                    ],
                  ),
                  const Spacer(),
                  const AppImage(
                    'assets/images/vegetable_basket.png',
                    height: 45,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('ملخص الطلب', style: _textStyle),
          const CustomOrdersMony(
            isDetailsOrder: true,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: !isFinished
          ? ColoredBox(
              color: Colors.transparent,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 16, bottom: 20, top: 5, left: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomFillButton(
                      title: 'الانتقال لإتمام الطلب',
                      onPress: () {},
                    ),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: SizedBox(
                height: 55,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color(0xffFFE1E1),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'إلغاء الطلب',
                    style: TextStyle(
                        color: Color(0xffFF0000),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
    );
  }
}

const TextStyle _textStyle =
    TextStyle(color: mainColor, fontSize: 17, fontWeight: FontWeight.bold);
