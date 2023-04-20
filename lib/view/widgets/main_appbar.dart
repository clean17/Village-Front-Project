import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/move.dart';




AppBar MainAppbar(BuildContext context) {
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
        onPressed: () {
          Navigator.pushNamed(context, Move.chatRoomPage);
        },
        icon: const Icon(Icons.chat_outlined),
        color: Colors.grey,
        iconSize: 30,

      ),
      SizedBox(
        width: 10,
      )
    ],
  );
}
