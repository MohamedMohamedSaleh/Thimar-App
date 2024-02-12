import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/widgets/custom_form_input.dart';

import '../../../../../core/widgets/app_image.dart';

class ProductEvaluateItem extends StatelessWidget {
  const ProductEvaluateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16,bottom: 16),
      child: DecoratedBox(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 17)
        ]),
        child: const Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8, right: 6, bottom: 8, left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: AppImage(
                      'https://thimar.amr.aait-d.com/storage/images/product/mMTiqG55dkQG0K95q8T3wSRpu6KHvwXIs7el8Cvj.jpg',
                      height: 64,
                      width: 75,
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
                        color: mainColor,
                      ),
                    ),
                    Text(
                      'السعر / 1كجم',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff808080),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '45ر.س',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '56ر.س',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.orange,
                  size: 20,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.orange,
                  size: 20,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.orange,
                  size: 20,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.orange,
                  size: 20,
                ),
                Icon(
                  Icons.star_border_rounded,
                  color: Color(0xffD5D5D5),
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(height: 83, child: CustomFormInput(labelText: 'تعليق المنتج', isFillColor: false, maxLines: 3,)),
            ),
          SizedBox(height: 11,),
          ],
        ),
      ),
    );
  }
}
