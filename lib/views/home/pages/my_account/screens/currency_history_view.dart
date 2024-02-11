import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/currency_history_item.dart';

class CurrencyHestoryView extends StatelessWidget {
  const CurrencyHestoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'سجل المعاملات'),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (context, index) =>
              const CurrencyHistoryItem(isCharge: false),
          itemCount: 10,
        ),
      ),
    );
  }
}
