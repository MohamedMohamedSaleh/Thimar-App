import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/features/products/cubit/get_products_cubit.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_item_product.dart';


class FavsPage extends StatefulWidget {
  const FavsPage({super.key});

  @override
  State<FavsPage> createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {
  late GetProductCubit cubit;
  @override
  initState() {
    super.initState();
    cubit = BlocProvider.of(context)..getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'المفضلة',
        thereIsIcon: false,
      ),
      body: BlocBuilder<GetProductCubit, GetProductStates>(
        builder: (context, state) {
          if (state is GetProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetProductSuccrssState) {
            return GridView.builder(
                      padding: const EdgeInsets.all(16),

              itemCount: state.model.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 163/215, crossAxisSpacing: 10,mainAxisSpacing: 10),
              itemBuilder: (context, index) =>
                  ItemProduct(model: state.model[index]),
            );
          } else {
            return const Center(
              child: Text("Failed!"),
            );
          }
        },
      ),
    );
  }
}
