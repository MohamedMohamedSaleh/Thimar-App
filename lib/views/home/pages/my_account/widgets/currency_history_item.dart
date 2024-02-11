import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';

import '../../../widgets/custom_decorated_box.dart';

class CurrencyHistoryItem extends StatelessWidget {
  const CurrencyHistoryItem({super.key, required this.isCharge});
  final bool isCharge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 15, left: 15),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 11, color: Colors.black.withOpacity(0.03))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11),
          child: isCharge ? const _WalletChargeItem() : const _PayOrderItem(),
        ),
      ),
    );
  }
}

class _WalletChargeItem extends StatelessWidget {
  const _WalletChargeItem();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage('assets/icon/svg/account/charge.svg'),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'شحن المحفظة',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '255 ر.س',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          // isDetailsOrder? SizedBox(height: 2,): SizedBox(),
          Text(
            "27,يونيو,2021",
            style: TextStyle(
                color: Color((0xff9C9C9C)),
                fontSize: 14,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class _PayOrderItem extends StatelessWidget {
  const _PayOrderItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const Row(
            children: [
              AppImage('assets/icon/svg/account/pay.svg'),
              SizedBox(
                width: 8,
              ),
              Text(
                'دفعت مقابل هذا الطلب',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: mainColor),
              ),
              Spacer(),
              Text(
                "27,يونيو,2021",
                style: TextStyle(
                    color: Color((0xff9C9C9C)),
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 11, color: Colors.black.withOpacity(0.03)),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 13, right: 9, top: 6, bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "طلب #4587",
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const CustomDecoratedBox(),
                        const CustomDecoratedBox(),
                        const CustomDecoratedBox(),
                        const CustomDecoratedBox(
                          isText: true,
                        ),
                        const Spacer(),
                        Text(
                          '180ر.س',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
