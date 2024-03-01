
import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/core/widgets/custom_outline_send_button.dart';
import 'package:vegetable_orders_project/views/home/cart_and_orders/cart_view.dart';

import '../../features/products/products_model.dart';

class SuccessAddToCartSheet extends StatelessWidget {
  const SuccessAddToCartSheet({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CustomAppBarIcon(
                  isBack: false,
                  height: 18,
                  width: 18,
                  child: Icon(
                    Icons.check_rounded,
                    size: 14,
                    color: mainColor,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'تم إضافة المنتج بنجاح',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: mainColor),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _Item(
              model: model,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 47,
                    child: CustomFillButton(
                        title: 'التحويل إلى السلة',
                        onPress: () {
                          navigateTo(toPage: const CartView());
                        }),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: SizedBox(
                        width: double.infinity,
                        child: SizedBox(
                            height: 47,
                            child: CustomOutlineButton(
                              onPress: () {},
                              title: 'تصفح العروض',
                            ))))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: AppImage(
            model.mainImage,
            height: 61,
            width: 66,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 11,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.title,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w500, color: mainColor),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'الكمية : 1',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff7E7E7E)),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              '${model.price} ر.س',
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: mainColor),
            ),
          ],
        ),
      ],
    );
  }
}
