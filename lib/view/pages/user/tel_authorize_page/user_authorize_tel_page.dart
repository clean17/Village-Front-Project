import 'package:flutter/material.dart';
import 'package:village/view/pages/user/tel_authorize_page/widgets/user_authorize_tel_body.dart';

class UserAuthorizeTelPage extends StatelessWidget {

  UserAuthorizeTelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: UserAuthorizeTelBody(),
      ),
    );
  }

}
