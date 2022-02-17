import 'package:flutter/material.dart';

import '../../../shared/config/const.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  final Function onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
        end: kDefaultPadding,
        start: kDefaultPadding,
        top: kDefaultPadding,
      ),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: () => onTap(),
        icon: Icon(icon, color: Colors.black),
      ),
    );
  }
}
