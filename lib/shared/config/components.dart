import 'package:flutter/material.dart';

import 'const.dart';

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(kDefaultPadding * 4),
    borderSide: const BorderSide(color: Colors.white),
  );
}
