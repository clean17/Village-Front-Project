import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/view/pages/user/join_page/widgets/join_body.dart';
import 'package:village/view/pages/user/login_page/login_page.dart';

class JoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: JoinBody(),
    );
  }
}
