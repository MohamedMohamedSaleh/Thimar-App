import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/features/products/cubit/get_products_cubit.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_item_product.dart';

import '../../../../../../core/widgets/custom_app_input.dart';

class VegetablesView extends StatefulWidget {
  const VegetablesView({super.key});

  @override
  State<VegetablesView> createState() => _VegetablesViewState();
}

class _VegetablesViewState extends State<VegetablesView> {
  late GetProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of(context)..getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const CustomAppBar(title: 'خضروات'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
            child: Stack(
              children: [
                CustomAppInput(
                  labelText: "ابحث عن ماتريد؟",
                  prefixIcon: "assets/icon/svg/search.svg",
                  fillColor: const Color(0xff4C8613).withOpacity(.03),
                  paddingBottom: 0,
                ),
                Positioned(
                  top: 9.5,
                  left: 8,
                  child: InkWell(
                    onTap: () {},
                    child: const AppImage(
                      'assets/icon/svg/filtter.svg',
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<GetProductCubit, GetProductStates>(
              builder: (context, state) {
                if (state is GetProductLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetProductSuccrssState) {
                  return GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 163/215, crossAxisSpacing: 10, mainAxisSpacing: 10),

                      padding: EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 20),
                      itemCount: state.model.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ItemProduct(model: state.model[index], ),
                    ),
                  );
                } else {
                  return const Text('Failed');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
