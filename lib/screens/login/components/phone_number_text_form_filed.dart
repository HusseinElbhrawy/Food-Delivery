import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../shared/config/components.dart';

class PhoneNumberTextFormFiled extends StatelessWidget {
  const PhoneNumberTextFormFiled({
    Key? key,
    required this.validateMessage,
    required this.controller,
  }) : super(key: key);
  final String validateMessage;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty || value == null) {
          return validateMessage;
        }
        return null;
      },
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      decoration: InputDecoration(
        hintText: 'Your Phone Number',
        hintStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 18),
        fillColor: Colors.white,
        filled: true,
        alignLabelWithHint: true,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
      initialCountryCode: 'EG',
    );
  }
}
