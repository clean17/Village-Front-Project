import 'package:flutter/material.dart';

IconButton CustomBackIcon(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back_ios_new),
    onPressed: () {
      Navigator.pop(context);
    },
    color: Colors.black,
  );
}
