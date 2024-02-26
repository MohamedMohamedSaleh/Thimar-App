import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/features/cart/cart_model.dart';

class CustomOrdersMony extends StatelessWidget {
  const CustomOrdersMony({
    super.key,
    this.isCompletOrder = false,
    this.isDetailsOrder = false, this.model,
  });

  final bool isCompletOrder;
  final bool isDetailsOrder;
  final CartData? model;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: const Color(0xffF3F8EE),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 14, top: 7, bottom: 10, right: 7),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'إجمالي المنتجات',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  model?.totalPriceBeforeDiscount.toString()?? '',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            isCompletOrder
                ? Row(
                    children: [
                      Text(
                        'سعر التوصيل',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        model?.deliveryCost.toString()?? '',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'الخصم',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  '-${model?.totalDiscount}ر.س',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  'المجموع',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  '${model?.totalPriceWithVat}ر.س',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            isDetailsOrder ? const Divider() : const SizedBox(),
            isDetailsOrder
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تم الدفع بواسطة',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const AppImage('assets/icon/svg/blue_visa.svg'),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
