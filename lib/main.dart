import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/view/pages/place/place_category_page.dart';
import 'package:village/view/pages/review/review_write_page.dart';
import 'package:village/view/pages/chat/chat_room_page.dart';
import 'package:village/view/pages/common/oauth_page.dart';
import 'package:village/view/pages/common/join_page.dart';
import 'package:village/view/pages/common/login_page.dart';
import 'package:village/view/pages/common/oauth_page.dart';
import 'package:village/view/pages/common/splash_page.dart';
import 'package:village/view/pages/main/main_page.dart';
import 'view/pages/common/notice_page.dart';



void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primaryColor: Colors.white,
          ),
      debugShowCheckedModeBanner: false, // 화면에 디버그 제거
      home: MainPage(), // 클래스 분리

    );
  }
}
