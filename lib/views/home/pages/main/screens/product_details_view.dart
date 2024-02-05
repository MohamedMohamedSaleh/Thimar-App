import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';

import '../../../widgets/custom_plus_minus_product.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              child: Row(
                children: [
                  CustomAppBarIcon(),
                  Spacer(),
                  CustomAppBarIcon(
                    isBack: false,
                    child: AppImage('assets/icon/svg/heart.svg'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: AppImage(
                        'https://thimar.amr.aait-d.com/storage/images/product/hUndq46mGZBRIw7Ryal5FQBAB9S95mwtuNinWs4L.jpg',
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 16, left: 16, top: 5, bottom: 4),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'طماطم',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            const Text(
                              '40%',
                              style: TextStyle(
                                  color: Color(0xffFF0000),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '45ر.س',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '56ر.س',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Row(
                          children: [
                            Text(
                              'السعر / 1كجم',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff808080),
                              ),
                            ),
                            Spacer(),
                            CustomPlusOrMinusProduct(),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
