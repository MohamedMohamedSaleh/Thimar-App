import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_orders/screens/order_details_view.dart';

import '../../../../../features/my_orders/all_orders_model.dart';
import '../../../widgets/custom_decorated_box.dart';

class CustomOrdersItem extends StatefulWidget {
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
  State<CustomOrdersItem> createState() => _CustomOrdersItemState();
}

class _CustomOrdersItemState extends State<CustomOrdersItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          !widget.isDetailsOrder
              ? widget.isFinished
                  ? navigateTo(
                      toPage: OrderDetailsView(
                        id: widget.ordersModel!.id,
                        ordersModel: widget.ordersModel!,
                        isFinished: true,
                      ),
                    )
                  : navigateTo(
                      toPage: OrderDetailsView(
                        id: widget.ordersModel!.id,
                        ordersModel: widget.ordersModel!,
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
                    padding:
                        const EdgeInsetsDirectional.only(top: 4, start: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${LocaleKeys.orders_order.tr()} #${widget.ordersModel!.id}",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        // isDetailsOrder? SizedBox(height: 2,): SizedBox(),
                        Text(
                          widget.ordersModel!.date,
                          style: const TextStyle(
                              color: Color((0xff9C9C9C)),
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        end: widget.isDetailsOrder ? 5 : 9,
                        top: widget.isDetailsOrder ? 4 : 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7)),
                              color: !widget.isFinished
                                  ? const Color(0xffEDF5E6)
                                  : const Color(0xffFFE4E4)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: widget.isDetailsOrder ? 3 : 4),
                            child: Text(
                              widget.ordersModel!.status == 'pending'
                                  ? context.locale.languageCode == "en"
                                      ? "Pending"
                                      : 'بإنتظار الموافقة'
                                  : context.locale.languageCode == "en"
                                      ? "Order canceled"
                                      : 'طلب ملغي',
                              style: TextStyle(
                                  color: widget.ordersModel!.status == 'pending'
                                      ? mainColor
                                      : const Color(0xffFF0000),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        widget.isDetailsOrder
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8, top: 5),
                                child: Text(
                                  '${widget.ordersModel!.totalPrice} ${LocaleKeys.r_s.tr()}',
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
                padding: const EdgeInsetsDirectional.only(end: 16, start: 10),
                child: Row(
                  children: [
                    ...List.generate(
                        widget.ordersModel!.products.length > 3
                            ? 3
                            : widget.ordersModel!.products.length,
                        (index) => CustomDecoratedBox(
                              product: widget.ordersModel!.products[index],
                            )),
                    widget.ordersModel!.products.length > 3
                        ? CustomDecoratedBox(
                            count: widget.ordersModel!.products.length - 3,
                            isText: true,
                          )
                        : const SizedBox(),
                    const Spacer(),
                    widget.isDetailsOrder
                        ? const CustomAppBarIcon(
                            height: 24,
                            width: 24,
                            isBack: false,
                            color: Color(0xffEDF5E6),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: mainColor,
                              size: 16,
                            ),
                          )
                        : Text(
                            '${widget.ordersModel!.totalPrice} ${LocaleKeys.r_s.tr()}',
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
