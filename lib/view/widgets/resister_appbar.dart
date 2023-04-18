import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';

AppBar ResisterAppbar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {},
      color: Colors.black,
    ),
    centerTitle: true,
    title: const Text(
      '공간 등록',
      style: mlarge_black_text,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
