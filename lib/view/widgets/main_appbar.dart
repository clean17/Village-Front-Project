import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';

AppBar MainAppbar() {
  return AppBar(
    title: Text(
      "VILLAGE",
      style: TextStyle(
          color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 25),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.chat_outlined),
        color: Colors.black,
        iconSize: 30,
      )
    ],
  );
}
