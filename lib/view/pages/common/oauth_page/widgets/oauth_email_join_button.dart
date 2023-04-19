import 'package:flutter/material.dart';
import 'package:village/view/pages/common/join_page/join_page.dart';

class OauthEmailJoinButton extends StatelessWidget {
  const OauthEmailJoinButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "아직 계정이 없으신가요?",
          style: TextStyle(color: Colors.grey.shade600),
        ),
        SizedBox(width: size.width * 0.01),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JoinPage(),
                ));
          },
          child: Text(
            "회원가입",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
