import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/features/cart/cart_model.dart';

class CustomOrdersMony extends StatefulWidget {
  const CustomOrdersMony({
    super.key,
    this.isCompletOrder = false,
    this.isDetailsOrder = false, this.model,
  });

  final bool isCompletOrder;
  final bool isDetailsOrder;
  final CartData? model;

  @override
  State<CustomOrdersMony> createState() => _CustomOrdersMonyState();
}

class _CustomOrdersMonyState extends State<CustomOrdersMony> {
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
                  widget.model?.totalPriceBeforeDiscount.toString()?? '',
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
            widget.isCompletOrder
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
                        widget.model?.deliveryCost.toString()?? '',
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
                  '-${widget.model?.totalDiscount}ر.س',
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
                  '${widget.model?.totalPriceWithVat}ر.س',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            widget.isDetailsOrder ? const Divider() : const SizedBox(),
            widget.isDetailsOrder
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
