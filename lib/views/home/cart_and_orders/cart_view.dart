import 'package:animate_do/animate_do.dart';
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
          } else {
            return GestureDetector(
              onTap: () {
                if (FocusScope.of(context).hasFocus) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: Scaffold(
                // extendBody: true,
                appBar: const CustomAppBar(title: 'السلة', thereIsIcon: true),
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
                              padding: const EdgeInsets.only(
                                  right: 17, top: 7, left: 7, bottom: 7),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: TextFormField(
                                        
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            borderSide: const BorderSide(
                                                color: mainColor),
                                          ),
                                          labelText:
                                              'عندك كوبون ؟ ادخل رقم الكوبون',
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
                            model: bloc.cartData!,
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
                          title: 'الانتقال لإتمام الطلب',
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
                        return BlocBuilder(
                          bloc: bloc,
                          builder: (context, state) {
                            return ZoomIn(
                              duration: const Duration(milliseconds: 500),
                              child: AlertDialog(
                                surfaceTintColor: Colors.white,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: state is DeleteFromCartLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'هل متأكد من حذف الطلب؟',
                                          style: TextStyle(fontSize: 18),
                                          textAlign: TextAlign.center,
                                        ),
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
                                      bloc.add(DeletProductCartEvent(
                                          id: widget.model.id));
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
