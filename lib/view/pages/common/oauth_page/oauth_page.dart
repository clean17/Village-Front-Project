import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/view/pages/common/join_page/join_page.dart';
import 'package:village/view/pages/common/login_page/login_page.dart';
import 'package:village/view/pages/common/oauth_page/widgets/oauth_email_login_button.dart';
import 'package:village/view/pages/common/oauth_page/widgets/oauth_body.dart';
import 'package:village/view/pages/common/oauth_page/widgets/square_tile.dart';

class OauthPage extends StatelessWidget {
  const OauthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: OauthBody(),
    );
  }
}
