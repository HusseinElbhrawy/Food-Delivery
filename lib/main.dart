import 'package:flutter/material.dart';
import 'package:food_delivery/screens/intro/inro_screen.dart';
import 'package:food_delivery/shared/config/colors.dart';

void main() {
  runApp(const MyApp());
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
      home: IntroScreen(),
    );
  }
}
