import 'package:flutter/material.dart';

class HostStatusChip extends StatelessWidget {
  final String label;
  final Color color;
  const HostStatusChip({Key? key, required this.label, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      padding: EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: color,
      label: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      largeSize: 23,
    );
  }
}
