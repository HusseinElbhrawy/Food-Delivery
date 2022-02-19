import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
import 'package:food_delivery/shared/cubit/bloc/home_screen_bloc.dart';
import 'package:food_delivery/shared/cubit/states.dart';

import '../../shared/IconBroken.dart';
import '../home/components/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);
  static const routeName = 'LayoutScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenBloc(),
      child: BlocConsumer<HomeScreenBloc, DeliveryStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var homeScreenBloc = HomeScreenBloc.object(context);
          return Scaffold(
            body: const HomeScreen(),
            bottomNavigationBar:
                CustomBottomNavigationBar(homeScreenBloc: homeScreenBloc),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xffF54748),
              onPressed: () {},
              child: const Icon(IconBroken.Search),
            ),
            // bottomNavigationBar: ,
          );
        },
      ),
    );
  }
}
