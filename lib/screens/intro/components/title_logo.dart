import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/config/colors.dart';

class TitleAndLogo extends StatelessWidget {
  const TitleAndLogo({
    Key? key,
    this.logoColor,
    this.titleColor,
    required this.inLoginScreen,
  }) : super(key: key);
  final Color? logoColor;
  final Color? titleColor;
  final bool inLoginScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          inLoginScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/logo.svg', color: logoColor),
        Text(
          'Foodizone',
          style: inLoginScreen
              ? TextStyle(color: titleColor, fontSize: 25)
              : Theme.of(context).textTheme.headline6!.copyWith(
                    color: const Color(kDefaultBackgroundColor),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
        ),
      ],
    );
  }
}
