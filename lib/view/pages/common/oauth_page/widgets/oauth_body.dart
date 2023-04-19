import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/view/pages/common/join_page/join_page.dart';
import 'package:village/view/pages/common/oauth_page/widgets/oauth_email_join_button.dart';
import 'package:village/view/pages/common/oauth_page/widgets/oauth_email_login_button.dart';
import 'package:village/view/pages/common/oauth_page/widgets/oauth_header.dart';
import 'package:village/view/pages/common/oauth_page/widgets/oauth_icon.dart';

class OauthBody extends StatelessWidget {
  const OauthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.15),
            OauthHeader(),
            SizedBox(height: size.height * 0.01),
            Image.asset(
                "assets/images/undraw_Team_collaboration_re_ow29.png"),
            SizedBox(height: size.height * 0.03),
            Text(
              "소셜계정 및 간편로그인",
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: size.height * 0.03),
            OauthIcon(),
            SizedBox(height: size.height * 0.03),
            OauthEmailLoginButton(),
            SizedBox(height: size.height * 0.03),
            OauthEmailJoinButton(),
          ],
        ),
      ),
    );
  }


}
