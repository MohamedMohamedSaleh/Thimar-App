import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_item_product.dart';

import '../../../../features/products/products/products_bloc.dart';

class FavsPage extends StatefulWidget {
  const FavsPage({super.key});

  @override
  State<FavsPage> createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {
  final bloc = KiwiContainer().resolve<ProductsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'المفضلة',
        thereIsIcon: false,
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.favsList.isEmpty &&
              state is GetFavoriteProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: bloc.favsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 163 / 215,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) =>
                  ItemProduct(model: bloc.favsList[index]),
            );
          }
        },
      ),
    );
  }
}
