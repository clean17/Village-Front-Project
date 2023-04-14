import 'package:flutter/material.dart';
import 'package:village/core/color.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.mWeith,
  });

  final double mWeith;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor, minimumSize: Size(mWeith * 0.8, 40)),
      onPressed: () {},
      child: const Text(
        '예약하기',
        style: TextStyle(),
      ),
    );
  }
}
