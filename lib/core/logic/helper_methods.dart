import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/core/constants/my_colors.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future navigateTo({required Widget toPage, bool isRemove = false}) async {
  Navigator.pushAndRemoveUntil(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => toPage,
    ),
    (route) => !isRemove,
  );
}

bool isKeyboardOpen = false;

enum MessageType { faild, success }

void showMessage({String? message, MessageType type = MessageType.faild}) {
  if (message!.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).removeCurrentSnackBar();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        behavior: SnackBarBehavior.floating,
        backgroundColor: (type == MessageType.success)
            ? mainColor.withOpacity(.7)
            : Colors.redAccent,
            
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
