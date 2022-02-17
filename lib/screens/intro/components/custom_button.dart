import 'package:flutter/material.dart';

import '../../../shared/config/const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(width, height)),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultPadding * 4),
          ),
        ),
      ),
      onPressed: () => onTap(),
      child: Text(text),
    );
  }
}
