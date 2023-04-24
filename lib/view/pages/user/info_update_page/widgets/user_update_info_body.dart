import 'package:flutter/material.dart';
import 'package:village/view/pages/user/info_update_page/widgets/profile_pic.dart';
import 'package:village/view/pages/user/info_update_page/widgets/update_form.dart';

class UserUpdateInfoBody extends StatelessWidget {
  const UserUpdateInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
