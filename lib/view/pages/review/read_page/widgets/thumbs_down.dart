import 'package:flutter/material.dart';

Widget ThumbsDown() {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: Colors.black12,
        )),
    child: const Icon(Icons.thumb_down, color: Colors.black26),
  );
}
