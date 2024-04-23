import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/features/my_orders/all_orders_model.dart';
import 'package:vegetable_orders_project/views/home/cart_and_orders/widget/custom_orders_mony.dart';
import 'package:vegetable_orders_project/views/home/pages/my_orders/screens/product_evaluation_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_orders/widgets/custom_orders_item.dart';

import '../../../../../core/widgets/custom_fill_button.dart';
import '../../../../../features/my_orders/get_my_orders/my_orders_bloc.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({
    super.key,
    this.isFinished = false,
    required this.id,
    required this.ordersModel,
  });
  final bool isFinished;
  final int id;
  final CurrentOrdersModel ordersModel;

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  final bloc = KiwiContainer().resolve<MyOrdersBloc>();
  @override
  void initState() {
    super.initState();
    bloc.add(GetMyOrderEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تفاصيل المنتج',
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetOrderLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CustomOrdersItem(
                  ordersModel: widget.ordersModel,
                  isDetailsOrder: true,
                  isFinished: widget.isFinished ? true : false,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
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
                            SizedBox(
                              width: 200,
                              child: Text(
                                bloc.orderModel?.address?.location ?? '',
                                style: const TextStyle(
                                    color: Color(0xff999797),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Text(
                              bloc.orderModel?.address?.description ?? '',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: const AppImage(
                            'assets/images/google_map.jpg',
                            height: 45,
                            width: 55,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('ملخص الطلب', style: _textStyle),
                CustomOrdersMony(
                  orderModel: bloc.orderModel,
                  isDetailsOrder: true,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            );
          }
        },
      ),
      extendBody: true,
      bottomNavigationBar: widget.isFinished
          ? ColoredBox(
              color: Colors.transparent,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 16, bottom: 20, top: 5, left: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomFillButton(
                      title: 'تقييم المنتجات',
                      onPress: () {
                        navigateTo(toPage: const ProductEvaluationView());
                      },
                    ),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: SizedBox(
                height: 55,
                child: BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is CancelOrderLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(color: Color(0xffff0000),),
                      );
                    }
                    return FilledButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: const Color(0xffFFE1E1),
                      ),
                      onPressed: () {
                        bloc.add(CancelOrderEvent(id: widget.id));
                      },
                      child: const Text(
                        'إلغاء الطلب',
                        style: TextStyle(
                            color: Color(0xffFF0000),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

const TextStyle _textStyle =
    TextStyle(color: mainColor, fontSize: 17, fontWeight: FontWeight.bold);
