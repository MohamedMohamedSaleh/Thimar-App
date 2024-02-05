import 'package:flutter/material.dart';

import 'custom_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.thereIsIcon = true,
    this.bottom,
    this.height = 50,
  });
  final String title;
  final bool thereIsIcon;
  final PreferredSizeWidget? bottom;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Stack(
          children: [
            AppBar(
              title: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Text(title),
              ),
              bottom: bottom,
            ),
            thereIsIcon
                ? const Positioned(
                    top: 15,
                    child: CustomAppBarIcon(),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
