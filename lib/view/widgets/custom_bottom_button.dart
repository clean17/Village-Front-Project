import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    super.key,
    required this.mWeith,
    required this.text,
    required this.funPress,
  });

  final double mWeith;
  final String text;
  final funPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: kPrimaryColor,
          minimumSize: Size(mWeith * 0.8, 40)),
      onPressed: funPress,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
