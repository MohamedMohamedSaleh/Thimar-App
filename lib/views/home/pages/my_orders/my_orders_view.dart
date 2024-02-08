import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';

import 'widgets/custom_orders_item.dart';
import 'widgets/custom_tab_bar.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(
          height: 120,
          thereIsIcon: false,
          title: 'طلباتي',
          bottom: CustomTabBar(),
        ),
        body: TabBarView(
          children: [
            // Content of Tab 1
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              itemBuilder: (context, index) => const CustomOrdersItem(isFinished: false,),
              itemCount: 7,
            ),

            // Content of Tab 2
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              itemBuilder: (context, index) => const CustomOrdersItem(isFinished: true,),
              itemCount: 7,
            ),
          ],
        ),
      ),
    );
  }
}
