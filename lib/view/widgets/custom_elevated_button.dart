import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.color,
    // required this.funPress,
  });

  final String text;
  final Color color;
  // final Function funPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // 버튼의 배경색을 빨강으로 변경합니다.
        ),
        onPressed: () {
          // funPress;
        },
        child: Text(text));
  }
}
