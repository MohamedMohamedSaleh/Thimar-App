import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';

class FavsPage extends StatelessWidget {
  const FavsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'المفضلة'),
    );
  }
}
