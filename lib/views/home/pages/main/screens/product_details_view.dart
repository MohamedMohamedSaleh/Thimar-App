import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/features/products/get_favorite_product/get_favorite_products_cubit.dart';
import 'package:vegetable_orders_project/features/products/update_amount/update_amount_cubit.dart';
import 'package:vegetable_orders_project/features/products/update_amount/update_amount_states.dart';
import 'package:vegetable_orders_project/views/sheets/success_add_to_cart._sheet.dart';
import '../../../../../features/products/products_model.dart';
import '../../../widgets/custom_plus_minus_product.dart';
import '../widgets/custom_list_comment.dart';
import '../widgets/custom_list_similar_products.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView(
      {super.key, required this.model, this.isMainView = true});
  final ProductModel model;
  final bool isMainView;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late GetFavoriteProductCubit addRemoveCubit;
  late UpdateAmountCubit updateCubit;
  @override
  initState() {
    super.initState();
    addRemoveCubit = BlocProvider.of(context);
    updateCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorit = widget.model.isFavorite;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 22, right: 22, top: 16, bottom: 8),
              child: Row(
                children: [
                  const CustomAppBarIcon(),
                  const Spacer(),
                  BlocConsumer<GetFavoriteProductCubit,
                      GetFavoriteProductStates>(
                    listener: (context, state) {
                      if (state is StartAddSuccessState) {
                        isFavorit = true;
                      } else if (state is StartRemoveSuccessState) {
                        isFavorit = false;
                      }
                    },
                    builder: (context, state) {
                      return CustomAppBarIcon(
                        onTap: () {
                          if (isFavorit) {
                            addRemoveCubit.removeProduct(id: widget.model.id);
                          } else {
                            addRemoveCubit.addProduct(id: widget.model.id);
                          }
                        },
                        isBack: false,
                        child: !isFavorit
                            ? const AppImage(
                                'assets/icon/svg/heart.svg',
                              )
                            : const Icon(
                                Icons.favorite,
                                color: mainColor,
                                size: 20,
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: Hero(
                        tag: 1,
                        child: AppImage(
                          widget.model.mainImage,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 16, left: 16, top: 5, bottom: 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.model.title,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              '${widget.model.discount}%',
                              style: const TextStyle(
                                  color: Color(0xffFF0000),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '${widget.model.price}ر.س',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '${widget.model.priceBeforeDiscount}ر.س',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              'السعر /  ${widget.model.unit.name}',
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff808080),
                              ),
                            ),
                            const Spacer(),
                            CustomPlusOrMinusProduct(
                              id: widget.model.id,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "كود المنتج  ",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: "56638",
                            style: TextStyle(
                              color: Color(0xff808080),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, bottom: 5, top: 4),
                    child: Text(
                      'تفاصيل المنتج',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      widget.model.description,
                      style: const TextStyle(
                        color: Color(0xff808080),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Text(
                      'التقييمات',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const CustomListComments(),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, top: 10, bottom: 5),
                    child: Text(
                      'منتجات مشابهة',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomListSimilarPrduct(
                    id: widget.model.categoryId,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SuccessAddToCartSheet(
              model: widget.model,
            ),
          );
        },
        child: Container(
          color: mainColor,
          height: 60,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color(0xff6AA431),
                    ),
                    child: const AppImage('assets/icon/svg/Shopping.svg'),
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                const Text(
                  'إضافة إلي السلة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                BlocBuilder<UpdateAmountCubit, UpdateAmountStates>(
                  builder: (context, state) {
                    return Text(
                      '${widget.model.price! * updateCubit.amount}ر.س',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
