import 'package:flutter/material.dart';
import 'package:village/main.dart';

final mContext = navigatorKey.currentContext;

AppBar simpleAppbar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        Navigator.pop(mContext!);
      },
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
