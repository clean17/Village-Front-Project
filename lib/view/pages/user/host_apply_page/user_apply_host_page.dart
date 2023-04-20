import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/user/host_apply_page/widgets/host_apply_form.dart';
import 'package:village/view/pages/user/host_apply_page/widgets/user_apply_host_body.dart';

class UserApplyHostPage extends StatelessWidget {

  UserApplyHostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserApplyHostBody();
  }
}

