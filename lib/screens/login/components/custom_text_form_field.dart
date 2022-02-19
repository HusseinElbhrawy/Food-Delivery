import 'package:flutter/material.dart';
import 'package:food_delivery/shared/config/colors.dart';

import '../../../shared/config/components.dart';
import '../../../shared/cubit/bloc/login_bloc.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    Key? key,
    required this.loginCubit,
    this.validateMessage,
  }) : super(key: key);

  final LoginBloc loginCubit;
  final String? validateMessage;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty || value == null) {
          return validateMessage;
        }
        return null;
      },
      obscureText: loginCubit.isHidden,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock_outlined,
          color: Color(kSecondColor),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            loginCubit.changePasswordStatus();
          },
          icon: loginCubit.isHidden
              ? const Icon(
                  Icons.visibility_outlined,
                  color: Color(kDefaultColor),
                )
              : const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.black,
                ),
        ),
        fillColor: Colors.white,
        hintText: 'Password',
        filled: true,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }
}
