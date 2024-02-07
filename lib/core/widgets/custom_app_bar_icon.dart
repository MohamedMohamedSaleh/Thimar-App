import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  const CustomAppBarIcon({
    super.key,
    this.child = const Icon(
      Icons.arrow_back_ios_rounded,
      textDirection: TextDirection.rtl,
      color: Color(0xff4C8613),
    ),
    this.isBack = true,
    this.height = 32,
    this.width = 32,
    this.color,
  });
  final Widget child;
  final bool isBack;
  final double height;
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isBack ? Navigator.pop(context) : null;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: color ?? const Color(0xff4C8613).withOpacity(0.13),
        ),
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
