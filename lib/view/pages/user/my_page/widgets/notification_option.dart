import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';

class NotificationOption extends StatefulWidget {
  final String title;


  NotificationOption({Key? key, required this.title}) : super(key: key);

  @override
  State<NotificationOption> createState() => _NotificationOptionState();
}

class _NotificationOptionState extends State<NotificationOption> {

  bool valNotify = true;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: mblack_text,
        ),
        Transform.scale(
          scale: 0.7,
          child: SizedBox(
            height: 20,
            width: 40,
            child: CupertinoSwitch(
              activeColor: kPrimaryColor,
              trackColor: Colors.grey,
              value: valNotify,
              onChanged: (bool newValue) {
                setState(() {
                  valNotify = newValue;
                });
              }
            ),
          ),
        ),
      ],
    );
  }
}
