import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/my_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.onTap, required this.title,
  });
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          DottedBorder(
            strokeWidth: 2.5,
            dashPattern: const [4],
            color: mainColor,
            radius: const Radius.circular(15),
            borderType: BorderType.RRect,
            child: const SizedBox(
              height: 48,
              width: double.infinity,
            ),
          ),
          SizedBox(
              height: 52,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color(0xffF9FCF5),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  title,
                  style: const TextStyle(
                      color: mainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
              ))
        ],
      ),
    );
  }
}
