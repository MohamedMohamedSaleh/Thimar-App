import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';

import '../../../../../core/widgets/app_image.dart';

class CustomMyData extends StatelessWidget {
  const CustomMyData({super.key, this.isMain = true});
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Stack(
            children: [
              AppImage(
                'assets/images/vegetable_basket.png',
                height: 70,
                width: 75,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 35,
                  right: 35,
                  child: AppImage(
                    'assets/icon/svg/account/Camera.svg',
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          'محمد صالح',
          style: TextStyle(
              color: isMain ? Colors.white : mainColor,
              fontSize: isMain ? 14 : 16,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          '+96654787856',
          style: TextStyle(
            color: isMain ? const Color(0xffA2D273) : const Color(0xffA7A7A7),
            fontSize: isMain ? 14 : 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
