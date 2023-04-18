import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';

AppBar SimpleCloseAppbar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.close,
        size: 26,
      ),
      onPressed: () {},
      color: Colors.black,
    ),
    centerTitle: true,
    title: const Text(
      '필터',
      style: mxlarge_black_text,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
