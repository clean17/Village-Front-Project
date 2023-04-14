import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function? press;

  const MyButton({Key? key, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.06,
      child: OutlinedButton(
        onPressed: press as void Function()?,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade200, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            "이메일 로그인", style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
