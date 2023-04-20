import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/main.dart';

final mContext = navigatorKey.currentContext;

class CustomCloseAppbar extends AppBar {
  final String text;
  CustomCloseAppbar({super.key, required this.text})
      : super(
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(mContext!);
            },
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            text,
            style: mxlarge_black_text,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        );
}
