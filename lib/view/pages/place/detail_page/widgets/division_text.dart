import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';

class DivisionText extends StatelessWidget {
  const DivisionText({
    super.key,
    required this.text,
  });
  final text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: mlarge_black_text,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
