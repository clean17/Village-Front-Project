import 'package:flutter/material.dart';
import 'package:village/view/pages/user/oauth_page/widgets/oauth_email_join_button.dart';
import 'package:village/view/pages/user/oauth_page/widgets/oauth_email_login_button.dart';
import 'package:village/view/pages/user/oauth_page/widgets/oauth_header.dart';
import 'package:village/view/pages/user/oauth_page/widgets/oauth_icon.dart';

class OauthBody extends StatelessWidget {
  const OauthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Expanded(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.15),
              const OauthHeader(),
              SizedBox(height: size.height * 0.01),
              Image.asset(
                  "assets/images/undraw_Team_collaboration_re_ow29.png"),
              SizedBox(height: size.height * 0.03),
              Text(
                "소셜계정 및 간편로그인",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              SizedBox(height: size.height * 0.03),
              const OauthIcon(),
              SizedBox(height: size.height * 0.03),
              const OauthEmailLoginButton(),
              SizedBox(height: size.height * 0.03),
              const OauthEmailJoinButton(),
            ],
          ),
        ),
      ),
    );
  }
}
