import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/core/widgets/custom_fill_button.dart';
import 'package:vegetable_orders_project/views/home/basket_and_orders/complet_order_view.dart';
import 'package:vegetable_orders_project/views/home/widgets/custom_plus_minus_product.dart';

import 'widget/custom_orders_mony.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'السلة', thereIsIcon: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListView.builder(
            itemBuilder: (context, index) => const _ItemOrder(),
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
          const SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 17,
                  color: const Color(0xff000000).withOpacity(0.02),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 17, top: 7, left: 7, bottom: 7),
              child: Row(
                children: [
                  const Text(
                    'عندك كوبون ؟ ادخل رقم الكوبون',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffB9C9A8),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 37,
                    child: CustomFillButton(
                      title: 'تطبيق',
                      onPress: () {},
                      radius: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'جميع الأسعار تشمل قيمة الضريبة المضافة 15%',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomOrdersMony(),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
      floatingActionButton: ColoredBox(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 32, bottom: 0, top: 5),
            child: SizedBox(
                width: double.infinity,
                child: CustomFillButton(
                  title: 'الانتقال لإتمام الطلب',
                  onPress: () {
                    navegateTo(toPage: const CompletOrderView());
                  },
                )),
          ),
        ),
      ),
    );
  }
}

class _ItemOrder extends StatelessWidget {
  const _ItemOrder();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  blurRadius: 17,
                  color: const Color(0xff000000).withOpacity(0.02))
            ]),
        child: SizedBox(
          height: 90,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8, right: 6, bottom: 8, left: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: AppImage(
                    'https://thimar.amr.aait-d.com/storage/images/product/mMTiqG55dkQG0K95q8T3wSRpu6KHvwXIs7el8Cvj.jpg',
                    height: 75,
                    width: 84,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'طماطم',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    '45ر.س',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomPlusOrMinusProduct(
                    isProductDetails: false,
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CustomAppBarIcon(
                  height: 26,
                  width: 26,
                  color: const Color(0xffFF0000).withOpacity(0.13),
                  child: const AppImage('assets/icon/svg/Trash.svg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
