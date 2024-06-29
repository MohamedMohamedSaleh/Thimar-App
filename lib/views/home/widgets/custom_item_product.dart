import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/features/cart/cart_bloc.dart';
import 'package:vegetable_orders_project/features/products/search_products/search_products_model.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/main/screens/product_details_view.dart';
import '../../../features/products/products_model.dart';

class ItemProduct extends StatefulWidget {
  const ItemProduct({
    super.key,
    this.model,
    this.isMainPage = false,
    this.searchModel,
    this.isSearch = false,
  });
  final ProductModel? model;
  final bool isMainPage;
  final SearchResult? searchModel;
  final bool isSearch;

  @override
  State<ItemProduct> createState() => ItemProductState();
}

class ItemProductState extends State<ItemProduct> {
  final cartBloc = KiwiContainer().resolve<CartBloc>();

  // final cubit = KiwiContainer().resolve<CartCubit>();
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
            toPage: ProductDetailsView(
          model: widget.model!,
        ));
      },
      child: SizedBox(
        width: 135,
        child: DecoratedBox(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 11,
              offset: const Offset(0, 2),
            ),
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            AppImage(
                              widget.isSearch
                                  ? widget.searchModel!.mainImage
                                  : widget.model!.mainImage,
                              fit: BoxFit.cover,
                            ),
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Container(
                                height: 18,
                                width: 55,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 4, top: 2),
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      const BorderRadiusDirectional.only(
                                          topEnd: Radius.circular(11),
                                          bottomStart: Radius.circular(11)),
                                ),
                                child: Text(
                                  '${widget.isSearch ? widget.searchModel!.discount : widget.model!.discount}%',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      widget.isSearch
                          ? widget.searchModel!.title
                          : widget.model!.title,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      '${LocaleKeys.price.tr()} / 1 ${widget.isSearch ? widget.searchModel!.unit.name : widget.model!.unit.name}',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: const Color(0Xff808080)),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.isSearch ? widget.searchModel!.price : widget.model!.price} ${LocaleKeys.r_s.tr()}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${widget.isSearch ? widget.searchModel!.priceBeforeDiscount : widget.model!.priceBeforeDiscount}${LocaleKeys.r_s.tr()}',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 23,
                          width: 23,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff61B80C),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(0),
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    widget.isMainPage
                        ? const SizedBox(
                            height: 12,
                          )
                        : const SizedBox(),
                    widget.isMainPage
                        ? Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 30,
                              width: 115,
                              child: BlocBuilder(
                                bloc: cartBloc,
                                builder: (context, state) {
                                  return FilledButton(
                                    style: FilledButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(11)),
                                        backgroundColor:
                                            const Color(0xff61B80C)),
                                    child: state is AddToCartLoadingState &&
                                            (widget.isSearch
                                                ? widget.searchModel!.id ==
                                                    state.id
                                                : widget.model!.id == state.id)
                                        ? const Center(
                                            child: LinearProgressIndicator(),
                                          )
                                        : FittedBox(
                                            child: Text(
                                              LocaleKeys.add_to_cart.tr(),
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                          ),
                                    onPressed: () {
                                      cartBloc.add(StorProductCartEvent(
                                          id: widget.isSearch
                                              ? widget.searchModel!.id
                                              : widget.model!.id));
                                    },
                                  );
                                },
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 5,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
