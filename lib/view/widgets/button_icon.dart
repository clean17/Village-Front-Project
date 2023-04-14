import 'package:flutter/material.dart';

class BottonIcon extends StatelessWidget {
  const BottonIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

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
          onPressed: () => {},
          icon: Icon(
            icon,
            size: 20,
          )),
    );
  }
}
