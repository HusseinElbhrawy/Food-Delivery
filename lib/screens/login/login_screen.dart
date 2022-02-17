import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/intro/components/custom_button.dart';
import 'package:food_delivery/shared/config/colors.dart';
import 'package:food_delivery/shared/config/const.dart';
import 'package:food_delivery/shared/cubit/bloc/login_bloc.dart';
import 'package:food_delivery/shared/cubit/states.dart';

import '../intro/components/title_logo.dart';
import 'components/custom_text_form_field.dart';
import 'components/phone_number_text_form_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: const Color(kDefaultBackgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding * 5),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: const [
                    Image(
                      image: AssetImage('assets/images/Group 324.png'),
                    ),
                    TitleAndLogo(
                      logoColor: Colors.white54,
                      titleColor: Colors.white54,
                      inLoginScreen: true,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(
                  start: kDefaultPadding * 2,
                  end: kDefaultPadding * 2,
                ),
                child: PhoneNumberTextFormFiled(),
              ),
              BlocConsumer<LoginBloc, DeliveryStates>(
                listener: (BuildContext context, state) {},
                builder: (BuildContext context, Object? state) {
                  var loginCubit = LoginBloc.object(context);
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: kDefaultPadding,
                      start: kDefaultPadding * 2,
                      end: kDefaultPadding * 2,
                    ),
                    child: CustomTextFormFiled(loginCubit: loginCubit),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: kDefaultPadding * 3,
                  bottom: kDefaultPadding,
                ),
                child: CustomButton(
                  width: width / 1.15,
                  height: height / 12,
                  onTap: () {},
                  color: Colors.black,
                  text: 'Login to account 😋',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(top: kDefaultPadding / 2),
                child: CustomButton(
                  width: width / 1.15,
                  height: height / 12,
                  onTap: () {},
                  color: const Color(kSecondColor),
                  text: 'Create new account',
                ),
              ),
              SizedBox(height: height / 25),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password ?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
