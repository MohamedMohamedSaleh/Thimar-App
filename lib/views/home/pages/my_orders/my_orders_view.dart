import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/features/my_orders/get_my_orders/my_orders_bloc.dart';

import 'widgets/custom_orders_item.dart';
import 'widgets/custom_tab_bar.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  final bloc = KiwiContainer().resolve<MyOrdersBloc>();
  @override
  void initState() {
    super.initState();
    bloc.add(GetCurrentOrdersEvent());
    bloc.add(GetFinishedOrdersEvent());
  }

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
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetCurrentOrdersLoadingState ||
                    bloc.currentOrders.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    itemBuilder: (context, index) => CustomOrdersItem(
                      ordersModel: bloc.currentOrders[index],
                      isFinished: false,
                    ),
                    itemCount: bloc.currentOrders.length,
                  );
                }
              },
            ),

            // Content of Tab 2
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is GetFinishedOrdersLoadingState ||
                    bloc.finishedOrders.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  itemBuilder: (context, index) => CustomOrdersItem(
                    ordersModel: bloc.finishedOrders[index],
                    isFinished: true,
                  ),
                  itemCount: bloc.finishedOrders.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
