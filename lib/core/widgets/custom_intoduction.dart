import 'package:flutter/material.dart';

class CustomIntroduction extends StatelessWidget {
  const CustomIntroduction(
      {super.key,
      required this.mainText,
      required this.supText,
      this.isRequirPhoneCheck = false,
      this.paddingHeight = 20,});
  final String mainText;
  final String supText;
  final bool isRequirPhoneCheck;
  final double paddingHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Image.asset(
              "assets/images/vegetable_basket.png",
              width: 130,
              height: 125,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 21, bottom: 6),
          child: Text(
            mainText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          supText,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300,height: 1.5),
        ),
        isRequirPhoneCheck
            ? Row(
                children: [
                  const Text(
                    "+9660548745",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w300, height: .5),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.zero, // Set padding to zero
                      ),
                    ),
                    child: const Text(
                      " تغيير رقم الجوال",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
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
