import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';

import '../widgets/product_evaluate_item.dart';

class ProductEvaluationView extends StatelessWidget {
  const ProductEvaluationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'تقييم المنتجات'),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (context, index) => const ProductEvaluateItem(),
          itemCount: 4,
        ),
      ),
    );
  }
}
