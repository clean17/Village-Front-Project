import 'package:flutter/material.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/view/pages/user/login_page/login_page.dart';

class OauthEmailLoginButton extends StatelessWidget {
  const OauthEmailLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.06,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, Move.loginPage);
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade200, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Center(
          child: Text(
            "이메일 로그인",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
