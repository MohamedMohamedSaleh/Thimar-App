import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/features/my_orders/get_my_orders/my_orders_bloc.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/widgets/shimmer_loading.dart';

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
    bloc.add(GetCurrentOrdersEvent(isLoading: true));
    bloc.add(GetFinishedOrdersEvent(isLoading: true));
  }

  @override
  void dispose() {
    bloc.isLoading = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          height: 120,
          thereIsIcon: false,
          title: LocaleKeys.home_nav_my_orders.tr(),
          bottom: const CustomTabBar(),
        ),
        body: TabBarView(
          children: [
            // Content of Tab 1
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                print(state);
                if (((state is GetCurrentOrdersLoadingState ||
                        state is GetFinishedOrdersLoadingState) ||
                    bloc.isLoading)) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    itemBuilder: (context, index) => orderShimmerLoading(),
                    itemCount: 6,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                  );
                } else if (bloc.currentOrders.isEmpty) {
                  return Center(
                    child: RefreshIndicator(
                      displacement: 20,
                      strokeWidth: 3,
                      backgroundColor: Colors.green[100],
                      onRefresh: () async {
                        bloc.add(GetCurrentOrdersEvent(isLoading: true));
                      },
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 70.0),
                            child: AppImage(
                              'assets/images/no_addresses.png',
                              // width: 200,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            LocaleKeys.home_data_not_found.tr(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return RefreshIndicator(
                    displacement: 20,
                    strokeWidth: 3,
                    backgroundColor: Colors.green[100],
                    onRefresh: () async {
                      bloc.add(GetCurrentOrdersEvent(isLoading: true));
                    },
                    child: ListView.builder(
                      physics: bloc.currentOrders.length > 4
                          ? const BouncingScrollPhysics()
                          : const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      itemBuilder: (context, index) => CustomOrdersItem(
                        ordersModel: bloc.currentOrders[index],
                        isFinished: false,
                      ),
                      itemCount: bloc.currentOrders.length,
                    ),
                  );
                }
              },
            ),

            // Content of Tab 2
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if ((state is GetFinishedOrdersLoadingState ||
                        state is GetCurrentOrdersLoadingState ||
                        bloc.isLoading) &&
                    state is! GetFinishedOrdersEmptyState) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    itemBuilder: (context, index) => orderShimmerLoading(),
                    itemCount: 6,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                  );
                } else if (bloc.finishedOrders.isEmpty) {
                  return Center(
                    child: RefreshIndicator(
                      displacement: 20,
                      strokeWidth: 3,
                      backgroundColor: Colors.green[100],
                      onRefresh: () async {
                        bloc.add(GetFinishedOrdersEvent(isLoading: true));
                      },
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 70),
                            child: AppImage(
                              'assets/images/no_addresses.png',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            LocaleKeys.home_data_not_found.tr(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return RefreshIndicator(
                  displacement: 20,
                  strokeWidth: 3,
                  backgroundColor: Colors.green[100],
                  onRefresh: () async {
                    bloc.add(GetFinishedOrdersEvent(isLoading: true));
                  },
                  child: ListView.builder(
                    physics: bloc.finishedOrders.length > 4
                        ? const BouncingScrollPhysics()
                        : const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    itemBuilder: (context, index) => CustomOrdersItem(
                      ordersModel: bloc.finishedOrders[index],
                      isFinished: true,
                    ),
                    itemCount: bloc.finishedOrders.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
