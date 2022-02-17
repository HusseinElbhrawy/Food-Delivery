import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/shared/cubit/states.dart';

class LoginBloc extends Cubit<DeliveryStates> {
  LoginBloc() : super(InitialLoginState());

  static LoginBloc object(context) => BlocProvider.of(context);

  bool isHidden = true;
  void changePasswordStatus() {
    isHidden = !isHidden;
    emit(ChangeLoginPasswordStatus());
  }
}
