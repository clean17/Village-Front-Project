import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/provider/session_provider.dart';
import 'package:village/view/pages/common/notice_page/notice_page.dart';
import 'package:village/view/pages/user/host_apply_page/user_apply_host_page.dart';
import 'package:village/view/pages/user/my_page/widgets/logout_alert_dialog.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_header.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_info_update_button.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_list.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_login_button.dart';
import 'package:village/view/pages/user/my_page/widgets/my_page_scrap.dart';
import 'package:village/view/pages/user/my_page/widgets/notification_option.dart';
import 'package:village/view/pages/user/reservation_page/user_reservation_page.dart';
import 'package:village/view/pages/user/scrap_page/user_scrap_page.dart';

class MyPageBody extends ConsumerWidget {
  const MyPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          const MyPageHeader(),
          sessionUser.isLogin!
              ? const MyPageInfoUpdateButton()
              : const MyPageLoginButton(),
          const Divider(height: 15, thickness: 2),
          const SizedBox(height: 20),
          MyPageList(
              title: "예약내역",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserReservationPage(),
                    ));
              }),
          const SizedBox(height: 30),
          MyPageList(
              title: "공지사항",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NoticePage(),
                    ));
              }),
          const SizedBox(height: 30),
          MyPageList(title: "자주 묻는 질문", press: () {}),
          const SizedBox(height: 30),
          MyPageList(
              title: "스크랩",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserScarpPage(),
                    ));
              }),
          const SizedBox(height: 30),
          NotificationOption(title: "알림 설정"),
          const SizedBox(height: 30),
          MyPageScrap(),
          const SizedBox(height: 30),
          MyPageList(title: "현재 버전", press: () {}),
          const SizedBox(height: 30),
          sessionUser.isLogin!
              ? MyPageList(
                  title: "로그아웃",
                  press: () {
                    showDialog(
                        context: context,
                        builder: (context) => const LogoutAlertDialog());
                  })
              : const SizedBox()
        ],
      ),
    );
  }
}
