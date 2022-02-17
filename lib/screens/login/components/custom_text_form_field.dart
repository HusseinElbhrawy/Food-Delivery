import 'package:flutter/material.dart';

import '../../../shared/config/components.dart';
import '../../../shared/cubit/bloc/login_bloc.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    Key? key,
    required this.loginCubit,
  }) : super(key: key);

  final LoginBloc loginCubit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: loginCubit.isHidden,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          onPressed: () {
            loginCubit.changePasswordStatus();
          },
          icon: const Icon(Icons.visibility_outlined),
        ),
        fillColor: Colors.white,
        hintText: 'Password',
        filled: true,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }
}
