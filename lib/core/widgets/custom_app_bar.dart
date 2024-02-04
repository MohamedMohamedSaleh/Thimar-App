import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isOrders = false,
    this.bottom,
    this.height = 55,
  });
  final String title;
  final bool isOrders;
  final PreferredSizeWidget? bottom;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: AppBar(
          title: Text(title),
          bottom: bottom,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
