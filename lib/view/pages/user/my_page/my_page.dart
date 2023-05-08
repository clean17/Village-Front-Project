import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/move.dart';
import 'package:village/view/pages/common/notice_page/notice_page.dart';
import 'package:village/view/pages/host/resister_place_page/widgets/resister_appbar.dart';
import 'package:village/view/pages/user/host_apply_page/user_apply_host_page.dart';
import 'package:village/view/pages/user/my_page/widgets/logout_alert_dialog.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_body.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_header.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_login_button.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_list.dart';
import 'package:village/view/pages/user/my_page/widgets/notification_option.dart';
import 'package:village/view/pages/user/reservation_page/user_reservation_page.dart';
import 'package:village/view/pages/user/scrap_page/user_scrap_page.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.popAndPushNamed(mContext!, Move.mainPage);

          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "VILLAGE",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: const MyPageBody(),
        ));
  }
}
