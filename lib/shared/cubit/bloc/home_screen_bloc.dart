import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/shared/cubit/states.dart';

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
}
