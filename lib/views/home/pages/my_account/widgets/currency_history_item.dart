import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/wallet/wallet_model.dart';

import '../../../widgets/custom_decorated_box.dart';
import '../bloc/wallet/wallet_paginated_model.dart';

class CurrencyHistoryItem extends StatefulWidget {
  const CurrencyHistoryItem(
      {super.key,
      required this.isCharge,
      this.model,
      this.modlePaginated,
      required this.isWallet});
  final bool isCharge;
  final Data? model;
  final Model? modlePaginated;
  final bool isWallet;

  @override
  State<CurrencyHistoryItem> createState() => _CurrencyHistoryItemState();
}

class _CurrencyHistoryItemState extends State<CurrencyHistoryItem> {
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
          child: widget.isCharge
              ? const _WalletChargeItem()
              : _PayOrderItem(
                  isWallet: widget.isWallet,
                  modlePaginated: widget.modlePaginated,
                  model: widget.model,
                ),
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

class _PayOrderItem extends StatefulWidget {
  const _PayOrderItem(
      {required this.model, this.modlePaginated, required this.isWallet});
  final Data? model;
  final Model? modlePaginated;
  final bool isWallet;

  @override
  State<_PayOrderItem> createState() => _PayOrderItemState();
}

class _PayOrderItemState extends State<_PayOrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              const AppImage(
                'assets/icon/svg/account/pay.svg',
                width: 14,
              ),
              const SizedBox(
                width: 6,
              ),
              Flexible(
                flex: 200,
                child: Text(
                  !widget.isWallet
                      ? widget.modlePaginated!.statusTrans
                      : widget.model!.statusTrans,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 11, color: Colors.black.withOpacity(0.03)),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 13, right: 9, top: 6, bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${LocaleKeys.orders_order.tr()} #${!widget.isWallet ? widget.modlePaginated!.id : widget.model!.id}",
                          style: const TextStyle(
                              color: mainColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          !widget.isWallet
                              ? widget.modlePaginated!.date
                              : widget.model!.date,
                          style: const TextStyle(
                              color: Color((0xff9C9C9C)),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    (!widget.isWallet &&
                                widget.modlePaginated!.images.isNotEmpty) ||
                            (widget.isWallet && widget.model!.images.isNotEmpty)
                        ? Row(
                            children: [
                              ...List.generate(
                                (widget.isWallet &&
                                            widget.model!.images.length > 3) ||
                                        !widget.isWallet &&
                                            widget.modlePaginated!.images
                                                    .length >
                                                3
                                    ? 3
                                    : !widget.isWallet
                                        ? widget.modlePaginated!.images.length
                                        : widget.model!.images.length,
                                (index) => CustomDecoratedBox(
                                  isWallet: widget.isWallet,
                                  images: widget.model?.images[index],
                                  imagesPagigated:
                                      widget.modlePaginated?.images[index],
                                ),
                              ),
                              (widget.isWallet &&
                                          widget.model!.images.length > 3) ||
                                      (!widget.isWallet &&
                                          widget.modlePaginated!.images.length >
                                              3)
                                  ? CustomDecoratedBox(
                                      isWallet: widget.isWallet,
                                      count: !widget.isWallet
                                          ? widget.modlePaginated!.images
                                                  .length -
                                              3
                                          : widget.model!.images.length - 3,
                                      isText: true,
                                    )
                                  : const SizedBox(),
                              const Spacer(),
                              Text(
                                '${widget.isWallet ? widget.model!.amount : widget.modlePaginated!.amount} ${LocaleKeys.r_s.tr()}',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            '${widget.isWallet ? widget.model!.amount : widget.modlePaginated!.amount} ${LocaleKeys.r_s.tr()}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
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
