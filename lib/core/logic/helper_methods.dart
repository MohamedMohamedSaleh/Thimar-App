import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void navegateTo({Widget? toPage}) {
  Navigator.push(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => toPage!,
    ),
  );
}

void navegateReplace({Widget? toPage}) {
  Navigator.pushReplacement(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => toPage!,
    ),
  );
}

enum MessageType { faild, success }

void showMessage({String? message, MessageType type = MessageType.faild}) {
  
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message?? "", textAlign: TextAlign.center,),
      behavior: SnackBarBehavior.floating,
      backgroundColor: (type == MessageType.success)? Theme.of(navigatorKey.currentContext!).primaryColor : Colors.redAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
    ),
  );
}
