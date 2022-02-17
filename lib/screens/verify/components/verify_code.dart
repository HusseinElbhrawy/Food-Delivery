import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../../shared/config/const.dart';

class VerifyCodeForm extends StatelessWidget {
  const VerifyCodeForm({
    Key? key,
    required this.width,
    required FocusNode pinPutFocusNode,
    required TextEditingController pinPutController,
    required BoxDecoration pinPutDecoration,
  })  : _pinPutFocusNode = pinPutFocusNode,
        _pinPutController = pinPutController,
        _pinPutDecoration = pinPutDecoration,
        super(key: key);

  final double width;
  final FocusNode _pinPutFocusNode;
  final TextEditingController _pinPutController;
  final BoxDecoration _pinPutDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(kDefaultPadding * 3),
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? width / 1.2
          : width / 2.5,
      child: PinPut(
        fieldsCount: 4,
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: _pinPutDecoration.copyWith(
            borderRadius: BorderRadius.circular(kDefaultPadding * 1)),
        selectedFieldDecoration: _pinPutDecoration,
        followingFieldDecoration: _pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(kDefaultPadding * 1.5),
          border: Border.all(color: Colors.white),
        ),
      ),
    );
  }
}
