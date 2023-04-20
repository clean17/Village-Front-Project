import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/view/pages/user/info_update_page/widgets/profile_pic.dart';
import 'package:village/view/pages/user/info_update_page/widgets/update_form.dart';
import 'package:village/view/widgets/simple_text_appbar.dart';

class UserUpdateInfoPage extends StatelessWidget {

  UserUpdateInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: SimpleTextAppbar("내 정보 수정"),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePic(),
                const SizedBox(height: 30),
                UpdateForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
