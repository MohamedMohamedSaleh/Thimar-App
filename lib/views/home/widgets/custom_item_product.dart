
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_fill_button.dart';
import '../../../feature/products/products_model.dart';

class ItemProduct extends StatefulWidget {
  const ItemProduct({super.key, required this.model});
  final ProductModel model;

  @override
  State<ItemProduct> createState() => ItemProductState();
}

class ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${widget.model.priceBeforeDiscount} ر.س',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 115,
              child: CustomFillButton(
                radius: 9,
                title: 'أضف للسلة',
                onPress: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

