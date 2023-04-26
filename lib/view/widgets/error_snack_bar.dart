import 'package:flutter/material.dart';

SnackBar ErrorSnackBar(String msg) {
  return SnackBar(
    content: Text(msg, textAlign: TextAlign.center,),
    backgroundColor: Colors.red[400],

  );
}
