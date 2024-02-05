import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/views/home/pages/main/screens/product_details_view.dart';

import '../../../core/widgets/custom_fill_button.dart';
import '../../../feature/products/products_model.dart';

class ItemProduct extends StatefulWidget {
  const ItemProduct({super.key, required this.model, this.isMainPage = false});
  final ProductModel model;
  final bool isMainPage;

  @override
  State<ItemProduct> createState() => ItemProductState();
}

class ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navegateTo(toPage: const ProductDetailsView());
      },
      child: DecoratedBox(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 11,
            offset: const Offset(0, 2),
          ),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            widget.model.mainImage,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Container(
                              height: 18,
                              width: 55,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(11),
                                    bottomRight: Radius.circular(11)),
                              ),
                              child: Text(
                                '${widget.model.discount}%',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    widget.model.title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'السعر / ${widget.model.unit.name}',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color(0Xff808080)),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.model.price} ر.س',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '${widget.model.priceBeforeDiscount} ر.س',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.lineThrough),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 23,
                        width: 23,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(0),
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  widget.isMainPage
                      ? const SizedBox(
                          height: 12,
                        )
                      : const SizedBox(),
                  widget.isMainPage
                      ? Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 30,
                            width: 115,
                            child: CustomFillButton(
                              radius: 9,
                              title: 'أضف للسلة',
                              onPress: () {
                                
                              },
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 5,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
