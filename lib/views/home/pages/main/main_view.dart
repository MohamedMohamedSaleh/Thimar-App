import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_input.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/feature/products/cubit/get_products_cubit.dart';
import 'package:vegetable_orders_project/feature/products/products_model.dart';
import 'package:vegetable_orders_project/feature/slider/cubit/get_slider_cubit.dart';
import '../../../../feature/categoris/category_model.dart';
import '../../../../feature/categoris/cubit/get_category_cubit.dart';
import 'widgets/main_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late GetSliderCubit sliderCubit;
  late GetCategoryCubit categoryCubit;
  late GetProductCubit productCubit;

  @override
  void initState() {
    super.initState();
    sliderCubit = BlocProvider.of(context)..getData();
    categoryCubit = BlocProvider.of(context)..getData();
    productCubit = BlocProvider.of(context)..getData();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: ListView(
        // padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomAppInput(
              labelText: "ابحث عن ماتريد؟",
              prefixIcon: "assets/icon/svg/search.svg",
              fillColor: const Color(0xff4C8613).withOpacity(.03),
              paddingBottom: 0,
            ),
          ),
          BlocBuilder<GetSliderCubit, GetSliderStates>(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              state.model.length,
                              (index) => Padding(
                                padding: const EdgeInsetsDirectional.only(end: 4),
                                child: CircleAvatar(
                                  radius: (index == currentIndex) ? 5 : 4,
                                  backgroundColor: (index == currentIndex)
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xff61880c).withOpacity(.5),
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
            padding: const EdgeInsets.only(right: 16, top: 27, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "الأقسام",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
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
          BlocBuilder<GetCategoryCubit, GetCategoryStates>(
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
                      itemBuilder: (context, index) => _ItemCategory(
                        model: state.model[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: BlocBuilder<GetProductCubit, GetProductStates>(
              builder: (context, state) {
                if (state is GetProductLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetProductSuccrssState) {
                  return GridView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 17,
                      childAspectRatio: 163 / 250,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) => _ItemProduct(
                      model: state.model[index],
                    ),
                  );
                } else {
                  return const Text('failed');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemProduct extends StatefulWidget {
  const _ItemProduct({required this.model});
  final ProductModel model;

  @override
  State<_ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<_ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  widget.model.mainImage,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    height: 18,
                    width: 55,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(11),
                          bottomRight: Radius.circular(11)),
                    ),
                    child: Text(
                      '${widget.model.discount}%',
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
          widget.model.title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        Text(
          'السعر / ${widget.model.unit.name}',
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Color(0Xff808080)),
        ),
        Row(
          children: [
            Text(
              '${widget.model.price} ر.س',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              '${widget.model.priceBeforeDiscount} ر.س',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 30,
            width: 115,
            child: CustomFillButton(
              radius: 9,
              title: 'أضف للسلة',
              onPress: () {},
            ),
          ),
        )
      ],
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
    return Column(
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
    );
  }
}
