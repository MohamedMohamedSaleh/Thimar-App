import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_item_product.dart';

import '../../../../features/products/get_favorite_product/get_favorite_products_cubit.dart';


class FavsPage extends StatefulWidget {
  const FavsPage({super.key});

  @override
  State<FavsPage> createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {
  late GetFavoriteProductCubit cubit;
  @override
  initState() {
    super.initState();
    cubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'المفضلة',
        thereIsIcon: false,
      ),
      body: BlocBuilder<GetFavoriteProductCubit, GetFavoriteProductStates>(
        builder: (context, state) {
          if (state is GetFavoriteProductLoadingState || state is AddFavoriteSuccessState || state is RemoveFavoriteSuccessState || state is StartAddSuccessState || state is StartRemoveSuccessState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (cubit.favsModel != null) {
            return GridView.builder(
                      padding: const EdgeInsets.all(16),

              itemCount: cubit.favsModel!.list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 163/215, crossAxisSpacing: 10,mainAxisSpacing: 10),
              itemBuilder: (context, index) =>
                  ItemProduct(model: cubit.favsModel!.list[index]),
            );
          }
          
           else {
            return const Center(
              child: Text("Failed!"),
            );
          }
        },
      ),
    );
  }
}
