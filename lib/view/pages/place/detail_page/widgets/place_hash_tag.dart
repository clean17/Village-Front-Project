import 'package:flutter/material.dart';

class PlaceHashTag extends StatelessWidget {
  const PlaceHashTag({
    super.key,
    required this.text,
  });
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.grey[300]),
      child: const Text(
        "#해시태그",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
