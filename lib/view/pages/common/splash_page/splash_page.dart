import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:village/view/pages/main/main_page/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  // }

  // 두가지 방법이 있음 먼저 스플래쉬 페이지를 렌더링 하고 비동기 작업을 진행 - Future 함수를 이용
  // 현재 방법으로 스플레쉬 페이지를 잠깐 보여주는 방식

  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1600), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ));
    });
  }

  // startTimer() {
  //   var duration = const Duration(seconds: 4);
  //   return Timer(duration, route);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),
        child: Column(
          children: [
            Image.asset("assets/images/village.png"),
            Lottie.asset("assets/79726-walk-and-type.json"),
          ],
        ),
      ),
    );
  }
}
