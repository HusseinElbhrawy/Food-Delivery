import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
import 'package:food_delivery/shared/cahced/cahced_helper.dart';
import 'package:food_delivery/shared/config/colors.dart';
import 'package:food_delivery/shared/config/const.dart';
import 'package:food_delivery/shared/cubit/bloc/login_bloc.dart';
import 'package:food_delivery/shared/cubit/states.dart';

import 'components/verify_code.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);
  static const routeName = 'VerifyScreen';
  static final TextEditingController _pinPutController =
      TextEditingController();

  static final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.white),
      color: const Color(kSecondColor),
      borderRadius: BorderRadius.circular(kDefaultPadding),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String phoneNumber = args['phoneNumber'].toString();
    return BlocProvider(
      create: (BuildContext context) => LoginBloc()
        ..createAccountUsingPhoneNumber(
            context: context, phoneNumber: phoneNumber),
      child: Scaffold(
        backgroundColor: const Color(kDefaultBackgroundColor),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: const Color(0xffFFA8A8),
                child: Image.asset('assets/images/verifypng'),
              ),
            ),
            Text(
              'Verification code',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding * 2),
              child: Text(
                'We sent you a Verification code to your mobile number',
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            BlocConsumer<LoginBloc, DeliveryStates>(
              listener: (BuildContext context, state) {},
              builder: (BuildContext context, Object? state) {
                var cubit = LoginBloc.object(context);
                return VerifyCodeForm(
                  onSubmit: (value) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(
                        PhoneAuthProvider.credential(
                          verificationId: cubit.verificationId,
                          smsCode: value,
                        ),
                      )
                          .then((value) async {
                        if (value.user != null) {
                          CachedHelper.setData(
                            key: kIsLoginToAccount,
                            value: true,
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            HomeScreen.routeName,
                          );
                        }
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('invalid OTP'),
                        ),
                      );
                    }
                  },
                  width: width,
                  pinPutFocusNode: _pinPutFocusNode,
                  pinPutController: _pinPutController,
                  pinPutDecoration: _pinPutDecoration,
                );
              },
            ),
            TextButton(
              onPressed: () {
                print(phoneNumber);
                // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              child: Text(
                'Resend Verification code',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
