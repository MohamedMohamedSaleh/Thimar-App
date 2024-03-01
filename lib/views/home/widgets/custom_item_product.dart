import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/features/cart/cart_cubit.dart';
import 'package:vegetable_orders_project/features/cart/cart_states.dart';
import 'package:vegetable_orders_project/features/products/search_products/search_products_model.dart';
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
  // final cubit = KiwiContainer().resolve<CartCubit>();
  late CartCubit cubit;
  @override
  initState() {
    super.initState();
    cubit = BlocProvider.of(context);
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomRight: Radius.circular(11)),
                                ),
                                child: Text(
                                  '${widget.isSearch ? widget.searchModel!.discount : widget.model!.discount}%',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      'السعر / ${widget.isSearch ? widget.searchModel!.unit.name : widget.model!.unit.name}',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0Xff808080)),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.isSearch ? widget.searchModel!.price : widget.model!.price} ر.س',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${widget.isSearch ? widget.searchModel!.priceBeforeDiscount : widget.model!.priceBeforeDiscount} ر.س',
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
                              child: BlocBuilder<CartCubit, CartStates>(
                                builder: (context, state) {
                                  return FilledButton(
                                    style: FilledButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(11)),
                                        backgroundColor:
                                            const Color(0xff61B80C)),
                                    child: state is AddToCartLoadingState &&
                                            (widget.isSearch?widget.searchModel!.id == state.id : widget.model!.id == state.id)
                                        ? const Center(
                                            child: LinearProgressIndicator(),
                                          )
                                        : const Text('أضف للسلة'),
                                    onPressed: () {
                                      cubit.storeProduct(
                                          id: widget.isSearch
                                              ? widget.searchModel!.id
                                              : widget.model!.id);
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
