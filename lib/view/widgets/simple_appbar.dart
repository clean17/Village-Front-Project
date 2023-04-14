import 'package:flutter/material.dart';

AppBar simpleAppbar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {},
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
