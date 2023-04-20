import 'package:flutter/material.dart';

class BottonIcon extends StatelessWidget {
  const BottonIcon({
    super.key,
    required this.icon,
    required this.funPress,
  });

  final IconData icon;
  final funPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
          onPressed: funPress,
          icon: Icon(
            icon,
            size: 20,
          )),
    );
  }
}
