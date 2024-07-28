import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';

class CustomIntroduction extends StatelessWidget {
  const CustomIntroduction({
    super.key,
    required this.mainText,
    required this.supText,
    this.isRequirPhoneCheck = false,
    this.paddingHeight = 20,
    required this.phone,
  });
  final String mainText;
  final String supText;
  final bool isRequirPhoneCheck;
  final double paddingHeight;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Center(
            child: Image.asset(
              "assets/images/vegetable_basket.png",
              width: 130.w,
              height: 125.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 21.h, bottom: 6.h),
          child: Text(
            mainText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          supText,
          style: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.w300, height: 1.5),
        ),
        isRequirPhoneCheck
            ? Row(
                children: [
                  Text(
                    "+966$phone",
                    //TODO: change phone

                    textDirection: mat.TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        height: .5),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.zero, // Set padding to zero
                      ),
                    ),
                    child: Text(
                      LocaleKeys.check_code_change_phone_number.tr(),
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: .1),
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        SizedBox(
          height: paddingHeight,
        ),
      ],
    );
  }
}
