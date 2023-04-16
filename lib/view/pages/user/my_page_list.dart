import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';


class MyPageList extends StatelessWidget {
  const MyPageList({Key? key, required this.title, required this.press}) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: mblack_text,),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 17,
          ),
        ],
      ),
    );
  }
}
