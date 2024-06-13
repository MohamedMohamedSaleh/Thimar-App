import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton({
    super.key,
    required this.title,
    required this.onPress,
    this.isLoading = false,
    this.radius = 15,
  });
  final String title;
  final VoidCallback onPress;
  final bool isLoading;
  final double radius;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      height: 50.h,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius).w),
        ),
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
