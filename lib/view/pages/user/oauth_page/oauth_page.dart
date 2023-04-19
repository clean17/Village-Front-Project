import 'package:flutter/material.dart';
import 'package:village/view/pages/user/oauth_page/widgets/oauth_body.dart';

class OAuthPage extends StatelessWidget {
  const OAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: OauthBody(),
    );
  }
}
