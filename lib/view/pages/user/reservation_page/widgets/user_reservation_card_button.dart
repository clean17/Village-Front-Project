import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';

class UserReservationCardButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final Color color;

  const UserReservationCardButton({Key? key, required this.title, required this.press, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press;
      },
      child: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          title,
          style: mwhite_text,
          textAlign: TextAlign.center,
        ),
      ),
    )
    ;
  }
}
