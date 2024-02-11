import 'package:flutter/material.dart';

import '../../../core/widgets/app_image.dart';

class CustomDecoratedBox extends StatelessWidget {
  const CustomDecoratedBox({super.key, this.isText = false});
  final bool isText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: SizedBox(
        height: 25,
        width: 25,
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: !isText
                  ? Border.all(color: const Color(0xff61B80C).withOpacity(0.06))
                  : null,
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xffEDF5E6)),
          child: isText
              ? Center(
                  child: Text(
                    "2+",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : const AppImage(
                  'https://previews.123rf.com/images/spamas/spamas1909/spamas190900328/130747578-tomato-isolated-on-white-background-full-depth-of-field.jpg',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }
}
