import 'package:flutter/material.dart';
import 'package:village/view/pages/common/join_page/join_page.dart';

class AccountAction extends StatelessWidget {
  const AccountAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "이메일 찾기",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        Container(
            height: 15, child: VerticalDivider(color: Colors.grey.shade600)),
        TextButton(
          onPressed: () {},
          child: Text(
            "비밀번호 찾기",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        Container(
            height: 15, child: VerticalDivider(color: Colors.grey.shade600)),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JoinPage()),
            );
          },
          child: Text(
            "이메일 가입",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }
}
