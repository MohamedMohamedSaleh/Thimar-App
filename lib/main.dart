import 'package:flutter/material.dart';
import 'package:vegetable_orders_project/views/home/home_view.dart';
import 'core/logic/helper_methods.dart';

void main() {
/*   SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(// navigation bar color
    statusBarColor: getMaterialColor(), // status bar color 
  )); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      title: 'Orders App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          
          centerTitle: true,
          elevation: 0,
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: getMaterialColor(),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: getMaterialColor(),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: FilledButton.styleFrom(
            side: BorderSide(color: getMaterialColor()),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide()),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF3F3F3),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF3F3F3),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
      home: const HomeView(),
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
