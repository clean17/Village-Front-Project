import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:village/core/constants/style.dart';
=======
import 'package:village/core/style.dart';
>>>>>>> 79862a4 (등록 페이지 초안중)

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
