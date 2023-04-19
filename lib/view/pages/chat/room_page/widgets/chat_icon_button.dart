import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {
  const ChatIconButton({Key? key, required this.icon}) : super(key: key);

  final icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: icon,
      padding: EdgeInsets.symmetric(horizontal: 15),
      iconSize: 25,
    );
  }
}
