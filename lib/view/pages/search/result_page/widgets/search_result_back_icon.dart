import 'package:flutter/material.dart';
import 'package:village/core/constants/move.dart';

IconButton SearchResultBackIcon(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back_ios_new),
    onPressed: () {
      Navigator.popAndPushNamed(context, Move.mainPage);
    },
    color: Colors.black,
  );
}
