import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/kiwi.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/features/cart/cart_cubit.dart';
import 'package:vegetable_orders_project/features/products/similar_products/similar_products_bloc.dart';
import 'package:vegetable_orders_project/features/products/update_amount/update_amount_cubit.dart';
import 'package:vegetable_orders_project/views/auth/splash/splash_view.dart';
import 'core/logic/helper_methods.dart';
import 'features/products/get_favorite_product/get_favorite_products_cubit.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: getMaterialColor(),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  initKiwi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (BuildContext context) => GetFavoriteProductCubit()
            ..getData()
            ..getFavoriteData(),
        ),

        BlocProvider(
          create: (BuildContext context) => CartCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => UpdateAmountCubit(),
        ),
      ],
      child: MaterialApp(
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
        home: const SplashView(),
      ),
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
