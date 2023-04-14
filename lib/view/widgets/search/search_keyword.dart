import 'package:flutter/material.dart';
import 'package:village/core/color.dart';

class SearchKeyword extends StatelessWidget {
  const SearchKeyword({
    super.key,
    required this.text,
  });

  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.only(top: 3, bottom: 6, left: 10, right: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
