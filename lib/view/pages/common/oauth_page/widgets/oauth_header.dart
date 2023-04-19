import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';

class OauthHeader extends StatelessWidget {
  const OauthHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: 'VILLAGE',
                  style: TextStyle(color: kPrimaryColor)),
              TextSpan(text: '에서 '),
              TextSpan(text: '\n즐거운 공간을 찾아보세요!'),
            ]));
  }
}
