import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.color,
    required this.text,
    required this.funPress,
  });

  final Color color;
  final String text;
  final funPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: funPress,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 6),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: mwhite_text,
        ),
      ),
    );
  }
}
