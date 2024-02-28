import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/features/cart/cart_cubit.dart';
import 'package:vegetable_orders_project/features/cart/cart_model.dart';
import 'package:vegetable_orders_project/features/cart/cart_states.dart';
import 'package:vegetable_orders_project/views/home/cart_and_orders/complet_order_view.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_plus_minus_product.dart';

import 'widget/custom_orders_mony.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  // final cubit = KiwiContainer().resolve<CartCubit>()..showCart();
  late CartCubit cubit;
  @override
  initState() {
    super.initState();

    cubit = BlocProvider.of(context)..showCart();
  }

  @override
  Widget build(BuildContext context) {
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return ColoredBox(
      color: Colors.white,
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is GetCartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              extendBody: true,
              appBar: const CustomAppBar(title: 'السلة', thereIsIcon: true),
              body: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) => _ItemOrder(
                      index: index,
                      model: cubit.cartData!.list[index],
                    ),
                    itemCount: cubit.cartData!.list.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 17,
                          color: const Color(0xff000000).withOpacity(0.02),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 17, top: 7, left: 7, bottom: 7),
                      child: Row(
                        children: [
                          const Text(
                            'عندك كوبون ؟ ادخل رقم الكوبون',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffB9C9A8),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 37,
                            child: CustomFillButton(
                              title: 'تطبيق',
                              onPress: () {},
                              radius: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'جميع الأسعار تشمل قيمة الضريبة المضافة 15%',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomOrdersMony(
                    model: cubit.cartData,
                  ),
                  !isKeyboardOpen
                      ? const SizedBox(
                          height: 70,
                        )
                      : const SizedBox(),
                ],
              ),
              bottomNavigationBar: ColoredBox(
                color: Colors.transparent,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 16, bottom: 20, top: 5, left: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomFillButton(
                        title: 'الانتقال لإتمام الطلب',
                        onPress: () {
                          navigateTo(toPage: const CompletOrderView());
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _ItemOrder extends StatefulWidget {
  const _ItemOrder({required this.model, required this.index});
  final CartModel model;
  final int index;

  @override
  State<_ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<_ItemOrder> {
  late CartCubit cubit;
  @override
  initState() {
    super.initState();

    cubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  blurRadius: 17,
                  color: const Color(0xff000000).withOpacity(0.02))
            ]),
        child: SizedBox(
          height: 90,
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 8, right: 6, bottom: 8, left: 8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: AppImage(
                    widget.model.image,
                    height: 75,
                    width: 84,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    '${widget.model.price} ر.س',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomPlusOrMinusProduct(
                    isProductDetails: false,
                    id: widget.model.id,
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CustomAppBarIcon(
                  isBack: false,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return BlocBuilder<CartCubit, CartStates>(
                          builder: (context, state) {
                            return ZoomIn(
                              duration: const Duration(milliseconds: 500),
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: state is DeleteFromCartLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : const Text(
                                        'هل متأكد من حذف الطلب؟',
                                        textAlign: TextAlign.center,
                                      ),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  FilledButton(
                                    style: FilledButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: const Text('حذف'),
                                    onPressed: () async {
                                      await cubit.deleteProduct(
                                          id: widget.model.id);
                                      if (!context.mounted) return;
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  FilledButton(
                                    style: FilledButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: const Text('إلغاء'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                    //
                  },
                  height: 26,
                  width: 26,
                  color: const Color(0xffFF0000).withOpacity(0.13),
                  child: const AppImage('assets/icon/svg/Trash.svg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
