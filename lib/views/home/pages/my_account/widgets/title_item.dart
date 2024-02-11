import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';

class TitleItem extends StatelessWidget {
  const TitleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 17,
              color: Colors.black.withOpacity(0.03),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: mainColor,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(right: 16, left: 13, bottom: 10, top: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'المنزل',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'العنوان : 119 طريق الملك عبدالعزيز',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'الوصف',
                    style: TextStyle(
                      color: Color(0xff999797),
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  
                  Text(
                    'رقم الجوال',
                    style: TextStyle(
                      color: Color(0xff999797),
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Spacer(),
              CustomAppBarIcon(
                height: 24,
                width: 24,
                isBack: false,
                color: Color(0xffFFD4D4),
                child: AppImage('assets/icon/svg/Trash.svg',),
              ),
              SizedBox(
                width: 10,
              ),
              CustomAppBarIcon(
                isBack: false,
                height: 24,
                width: 24,
                child: AppImage('assets/icon/svg/account/Edit2.svg'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
