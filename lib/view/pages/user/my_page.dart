import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:village/core/constants/color.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/common/notice_page.dart';
import 'package:village/view/pages/user/my_reservation_page.dart';
import 'package:village/view/pages/user/my_scrap_page.dart';
import 'package:village/view/pages/user/widgets/my_page_list.dart';
import 'package:village/view/widgets/bottom_button.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool valNotify = true;

  onChangeFunction(bool newValue) {
    setState(() {
      valNotify = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "마이페이지",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              print("호스트화면");
            },
            child: Text(
              "호스트페이지",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              height: 70,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: kPrimaryLightColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "빌리지 회원가입 / 로그인",
                        style: mwhite_text,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: 15, thickness: 2),
            SizedBox(height: 20),
            MyPageList(title: "예약내역", press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyReservationPage(),
                  ));
            }),
            SizedBox(height: 30),
            MyPageList(
                title: "공지사항",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoticePage(),
                      ));
                }),
            SizedBox(height: 30),
            MyPageList(title: "자주 묻는 질문", press: () {

            }),
            SizedBox(height: 30),
            MyPageList(title: "스크랩", press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyScrapPage(),
                  ));
            }),
            SizedBox(height: 30),
            MyPageList(title: "호스트신청", press: () {}),
            SizedBox(height: 30),
            NotificationOption("알림 설정", valNotify, onChangeFunction),
            SizedBox(height: 30),
            MyPageList(title: "현재 버전", press: () {}),
          ],
        ),
      ),
    );
  }

  Widget NotificationOption(String title, bool value, Function onChangeMethod) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: mblack_text,
        ),
        Transform.scale(
          scale: 0.7,
          child: SizedBox(
            height: 20,
            width: 40,
            child: CupertinoSwitch(
              activeColor: kPrimaryColor,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
