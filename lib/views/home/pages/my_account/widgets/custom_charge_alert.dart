import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/wallet/wallet_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_form_input.dart';

class CustomChargeAlert extends StatefulWidget {
  const CustomChargeAlert({super.key, required this.bloc});
  final WalletBloc bloc;
  @override
  State<CustomChargeAlert> createState() => _CustomChargeAlertState();
}

class _CustomChargeAlertState extends State<CustomChargeAlert> {
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            LocaleKeys.wallet_charge_now.tr(),
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: mainColor),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomFormInput(
              controller: amountController,
              isPhone: true,
              labelText: LocaleKeys.charge_now_your_amount.tr(),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: BlocBuilder(
                bloc: widget.bloc,
                builder: (context, state) {
                  if (state is WalletChargeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CustomFillButton(
                      title: LocaleKeys.categories_apply.tr(),
                      onPress: () {
                        widget.bloc.add(
                            WalletChargeEvent(amount: amountController.text));
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
