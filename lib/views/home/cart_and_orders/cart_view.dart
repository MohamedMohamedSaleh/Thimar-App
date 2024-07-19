import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/features/cart/cart_bloc.dart';
import 'package:vegetable_orders_project/features/cart/cart_model.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/cart_and_orders/complet_order_view.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_plus_minus_product.dart';

import 'widget/custom_orders_mony.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final bloc = KiwiContainer().resolve<CartBloc>();
  @override
  initState() {
    super.initState();
    bloc.add(ShowCartEvent(isLoading: true));
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetCartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (bloc.list.isEmpty) {
            return const SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImage(
                    'assets/icon/no_data_cart.png',
                    width: 200,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'لا توجد طلبات',
                    style: TextStyle(
                      fontSize: 25,
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                if (FocusScope.of(context).hasFocus) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: Scaffold(
                // extendBody: true,
                appBar: CustomAppBar(
                    title: LocaleKeys.cart_cart.tr(), thereIsIcon: true),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (context, index) => _ItemOrder(
                            index: index,
                            model: bloc.list[index],
                          ),
                          itemCount: bloc.list.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 17,
                                  color:
                                      const Color(0xff000000).withOpacity(0.02),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 17, top: 7, end: 7, bottom: 7),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: TextFormField(
                                        autofocus: false,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            borderSide: const BorderSide(
                                                color: mainColor),
                                          ),
                                          labelText: LocaleKeys
                                              .cart_you_have_coupon
                                              .tr(),
                                          labelStyle: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffB9C9A8),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(6),
                                    height: 37,
                                    width: 56,
                                    decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      LocaleKeys.categories_apply.tr(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white),
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
                            // bloc.cartData!.vipMessage,
                            LocaleKeys.cart_all_prices.tr(),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomOrdersMony(
                            model: bloc.cartData,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: ColoredBox(
                  color: Colors.transparent,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 16, bottom: 20, left: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomFillButton(
                          title: LocaleKeys.cart_move_to_complete_order.tr(),
                          onPress: () {
                            navigateTo(toPage: const CompletOrderView());
                          },
                        ),
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
  final bloc = KiwiContainer().resolve<CartBloc>();

  @override
  initState() {
    super.initState();
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
                    '${widget.model.price} ${LocaleKeys.r_s.tr()}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomPlusOrMinusProduct(
                    isProductDetails: false,
                    id: widget.model.id,
                    index: widget.index,
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
                        return ZoomIn(
                          duration: const Duration(milliseconds: 500),
                          child: AlertDialog(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                            content: const SizedBox.shrink(
                                // height: 20,
                                ),
                            surfaceTintColor: Colors.white,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            titlePadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            title: Text(
                              LocaleKeys.cart_Are_you_sure_to_delete_the_request
                                  .tr(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            actionsAlignment: MainAxisAlignment.spaceAround,
                            actions: [
                              FilledButton(
                                style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Text(
                                  LocaleKeys.cart_delete.tr(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () async {
                                  bloc.add(DeletProductCartEvent(
                                      id: widget.model.id));
                                },
                              ),
                              // const SizedBox(
                              //   width: 16,
                              // ),
                              FilledButton(
                                style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Text(
                                  LocaleKeys.cart_cancel.tr(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );

                    //
                  },
                  height: 26,
                  width: 26,
                  color: const Color(0xffFF0000).withOpacity(0.13),
                  child: BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) {
                      return state is DeleteFromCartLoadingState &&
                              state.id == widget.model.id
                          ? const Center(
                              child: SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                  )),
                            )
                          : const AppImage('assets/icon/svg/Trash.svg');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
