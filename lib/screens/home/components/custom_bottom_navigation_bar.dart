import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.icons,
  }) : super(key: key);

  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      activeColor: const Color(0xffFF7B7B),
      inactiveColor: Colors.grey,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      backgroundColor: Colors.white,
      onTap: (index) {},
      activeIndex: 0,
      icons: icons,
    );
  }
}
