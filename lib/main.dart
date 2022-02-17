import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/login/login_screen.dart';
import 'package:food_delivery/shared/config/colors.dart';
import 'package:food_delivery/shared/cubit/observer.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(kDefaultBackgroundColor),
          elevation: 0.0,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
