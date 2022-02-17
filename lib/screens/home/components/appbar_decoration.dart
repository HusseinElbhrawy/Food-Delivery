import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../shared/config/colors.dart';
import '../../../shared/config/const.dart';

class AppBarDecoration extends StatelessWidget {
  AppBarDecoration({
    Key? key,
    required this.items,
    required this.selectedValue,
  }) : super(key: key);
  final List<String> items;
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(kCustomAppBarColor),
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(90),
          bottomStart: Radius.circular(90),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // const Spacer(flex: 2),
            CustomDropdownButton2(
              hint: 'New Your,USA',
              dropdownItems: items,
              value: selectedValue,
              buttonDecoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              onChanged: (value) {
                selectedValue = value;
              },
            ),
            // SizedBox(height: 100),

            const SizedBox(height: 30),
            Text(
              'What would you like to eat today 😋 ',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 30),

            // const Spacer(),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              heightFactor: 1,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: kDefaultPadding * 2,
                  end: kDefaultPadding * 2,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
            ),
            // const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
