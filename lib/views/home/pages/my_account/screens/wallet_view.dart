import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/wallet/wallet_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/currency_history_view.dart';

import '../widgets/currency_history_item.dart';
import '../widgets/custom_charge_alert.dart';
import '../widgets/custom_outline_button.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  final bloc = KiwiContainer().resolve<WalletBloc>();

  @override
  void initState() {
    bloc.add(GetWalletEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.my_account_wallet.tr()),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetWalletLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 24,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 17, color: Colors.black.withOpacity(0.03))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 42,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          LocaleKeys.wallet_your_balance.tr(),
                          style: const TextStyle(
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${bloc.wallet} ${LocaleKeys.r_s.tr()}',
                          style: const TextStyle(
                              fontSize: 24,
                              color: mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomOutlineButton(
                  title: LocaleKeys.wallet_charge_now.tr(),
                  onTap: () {
                    showDialog(
                      
                      context: context,
                      builder: (context) =>  CustomChargeAlert(bloc: bloc,),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    LocaleKeys.wallet_history_transactions.tr(),
                    style: const TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => navigateTo(
                        toPage: CurrencyHestoryView(
                      bloc: bloc,
                    )),
                    child: Text(
                      LocaleKeys.wallet_see_more.tr(),
                      style: const TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 14),
                itemBuilder: (context, index) => CurrencyHistoryItem(
                  model: bloc.list[index],
                  isCharge: false,
                  isWallet: true,
                ),
                itemCount: bloc.list.length,
              )
            ],
          );
        },
      ),
    );
  }
}
