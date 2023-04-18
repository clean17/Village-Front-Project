import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:village/core/constants/style.dart';

AppBar placeAppbar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {},
      color: Colors.black,
    ),
    actions: const [
      Icon(
        Icons.link,
        color: Colors.black,
      ),
      SizedBox(
        width: 20,
      ),
      Icon(
        Icons.security_sharp,
        color: Colors.black,
      ),
      SizedBox(
        width: 15,
      ),
    ],
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark, // 최상단
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
