import 'package:flutter/material.dart';

class CustomLinkIcon extends StatelessWidget {
  const CustomLinkIcon({Key? key, this.color = Colors.black, this.size = 26})
      : super(key: key);
  final color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Row(
          children: [
            Icon(
              Icons.link,
              size: size,
              color: color, // 눌렀을 때 색상 변경
            ),
          ],
        ),
      ),
    );
  }
}
