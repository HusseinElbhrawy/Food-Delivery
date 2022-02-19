import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
import 'package:food_delivery/screens/intro/inro_screen.dart';
import 'package:food_delivery/screens/layout/layout_screen.dart';
import 'package:food_delivery/screens/login/login_screen.dart';
import 'package:food_delivery/screens/my_order/my_order_screen.dart';
import 'package:food_delivery/screens/track_order/track_order_screen.dart';
import 'package:food_delivery/screens/verify/verify_screen.dart';
import 'package:food_delivery/shared/cahced/cahced_helper.dart';
import 'package:food_delivery/shared/config/colors.dart';
import 'package:food_delivery/shared/config/const.dart';
import 'package:food_delivery/shared/cubit/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CachedHelper.initializedShared();

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  static final bool isFirstTime = CachedHelper.getData(key: kFirstTime) ?? true;
  static final bool isLogin =
      CachedHelper.getData(key: kIsLoginToAccount) ?? false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Color(kDefaultBackgroundColor),
          elevation: 0.0,
        ),
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        IntroScreen.routeName: (context) => const IntroScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        MyOrderScreen.routeName: (context) => const MyOrderScreen(),
        TrackOrderScreen.routeName: (context) => const TrackOrderScreen(),
        VerifyScreen.routeName: (context) => const VerifyScreen(),
        LayoutScreen.routeName: (context) => const LayoutScreen(),
      },
      // initialRoute: LayoutScreen.routeName,
      initialRoute: isFirstTime
          ? IntroScreen.routeName
          : isLogin
              ? LayoutScreen.routeName
              : LoginScreen.routeName,
    );
  }
}
