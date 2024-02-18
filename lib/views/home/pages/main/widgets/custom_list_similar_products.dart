import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_item_product.dart';

import '../../../../../features/products/similar_products/similar_products_cubit.dart';

class CustomListSimilarPrduct extends StatefulWidget {
  const CustomListSimilarPrduct({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<CustomListSimilarPrduct> createState() =>
      _CustomListSimilarPrductState();
}

class _CustomListSimilarPrductState extends State<CustomListSimilarPrduct> {
  late GetSimilarProductCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of(context)..getSimilarProductData(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: BlocBuilder<GetSimilarProductCubit, GetSimilarProductStates>(
        builder: (context, state) {
          if (state is GetSimilarProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetSimilarProductSuccrssState) {
            return SizedBox(
              height: 180,
              child: ListView.separated(
                padding: const EdgeInsets.only(right: 16),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 18,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: state.model.length,
                itemBuilder: (context, index) =>
                    ItemProduct(model: state.model[index]),
              ),
            );
          } else {
            return const Text('Failed!');
          }
        },
      ),
    );
  }
}
