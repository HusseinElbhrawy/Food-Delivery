import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../shared/config/components.dart';

class PhoneNumberTextFormFiled extends StatelessWidget {
  const PhoneNumberTextFormFiled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        hintText: 'Your Phone Number',
        hintStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 18),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
      initialCountryCode: 'EG',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
