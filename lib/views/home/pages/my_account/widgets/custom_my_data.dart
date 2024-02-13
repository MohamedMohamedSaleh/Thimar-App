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
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Stack(
            children: [
              const AppImage(
                'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707782400&semt=sph',
                height: 70,
                width: 75,
                fit: BoxFit.cover,
              ),
              isMain
                  ? const SizedBox()
                  : const Positioned(
                      top: 30,
                      right: 28,
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
