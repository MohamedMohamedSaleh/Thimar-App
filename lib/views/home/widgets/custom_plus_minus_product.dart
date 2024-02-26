import 'package:flutter/material.dart';

class CustomPlusOrMinusProduct extends StatelessWidget {
  const CustomPlusOrMinusProduct({super.key, this.isProductDetails = true, required this.amount});
  final bool isProductDetails;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isProductDetails ? 33 : 26,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: const Color(0xff4C8613).withOpacity(0.11),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isProductDetails ? 5 : 2,
              vertical: isProductDetails ? 3 : 2),
          child: Row(children: [
            SizedBox(
              height: isProductDetails ? 27 : 21,
              width: isProductDetails ? 27 : 21,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(isProductDetails ? 9 : 6),
                    color: Colors.white),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: isProductDetails ? 15 : 8),
              child: Text(
                '$amount',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: isProductDetails ? 15 : 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: isProductDetails ? 27 : 21,
              width: isProductDetails ? 27 : 21,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(isProductDetails ? 9 : 6),
                    color: Colors.white),
                child: Icon(
                  Icons.remove,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
