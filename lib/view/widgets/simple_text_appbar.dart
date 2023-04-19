
import 'package:flutter/material.dart';

AppBar SimpleTextAppbar(String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    title: Text(title, style: TextStyle(color: Colors.black),),
    centerTitle: true,
  );
}
