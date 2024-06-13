import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/features/cart/cart_model.dart';
import 'package:vegetable_orders_project/features/my_orders/my_order_model.dart';

class CustomOrdersMony extends StatefulWidget {
  const CustomOrdersMony({
    super.key,
    this.isCompletOrder = false,
    this.isDetailsOrder = false,
    this.model,
    this.orderModel,
  });

  final bool isCompletOrder;
  final bool isDetailsOrder;
  final CartData? model;
  final OrderModel? orderModel;

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
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  "${widget.isDetailsOrder ? widget.orderModel?.priceBeforeDiscount.toString() : widget.model?.totalPriceBeforeDiscount.toString() ?? '00'}ر.س",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  'الخصم',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  '-${widget.isDetailsOrder ? widget.orderModel?.discount.toString() : widget.model?.totalDiscount.toDouble().toStringAsFixed(2)}ر.س',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            widget.isCompletOrder || widget.isDetailsOrder
                ? Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'الاجمالي بعد خصم المنتجات',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${widget.isDetailsOrder ? widget.orderModel?.orderPrice.toString() : widget.model?.totalPriceWithVat.toDouble().toStringAsFixed(2) ?? ''}ر.س",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            'سعر التوصيل',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${widget.isDetailsOrder ? widget.orderModel?.deliveryPrice.toString() : widget.model?.deliveryCost.toString() ?? ''}ر.س",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      widget.orderModel?.isVip == 1 || widget.model?.isVip == 1
                          ? Row(
                              children: [
                                Text(
                                  'خصم عميل مميز',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "${widget.isDetailsOrder ? widget.orderModel?.vipDiscount.toString() : widget.model?.vipDiscount.toString() ?? ''}ر.س",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 3,
                      ),
                      const Divider(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                    ],
                  )
                : const SizedBox(),
            Row(
              children: [
                Text(
                  'المجموع',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  '${widget.isDetailsOrder ? widget.orderModel?.totalPrice.toString() : widget.isCompletOrder ? widget.model?.sum.toDouble().toStringAsFixed(2) : widget.model?.totalPriceWithVat.toDouble().toStringAsFixed(2)}ر.س',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15.sp,
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
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 16.sp,
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
