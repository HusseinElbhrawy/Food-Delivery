import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../shared/cubit/bloc/home_screen_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.homeScreenBloc,
  }) : super(key: key);

  final HomeScreenBloc homeScreenBloc;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      activeColor: const Color(0xffFF7B7B),
      inactiveColor: Colors.grey,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      backgroundColor: Colors.white,
      onTap: (newIndex) {
        Navigator.pushNamed(context, homeScreenBloc.screens[newIndex]);
      },
      activeIndex: homeScreenBloc.currentIndex,
      icons: homeScreenBloc.icons,
    );
  }
}
