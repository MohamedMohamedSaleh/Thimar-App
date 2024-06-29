import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_item_product.dart';
import 'package:vegetable_orders_project/views/home/widgets/shimmer_loading.dart';

import '../../../../../features/products/similar_products/similar_products_bloc.dart';

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
  final bloc = KiwiContainer().resolve<GetSimilarProductBloc>();
  @override
  void initState() {
    super.initState();
    bloc.add(GetSimilarProductsEvent(id: widget.id));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetSimilarProductLoadingState) {
            return const ShimmerLoadingProduct(
              isMain: false,
            );
          } else if (state is GetSimilarProductSuccrssState) {
            return SizedBox(
              height: 180,
              child: ListView.separated(
                padding: const EdgeInsets.only(right: 16, left: 16),
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
