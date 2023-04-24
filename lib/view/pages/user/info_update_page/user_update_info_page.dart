import 'package:flutter/material.dart';
import 'package:village/view/pages/user/info_update_page/widgets/user_update_info_body.dart';
import 'package:village/view/widgets/simple_text_appbar.dart';

class UserUpdateInfoPage extends StatelessWidget {

  UserUpdateInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: SimpleTextAppbar("내 정보 수정"),
        body: UserUpdateInfoBody(),
      ),
    );
  }
}
