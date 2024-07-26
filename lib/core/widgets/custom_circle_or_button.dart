import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:vegetable_orders_project/core/widgets/custom_outline_send_button.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';
import 'package:vegetable_orders_project/views/auth/forget_password/bloc/forget_password_bloc.dart';

class CustomCircleOrButton extends StatefulWidget {
  const CustomCircleOrButton({super.key, required this.phone});
  final String phone;
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
    for (int i = 0; i < 90; i++) {
      if (!mounted) return;
      setState(() {});
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
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
                    value: ((minute == 1) ? (second + 60) : second) / 90,
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
                title: LocaleKeys.check_code_resend.tr(),
                onPress: () {
                  startCounting();
                  KiwiContainer()
                      .resolve<ForgetPasswordBloc>()
                      .add(ForgetPasswordEvent(phone: widget.phone, resend: true));
                },
              ),
            ),
          );
  }
}
