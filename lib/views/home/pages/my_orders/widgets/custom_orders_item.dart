import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/views/home/pages/my_orders/screens/order_details_view.dart';

import '../../../widgets/custom_decorated_box.dart';

class CustomOrdersItem extends StatelessWidget {
  const CustomOrdersItem(
      {super.key, this.isDetailsOrder = false, this.isFinished = false});
  final bool isDetailsOrder;
  final bool isFinished;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          !isDetailsOrder
              ? isFinished
                  ? navigateTo(
                      toPage: const OrderDetailsView(
                        isFinished: true,
                      ),
                    )
                  : navigateTo(
                      toPage: const OrderDetailsView(
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
                          "طلب #4587",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        // isDetailsOrder? SizedBox(height: 2,): SizedBox(),
                        const Text(
                          "27,يونيو,2021",
                          style: TextStyle(
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
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              color: Color(0xffEAFFD5)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: isDetailsOrder ? 3 : 4),
                            child: Text(!isFinished ? 'جاري التحضير' : 'منتهي'),
                          ),
                        ),
                        isDetailsOrder
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  '180ر.س',
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
                    const CustomDecoratedBox(),
                    const CustomDecoratedBox(),
                    const CustomDecoratedBox(),
                    const CustomDecoratedBox(
                      isText: true,
                    ),
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
                            '180ر.س',
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
