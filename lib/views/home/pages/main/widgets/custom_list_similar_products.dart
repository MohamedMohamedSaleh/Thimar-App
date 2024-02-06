import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/features/products/cubit/get_products_cubit.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_item_product.dart';

class CustomListSimilarPrduct extends StatefulWidget {
  const CustomListSimilarPrduct({super.key});

  @override
  State<CustomListSimilarPrduct> createState() =>
      _CustomListSimilarPrductState();
}

class _CustomListSimilarPrductState extends State<CustomListSimilarPrduct> {
  late GetProductCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of(context)..getData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: BlocBuilder<GetProductCubit, GetProductStates>(
        builder: (context, state) {
          if (state is GetProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetProductSuccrssState) {
            return SizedBox(
              height: 180,
              child: ListView.separated(
                padding: EdgeInsets.only(right: 16),
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

class CustomTraining extends StatelessWidget {
  const CustomTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const Containerrrd(),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 18,
                ),
            itemCount: 10));
  }
}

class Containerrrd extends StatelessWidget {
  const Containerrrd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
    );
  }
}
