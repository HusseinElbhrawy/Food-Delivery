import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/intro/components/custom_button.dart';
import 'package:food_delivery/shared/config/colors.dart';
import 'package:food_delivery/shared/config/const.dart';
import 'package:food_delivery/shared/cubit/bloc/login_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../shared/config/components.dart';
import '../../shared/cubit/states.dart';
import '../intro/components/title_logo.dart';
import '../verify/verify_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = 'LoginScreen';
  static final formKey = GlobalKey<FormState>();
  static final TextEditingController phoneNumberController =
      TextEditingController();
  static final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    String? phoneNum;
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: Form(
        key: formKey,
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
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: kDefaultPadding * 2,
                    end: kDefaultPadding * 2,
                  ),
                  child: IntlPhoneField(
                    controller: phoneNumberController,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Please Enter your phone';
                      }
                      return null;
                    },
                    onChanged: (phone) {
                      phoneNum = phone.completeNumber;
                    },
                    decoration: InputDecoration(
                      hintText: 'Your Phone Number',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 18),
                      fillColor: Colors.white,
                      filled: true,
                      alignLabelWithHint: true,
                      border: buildOutlineInputBorder(),
                      enabledBorder: buildOutlineInputBorder(),
                      focusedBorder: buildOutlineInputBorder(),
                    ),
                    initialCountryCode: 'EG',
                  ),
                ),
                /* Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: kDefaultPadding,
                          start: kDefaultPadding * 2,
                          end: kDefaultPadding * 2,
                        ),
                        child: CustomTextFormFiled(
                          loginCubit: loginCubit,
                          validateMessage: 'Please enter your password',
                        ),
                      ),*/
                BlocConsumer<LoginBloc, DeliveryStates>(
                  listener: (BuildContext context, state) {},
                  builder: (BuildContext context, Object? state) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: kDefaultPadding * 3,
                        bottom: kDefaultPadding,
                      ),
                      child: CustomButton(
                        width: width / 1.15,
                        height: height / 12,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            VerifyScreen.routeName,
                            arguments: {
                              'phoneNumber': phoneNum.toString(),
                            },
                          );
                        },
                        color: Colors.black,
                        text: 'Login to account 😋',
                      ),
                    );
                  },
                ),
/*                    Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: kDefaultPadding / 2),
                        child: CustomButton(
                          width: width / 1.15,
                          height: height / 12,
                          onTap: () {
                            */ /*if (formKey.currentState!.validate()) {
                            LoginBloc.object(context).createAccountUsingPhoneNumber(phoneNumber: )
                          }*/ /*
                          },
                          color: const Color(kSecondColor),
                          text: 'Create new account',
                        ),
                      ),*/
                SizedBox(height: height / 25),
/*                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
