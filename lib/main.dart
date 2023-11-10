import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/views/change_password/change_password_view.dart';
// import 'package:vegetable_orders_project/views/forget_password/forget_password_view.dart';
// import 'package:vegetable_orders_project/views/login/login_view.dart';

// import 'views/register/register_view.dart';

// import 'views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      title: 'Orders App',
      theme: ThemeData(
        primarySwatch: getMaterialColor(),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
           
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: const BorderSide(
              color: Color(0xffF3F3F3),
            ),

          ),
        ),
        
      ),
      home: const ChangePasswordView(),
    );
  }
}

MaterialColor getMaterialColor() {
  Color myColor = const Color(0xff4C8613);
  return MaterialColor(
    myColor.value,
    {
      50: myColor.withOpacity(.1),
      100: myColor.withOpacity(.2),
      200: myColor.withOpacity(.3),
      300: myColor.withOpacity(.4),
      400: myColor.withOpacity(.5),
      500: myColor.withOpacity(.6),
      600: myColor.withOpacity(.7),
      700: myColor.withOpacity(.8),
      800: myColor.withOpacity(.9),
      900: myColor,
    },
  );
}
