import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/features/get_location.dart';
import 'package:vegetable_orders_project/features/my_orders/get_my_orders/my_orders_bloc.dart';
import 'package:vegetable_orders_project/views/home/cart_and_orders/cart_view.dart';
import 'package:vegetable_orders_project/views/sheets/titles_sheet.dart';

import '../../../../../core/logic/helper_methods.dart';
import '../../../../../features/addresses/addresses_model.dart';
import '../../../../../features/cart/cart_bloc.dart';
import '../../../../../generated/locale_keys.g.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _MainAppBarState extends State<MainAppBar> {
  final cartBloc = KiwiContainer().resolve<CartBloc>();
  AddressModel? model;
  @override
  void initState() {
    super.initState();
    cartBloc.add(ShowCartEvent(isLoading: false));
  }

  late int num = CacheHelper.getInCart() ?? 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Image.asset(
                'assets/images/vegetable_basket.png',
                fit: BoxFit.scaleDown,
                height: 21,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                LocaleKeys.home_thamara_basket.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: context.locale.languageCode == 'en' ? 10 : null,
                ),
              ),
              const Spacer(),
              StreamBuilder<bool>(
                  stream: GetLocationn.controller.stream,
                  builder: (context, snapshot) {
                    return Flexible(
                      flex: 20,
                      child: SizedBox(
                        width: 160,
                        child: GestureDetector(
                          onTap: () async {
                            model = await showModalBottomSheet(
                              clipBehavior: Clip.antiAlias,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                              ),
                              context: context,
                              builder: (context) => const TitlesSheet(),
                            );
                            if (model?.location.isNotEmpty ?? false) {
                              // TODO: this is operation to delete some string
                              final list = model!.location.split(' ');
                              list.removeAt(0);
                              String location = list.join(' ');

                              CacheHelper.setCurrentLocation(location);
                              GetLocationn.controller.add(true);
                            }
                            KiwiContainer().resolve<MyOrdersBloc>().addressId =
                                model?.id.toString();
                          },
                          child: Text.rich(
                            overflow: context.locale.languageCode == 'ar'
                                ? TextOverflow.ellipsis
                                : null,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: LocaleKeys.home_delivery_to.tr(),
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                const TextSpan(text: '\n'),
                                TextSpan(
                                  text: CacheHelper.getCurrentLocation()
                                              ?.isEmpty ??
                                          true
                                      ? LocaleKeys.home_add_addresses.tr()
                                      : CacheHelper.getCurrentLocation(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                width: context.locale.languageCode == 'ar' ? 20 : 30,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  navigateTo(toPage: const CartView());
                },
                child: Badge(
                  offset: context.locale.languageCode == 'ar'
                      ? const Offset(5, -5)
                      : const Offset(-2, -7),
                  alignment: AlignmentDirectional.topStart,
                  label: BlocListener(
                    bloc: cartBloc,
                    listener: (context, state) {
                      if (state is AddToCartSuccessState ||
                          state is GetCartStuccessState ||
                          state is DeleteFromCartSuccessState) {
                        num = cartBloc.list.length;
                        CacheHelper.setInCart(num);
                      }
                    },
                    child: BlocBuilder(
                      bloc: cartBloc,
                      builder: (context, state) {
                        if (state is AddToCartSuccessState ||
                            state is GetCartStuccessState ||
                            state is DeleteFromCartSuccessState) {
                          return Text(
                            "$num",
                            style: const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.bold),
                          );
                        } else {
                          return Text(
                            "$num",
                            style: const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.bold),
                          );
                        }
                      },
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(.13),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
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
