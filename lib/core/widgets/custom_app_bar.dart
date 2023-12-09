import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isOrders = false,
  });
  final String title;
  final bool isOrders;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}
