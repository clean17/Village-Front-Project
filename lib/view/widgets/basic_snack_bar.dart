import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';

SnackBar BasicSnackBar(String msg) {
  return SnackBar(
    content: Text(msg, textAlign: TextAlign.center),
    backgroundColor: kPrimaryColor,

  );
}
