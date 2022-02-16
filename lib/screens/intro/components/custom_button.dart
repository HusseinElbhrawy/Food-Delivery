import 'package:flutter/material.dart';

import '../../../shared/config/const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(width / 1.5, height / 15)),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xffFF5556),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultPadding * 4),
          ),
        ),
      ),
      onPressed: () {},
      child: const Text('Let’s Order 😋'),
    );
  }
}
