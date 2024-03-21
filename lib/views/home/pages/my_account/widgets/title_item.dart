import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';
import 'package:vegetable_orders_project/core/widgets/app_image.dart';
import 'package:vegetable_orders_project/core/widgets/custom_app_bar_icon.dart';
import 'package:vegetable_orders_project/features/addresses/addresses_model.dart';

class TitleItem extends StatefulWidget {
  const TitleItem({super.key, required this.model});
  final AddressModel model;

  @override
  State<TitleItem> createState() => _TitleItemState();
}

class _TitleItemState extends State<TitleItem> {
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
        child: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 13, bottom: 10, top: 8),
          child: Row(
            // crossAxisAlignment: WrapCrossAlignment.start,
            // direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.type,
                      style: const TextStyle(
                        color: mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'العنوان : ${widget.model.location}',
                      style: const TextStyle(
                        color: mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'الوصف: ${widget.model.description}',
                      style: const TextStyle(
                        color: Color(0xff999797),
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'رقم الجوال: ${widget.model.phone}',
                      style: const TextStyle(
                        color: Color(0xff999797),
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Column(
                children: [
                  Row(
                    children: [
                      CustomAppBarIcon(
                        height: 24,
                        width: 24,
                        isBack: false,
                        color: Color(0xffFFD4D4),
                        child: AppImage(
                          'assets/icon/svg/Trash.svg',
                        ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
