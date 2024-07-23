import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegetable_orders_project/core/kiwi.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/views/auth/splash/splash_view.dart';
import 'core/constants/my_colors.dart';
import 'core/logic/helper_methods.dart';
import 'generated/codegen_loader.g.dart';

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
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        saveLocale: true,
        startLocale: const Locale('en'),
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //693.3
    //320.0
    return ScreenUtilInit(
      designSize: const Size(330, 750),
      builder: (context, child) => MaterialApp(
         localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
        
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Orders App',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: getMaterialColor()),
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
        home: child,
      ),
      child: const SplashView(),
    );
  }
}

MaterialColor getMaterialColor() {
  Color myColor = mainColor;
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
