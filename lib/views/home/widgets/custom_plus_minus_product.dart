
import 'package:flutter/material.dart';

class CustomPlusOrMinusProduct extends StatelessWidget {
  const CustomPlusOrMinusProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: const Color(0xff4C8613).withOpacity(0.11),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Row(children: [
            SizedBox(
              height: 27,
              width: 27,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '5',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 27,
              width: 27,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white),
                child: Icon(
                  Icons.remove,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
