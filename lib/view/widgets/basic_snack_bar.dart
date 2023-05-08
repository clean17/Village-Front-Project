import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';

SnackBar BasicSnackBar(String msg) {
  return SnackBar(
    behavior: SnackBarBehavior.fixed,
    content: Text(msg, textAlign: TextAlign.center),
    backgroundColor: kPrimaryColor,

  );
}
