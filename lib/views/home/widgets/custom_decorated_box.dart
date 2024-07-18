import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/features/my_orders/all_orders_model.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/wallet/wallet_model.dart';

import '../../../core/widgets/app_image.dart';
import '../pages/my_account/bloc/wallet/wallet_paginated_model.dart';

class CustomDecoratedBox extends StatelessWidget {
  const CustomDecoratedBox(
      {super.key,
      this.isText = false,
      this.product,
      this.count,
      this.images,
      this.isWallet = false,
      this.imagesPagigated});
  final bool isText;
  final Products? product;
  final Images? images;
  final ImagesPaginated? imagesPagigated;
  final int? count;
  final bool isWallet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: SizedBox(
        height: 25,
        width: 25,
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: !isText
                  ? Border.all(color: const Color(0xff61B80C).withOpacity(0.06))
                  : null,
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xffEDF5E6)),
          child: isText
              ? Center(
                  child: Text(
                    "$count+",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : product != null || images != null || imagesPagigated != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: AppImage(
                        isWallet
                            ? images!.url
                            : imagesPagigated != null
                                ? imagesPagigated!.url
                                : product!.url,
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(),
        ),
      ),
    );
  }
}
