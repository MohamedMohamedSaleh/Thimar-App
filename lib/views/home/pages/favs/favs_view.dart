import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_item_product.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../features/products/products/products_bloc.dart';
import '../../widgets/shimmer_loading.dart';

class FavsPage extends StatefulWidget {
  const FavsPage({super.key});

  @override
  State<FavsPage> createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {
  final bloc = KiwiContainer().resolve<ProductsBloc>();

  Future<void> refreshCallback() async {
    bloc.add(GetFavsProductsEvent(isLoading: true));
  }

  @override
  void initState() {
    if(bloc.isTransitionFav){
      bloc.add(GetFavsProductsEvent(isLoading: true));
    }    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.home_nav_favs.tr(),
          thereIsIcon: false,
        ),
        body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is GetFavoriteProductLoadingState) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: ShimmerLoadingProduct(
                  isMain: false,
                ),
              );
            } else if (bloc.favsList.isEmpty) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppImage(
                      'assets/icon/no_data_favs.png',
                      width: 200,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      LocaleKeys.home_data_not_found.tr(),
                      style: const TextStyle(
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
              return RefreshIndicator(
                displacement: 20,
                strokeWidth: 3,
                backgroundColor: Colors.green[100],
                onRefresh: refreshCallback,
                child: GridView.builder(
                  physics: bloc.favsList.length <= 4
                      ? const AlwaysScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: bloc.favsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 163 / 215,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) =>
                      ItemProduct(model: bloc.favsList[index]),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
