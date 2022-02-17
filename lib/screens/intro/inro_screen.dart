import 'package:flutter/material.dart';
import 'package:food_delivery/shared/config/const.dart';
import 'package:lottie/lottie.dart';

import '../../shared/config/colors.dart';
import 'components/custom_button.dart';
import 'components/title_logo.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(kDefaultBackgroundColor),
      appBar: AppBar(),
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Lottie.network(
              'https://assets6.lottiefiles.com/packages/lf20_jm1zwwig.json',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding * 2),
            child: Container(
              height: height / 2,
              width: width / 1.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(kDefaultPadding * 1),
                    child: TitleAndLogo(inLoginScreen: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Feeling Hungry ?',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: 24,
                                  ),
                        ),
                        Text(
                          'Let\'s order right now',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: 24,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'The fastest delivery service in the town, start ordering now',
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomButton(
                      width: width / 1.3,
                      height: height / 12,
                      color: const Color(0xffFF5556),
                      onTap: () {},
                      text: 'Let’s Order 😋'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
