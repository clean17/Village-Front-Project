import 'package:flutter/material.dart';
import 'package:village/core/color.dart';

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
