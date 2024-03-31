import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/views/home/pages/my_orders/screens/order_details_view.dart';

import '../../../../../features/my_orders/model.dart';
import '../../../widgets/custom_decorated_box.dart';

class CustomOrdersItem extends StatelessWidget {
  const CustomOrdersItem({
    super.key,
    this.isDetailsOrder = false,
    this.isFinished = false,
    this.ordersModel,
  });
  final bool isDetailsOrder;
  final bool isFinished;
  final CurrentOrdersModel? ordersModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          !isDetailsOrder
              ? isFinished
                  ? navigateTo(
                      toPage:  OrderDetailsView(
                        ordersModel: ordersModel!,
                        isFinished: true,
                      ),
                    )
                  : navigateTo(
                      toPage:  OrderDetailsView(
                        ordersModel: ordersModel!,

                        isFinished: false,
                      ),
                    )
              : null;
        },
        child: Container(
          height: 95,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 17, color: Colors.black.withOpacity(0.03))
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "طلب #${ordersModel!.id}",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        // isDetailsOrder? SizedBox(height: 2,): SizedBox(),
                        Text(
                          ordersModel!.date,
                          style: const TextStyle(
                              color: Color((0xff9C9C9C)),
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: isDetailsOrder ? 5 : 9,
                        top: isDetailsOrder ? 4 : 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7)),
                              color: !isFinished
                                  ? const Color(0xffEAFFD5)
                                  : const Color(0xffFFE4E4)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: isDetailsOrder ? 3 : 4),
                            child: Text(ordersModel!.status == 'pending'
                                ? 'جاري التحضير'
                                : 'طلب ملغي'),
                          ),
                        ),
                        isDetailsOrder
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  '${ordersModel!.totalPrice}ر.س',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                height: 5,
                color: mainColor.withOpacity(0.08),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 10),
                child: Row(
                  children: [
                    ...List.generate(
                        ordersModel!.products.length > 3
                            ? 3
                            : ordersModel!.products.length,
                        (index) => CustomDecoratedBox(
                              product: ordersModel!.products[index],
                            )),
                    // const CustomDecoratedBox(),
                    // const CustomDecoratedBox(),
                    // const CustomDecoratedBox(),
                    ordersModel!.products.length > 3
                        ? CustomDecoratedBox(
                          count:ordersModel!.products.length- 3,
                            isText: true,
                          )
                        : const SizedBox(),
                    const Spacer(),
                    isDetailsOrder
                        ? const CustomAppBarIcon(
                            height: 24,
                            width: 24,
                            isBack: false,
                            color: Color(0xffEDF5E6),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: mainColor,
                              size: 15,
                            ),
                          )
                        : Text(
                            '${ordersModel!.totalPrice}ر.س',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
