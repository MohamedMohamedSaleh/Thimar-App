import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.text,
    required this.buttonText,
    this.paddingBottom = 26,
    required this.onPress,
  });
  final String text;
  final String buttonText;
  final double paddingBottom;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom.h, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 15.sp,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          TextButton(
            onPressed: onPress,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 15.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
