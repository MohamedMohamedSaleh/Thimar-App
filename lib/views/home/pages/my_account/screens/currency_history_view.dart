import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/wallet/wallet_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/currency_history_item.dart';

class CurrencyHestoryView extends StatefulWidget {
  const CurrencyHestoryView({super.key, required this.bloc});
  final WalletBloc bloc;

  @override
  State<CurrencyHestoryView> createState() => _CurrencyHestoryViewState();
}

class _CurrencyHestoryViewState extends State<CurrencyHestoryView> {
  @override
  void initState() {
    widget.bloc.add(GetWalletEventPaginated());
    super.initState();
  }

  @override
  void dispose() {
    widget.bloc.pageNumber = 1;
    widget.bloc.listPaginated = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'سجل المعاملات'),
      body: BlocBuilder(
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is GetWalletPaginatedLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent &&
                    notification is ScrollUpdateNotification) {
                  widget.bloc
                      .add(GetWalletEventPaginated(isLoadingPagination: true));
                  print('Loading pagination');
                }
                return true;
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                itemBuilder: (context, index) => CurrencyHistoryItem(
                  isWallet: false,
                  isCharge: false,
                  modlePaginated: widget.bloc.listPaginated[index],
                ),
                itemCount: widget.bloc.listPaginated.length,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder(
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is GetWalletFromPaginationLoadingState) {
            return const SafeArea(
              child: SizedBox(
                height: 45,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
