import 'package:flutter/material.dart';
import 'package:village/view/pages/user/login_page/widgets/account_action.dart';
import 'package:village/view/pages/user/login_page/widgets/login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "이메일 로그인",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            LoginForm(),
            const AccountAction(),
          ],
        ),
      ),
    );
  }
}
