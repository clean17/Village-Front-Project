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

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Lottie.asset("assets/79726-walk-and-type.json"),
      ),
    );
  }
}
