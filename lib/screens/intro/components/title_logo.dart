import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/config/colors.dart';

class TitleAndLogo extends StatelessWidget {
  const TitleAndLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('assets/images/logo.svg'),
        Text(
          'Foodizone',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: const Color(kDefaultBackgroundColor),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
        ),
      ],
    );
  }
}
