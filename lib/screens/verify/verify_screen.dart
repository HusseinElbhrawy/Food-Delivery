import 'package:flutter/material.dart';
import 'package:food_delivery/shared/config/colors.dart';
import 'package:food_delivery/shared/config/const.dart';

import 'components/verify_code.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);
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

    return Scaffold(
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
          VerifyCodeForm(
            width: width,
            pinPutFocusNode: _pinPutFocusNode,
            pinPutController: _pinPutController,
            pinPutDecoration: _pinPutDecoration,
          ),
          TextButton(
            onPressed: () {},
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
    );
  }
}
