import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  const CustomAppBarIcon({
    super.key,
    this.child = const Icon(
      Icons.arrow_back_ios_rounded,
      textDirection: TextDirection.rtl,
      color: Color(0xff4C8613),
    ), this.isBack = true,
  });
  final Widget child;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isBack?
        Navigator.pop(context): null;
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.green.withOpacity(.1)),
        height: 32,
        width: 32,
        child: child,
      ),
    );
  }
}
