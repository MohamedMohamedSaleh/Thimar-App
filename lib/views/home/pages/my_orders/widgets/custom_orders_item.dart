
import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_image.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: const Color(0xffEDF5E6),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "طلب #4587",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "27,يونيو,2021",
                        style: TextStyle(
                            color: Color((0xff9C9C9C)),
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 9, top: 9),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: Color(0xffEAFFD5)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Text('جاري التحضير'),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                children: [
                  const _CustomDecoratedBox(),
                  const _CustomDecoratedBox(),
                  const _CustomDecoratedBox(),
                  const _CustomDecoratedBox(
                    isText: true,
                  ),
                  const Spacer(),
                  Text(
                    '180ر.س',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomDecoratedBox extends StatelessWidget {
  const _CustomDecoratedBox({this.isText = false});
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
