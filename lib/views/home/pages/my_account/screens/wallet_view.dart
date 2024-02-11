import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/currency_history_view.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/screens/wallet_charge_now_view.dart';

import '../widgets/currency_history_item.dart';
import '../widgets/custom_outline_button.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'المحفظة'),
      body: SizedBox(
        width: double.infinity,
        child: Column(
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
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 42,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'رصيدك',
                        style: TextStyle(
                            fontSize: 20,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '255 ر.س',
                        style: TextStyle(
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
                title: 'اشحن الآن',
                onTap: () {
                  navigateTo(toPage: const WalletChargeNowView());
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
                const Text(
                  'سجل المعاملات',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => navigateTo(toPage: const CurrencyHestoryView()),
                  child: const Text(
                    'عرض الكل',
                    style: TextStyle(
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
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 14),
                itemBuilder: (context, index) => const CurrencyHistoryItem(
                  isCharge: false,
                ),
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
