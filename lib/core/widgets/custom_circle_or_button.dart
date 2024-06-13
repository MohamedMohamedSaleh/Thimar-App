import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetable_orders_project/core/widgets/custom_outline_send_button.dart';

class CustomCircleOrButton extends StatefulWidget {
  const CustomCircleOrButton({super.key});

  @override
  State<CustomCircleOrButton> createState() => _CustomCircleOrButtonState();
}

class _CustomCircleOrButtonState extends State<CustomCircleOrButton> {
  double second = 0;
  double minute = 0;
  bool isTemerFinished = false;
  @override
  void initState() {
    super.initState();
    startCounting();
  }

  void startCounting() async {
    second = 0;
    minute = 0;
    isTemerFinished = false;
    for (int i = 0; i < 10; i++) {
      setState(() {});
      await Future.delayed(const Duration(seconds: 1));
      second++;
      if (second == 60) {
        minute++;
        second = 0;
      }
    }
    isTemerFinished = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return !isTemerFinished
        ? Center(
            child: SizedBox(
              height: 60.h,
              width: 60.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: ((minute == 1) ? (second + 60) : second) / 10,
                    strokeWidth: 3,
                    backgroundColor: const Color(0xffD8D8D8),
                  ),
                  Center(
                    child: Text(
                      "${minute.round().toString().padLeft(2, '0')}:${second.round().toString().padLeft(2, '0')}",
                      style: TextStyle(
                          fontSize: 21.sp,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Center(
            child: SizedBox(
              height: 47.h,
              child: CustomOutlineButton(
                title: 'إعادة الإرسال',
                onPress: () {
                  startCounting();
                },
              ),
            ),
          );
  }
}
