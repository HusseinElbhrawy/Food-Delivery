import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/my_order/my_order_screen.dart';
import 'package:food_delivery/shared/cubit/states.dart';

import '../../../screens/track_order/track_order_screen.dart';
import '../../IconBroken.dart';

class HomeScreenBloc extends Cubit<DeliveryStates> {
  HomeScreenBloc() : super(HomeScreenInitialState());

  static HomeScreenBloc object(context) => BlocProvider.of(context);
  List categories = [
    '🍔 Burgers',
    '🍕 Pizza',
    '🥗 Healthy',
  ];

  List areSelected = [
    true,
    false,
    false,
  ];
  void changeSelection({required index}) {
    areSelected[index] = !areSelected[index];
    emit(ChangeContainerSelection());
  }

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  List screens = [
    'null',
    'null',
    MyOrderScreen.routeName,
    TrackOrderScreen.routeName,
  ];
  int currentIndex = 0;
  changeIndex(newIndex) {
    currentIndex = newIndex;
    emit(TestState());
  }

  List<IconData> icons = [
    IconBroken.Home,
    IconBroken.Heart,
    IconBroken.Bag_2,
    IconBroken.User1,
  ];
}
