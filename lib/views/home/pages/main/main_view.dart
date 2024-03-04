import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/features/cart/cart_cubit.dart';
import 'package:vegetable_orders_project/features/categoris/bloc/get_category_bloc.dart';
import 'package:vegetable_orders_project/features/products/get_favorite_product/get_favorite_products_cubit.dart';
import 'package:vegetable_orders_project/features/products/search_products/search_products_bloc.dart';
import 'package:vegetable_orders_project/features/slider/bloc/get_slider_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/main/screens/categories/category_view.dart';
import '../../../../features/categoris/category_model.dart';
import '../../widgets/custom_item_product.dart';
import 'widgets/main_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final getSliderBloc = KiwiContainer().resolve<GetSliderBloc>();
  final getCategoriesBloc = KiwiContainer().resolve<GetCategoryBloc>();
  final getSearchProducts = KiwiContainer().resolve<GetSearchProductsBloc>();
  late GetFavoriteProductCubit productCubit;
  late CartCubit cartCubit;
  bool isNotFound = false;
  @override
  void initState() {
    super.initState();
    productCubit = BlocProvider.of(context);
    cartCubit = BlocProvider.of(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getSearchProducts.close();
  }

  int currentIndex = 0;
  // bool isNotEmpty = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: const MainAppBar(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    CustomAppInput(
                      controller: getSearchProducts.textController,
                      onChange: (value) {
                        if (value.isNotEmpty) {
                          getSearchProducts
                              .add(GetSearchProductsEvent(text: value));
                          if (getSearchProducts.search.isEmpty) {
                            isNotFound = true;
                          }
                        } else {
                          isNotFound = false;
                          getSearchProducts
                              .add(GetSearchProductsEvent(text: value));
                          getSearchProducts.search.clear();
                        }
                      },
                      // controller: searchProducts.textController,
                      labelText: "ابحث عن ماتريد؟",
                      prefixIcon: "assets/icon/svg/search.svg",
                      fillColor: const Color(0xff4C8613).withOpacity(.03),
                      paddingBottom: 0,
                    ),
                    // isNotEmpty
                    //     ? const Icon(
                    //         Icons.clear,
                    //         color: Colors.red,
                    //       )
                    //     : const SizedBox(),
                  ],
                ),
              ),
              BlocBuilder(
                bloc: getSearchProducts,
                builder: (context, state) {
                  if (getSearchProducts.search.isEmpty && !isNotFound) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder(
                          bloc: getSliderBloc,
                          builder: (context, state) {
                            if (state is GetSliderLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is GetSliderSuccessState) {
                              return StatefulBuilder(
                                builder: (context, setState1) {
                                  return Column(
                                    children: [
                                      CarouselSlider(
                                        items: List.generate(
                                          state.model.length,
                                          (index) => AppImage(
                                            state.model[index].media,
                                            height: 164,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        options: CarouselOptions(
                                          height: 164,
                                          viewportFraction: 1,
                                          onPageChanged: (index, reason) {
                                            currentIndex = index;
                                            setState1(() {});
                                          },
                                          autoPlay: true,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 10,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                            state.model.length,
                                            (index) => Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .only(end: 4),
                                              child: CircleAvatar(
                                                radius: (index == currentIndex)
                                                    ? 5
                                                    : 4,
                                                backgroundColor: (index ==
                                                        currentIndex)
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : const Color(0xff61880c)
                                                        .withOpacity(.5),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              return const Text("failed");
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 16, top: 27, left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "الأقسام",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "عرض الكل",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder(
                          bloc: getCategoriesBloc,
                          builder: (context, state) {
                            if (state is GetCtegoryLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is GetCtegorySuccessState) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: SizedBox(
                                  height: 102,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        _ItemCategory(
                                      model: state.model[index],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 18,
                                    ),
                                    itemCount: state.model.length,
                                  ),
                                ),
                              );
                            } else {
                              return const Text("failed");
                            }
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5, right: 16),
                          child: Text(
                            'الأصناف',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800),
                          ),
                        ),
                        BlocBuilder<GetFavoriteProductCubit,
                            GetFavoriteProductStates>(
                          builder: (context, state) {
                            if (state is GetProductLoadingState ||
                                state is AddFavoriteSuccessState ||
                                state is RemoveFavoriteSuccessState ||
                                state is StartAddSuccessState ||
                                state is StartRemoveSuccessState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is GetProductSuccrssState) {
                              return GridView.builder(
                                padding: const EdgeInsets.only(
                                    bottom: 16, right: 16, left: 16),
                                itemCount: state.model.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: 163 / 250,
                                  mainAxisSpacing: 12,
                                ),
                                itemBuilder: (context, index) => ItemProduct(
                                  model: state.model[index],
                                  isMainPage: true,
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ],
                    );
                  } else if (state is GetSearchProductLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GridView.builder(
                      padding: const EdgeInsets.only(
                          bottom: 16, right: 16, left: 16),
                      itemCount: getSearchProducts.search.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        childAspectRatio: 163 / 250,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) => ItemProduct(
                        isSearch: true,
                        searchModel: getSearchProducts.search[index],
                        isMainPage: true,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemCategory extends StatefulWidget {
  const _ItemCategory({required this.model});
  final CategoryModel model;
  @override
  State<_ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<_ItemCategory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        navigateTo(
            toPage: CategoryView(
          id: widget.model.id,
          model: widget.model,
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: const Color(0xffc0c0c0).withOpacity(.2),
            ),
            child: AppImage(
              widget.model.media,
              height: 37,
              width: 37,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.model.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
